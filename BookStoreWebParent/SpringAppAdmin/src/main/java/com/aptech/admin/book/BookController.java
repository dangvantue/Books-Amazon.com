package com.aptech.admin.book;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aptech.admin.FileUploadUtil;
import com.aptech.admin.author.AuthorService;
import com.aptech.admin.category.CategoryService;
import com.aptech.common.entity.Author;
import com.aptech.common.entity.Category;
import com.aptech.common.entity.book.Book;
import com.aptech.common.entity.book.BookImage;


@Controller
public class BookController {
	private static final Logger LOGGER = LoggerFactory.getLogger(BookController.class);
			
	@Autowired private BookService bookService;
	@Autowired private AuthorService authorService;
	@Autowired private CategoryService categoryService;
	
	@GetMapping("/books")
	public String listFirstPage(Model model) {
		return listByPage(1, model, "name", "asc", null);
	}
	
	@GetMapping("/books/page/{pageNum}")
	public String listByPage(
			@PathVariable(name = "pageNum") int pageNum, Model model,
			@Param("sortField") String sortField, @Param("sortDir") String sortDir,
			@Param("keyword") String keyword
			) {
		Page<Book> page = bookService.listByPage(pageNum, sortField, sortDir, keyword);
		List<Book> listBooks = page.getContent();
		
		List<Category> listCategories = categoryService.listCategoriesUsedInForm();
		
		long startCount = (pageNum - 1) * BookService.PRODUCTS_PER_PAGE + 1;
		long endCount = startCount + BookService.PRODUCTS_PER_PAGE - 1;
		if (endCount > page.getTotalElements()) {
			endCount = page.getTotalElements();
		}
		
		String reverseSortDir = sortDir.equals("asc") ? "desc" : "asc";
		
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("startCount", startCount);
		model.addAttribute("endCount", endCount);
		model.addAttribute("totalItems", page.getTotalElements());
		model.addAttribute("sortField", sortField);
		model.addAttribute("sortDir", sortDir);
		model.addAttribute("reverseSortDir", reverseSortDir);
		model.addAttribute("keyword", keyword);		
		model.addAttribute("listBooks", listBooks);
		model.addAttribute("listCategories", listCategories);
		
		return "books/books";		
	}
	
	@GetMapping("/books/new")
	public String newBook(Model model) {
		List<Author> listAuthors = authorService.listAll();
		
		Book book = new Book();
		book.setStatus(true);
		book.setInStock(true);
		
		model.addAttribute("book", book);
		model.addAttribute("listAuthors", listAuthors);
		model.addAttribute("pageTitle", "Create New Book");
		model.addAttribute("numberOfExistingExtraImages", 0);
		
		return "books/book_form";
	}
	
	@PostMapping("/books/save")
	public String saveBook(Book book, RedirectAttributes ra,
			@RequestParam("fileImage") MultipartFile mainImageMultipart,			
			@RequestParam("extraImage") MultipartFile[] extraImageMultiparts,
			@RequestParam(name = "detailIDs", required = false) String[] detailIDs,
			@RequestParam(name = "detailNames", required = false) String[] detailNames,
			@RequestParam(name = "detailValues", required = false) String[] detailValues,
			@RequestParam(name = "imageIDs", required = false) String[] imageIDs,
			@RequestParam(name = "imageNames", required = false) String[] imageNames
			) 
					throws IOException {
		setMainImageName(mainImageMultipart, book);
		setExistingExtraImageNames(imageIDs, imageNames, book);
		setNewExtraImageNames(extraImageMultiparts, book);
		setBookDetails(detailIDs, detailNames, detailValues, book);
			
		Book savedBook = bookService.save(book);
		
		saveUploadedImages(mainImageMultipart, extraImageMultiparts, savedBook);
		
		deleteExtraImagesWeredRemovedOnForm(book);
		
		ra.addFlashAttribute("message", "The book has been saved successfully.");
		
		return "redirect:/books";
	}
	
	private void deleteExtraImagesWeredRemovedOnForm(Book book) {
		String extraImageDir = "../book-images/" + book.getId() + "/extras";
		Path dirPath = Paths.get(extraImageDir);
		
		try {
			Files.list(dirPath).forEach(file -> {
				String filename = file.toFile().getName();
				
				if (!book.containsImageName(filename)) {
					try {
						Files.delete(file);
						LOGGER.info("Deleted extra image: " + filename);
						
					} catch (IOException e) {
						LOGGER.error("Could not delete extra image: " + filename);
					}
				}
				
			});
		} catch (IOException ex) {
			LOGGER.error("Could not list directory: " + dirPath);
		}
	}

	private void setExistingExtraImageNames(String[] imageIDs, String[] imageNames, 
			Book book) {
		if (imageIDs == null || imageIDs.length == 0) return;
		
		Set<BookImage> images = new HashSet<>();
		
		for (int count = 0; count < imageIDs.length; count++) {
			Integer id = Integer.parseInt(imageIDs[count]);
			String name = imageNames[count];
			
			images.add(new BookImage(id, name, book));
		}
		
		book.setImages(images);
		
	}

	private void setBookDetails(String[] detailIDs, String[] detailNames, 
			String[] detailValues, Book book) {
		if (detailNames == null || detailNames.length == 0) return;
		
		for (int count = 0; count < detailNames.length; count++) {
			String name = detailNames[count];
			String value = detailValues[count];
			Integer id = Integer.parseInt(detailIDs[count]);
			
			if (id != 0) {
				book.addDetail(id, name, value);
			} else if (!name.isEmpty() && !value.isEmpty()) {
				book.addDetail(name, value);
			}
		}
	}

	private void saveUploadedImages(MultipartFile mainImageMultipart, 
			MultipartFile[] extraImageMultiparts, Book savedBook) throws IOException {
		if (!mainImageMultipart.isEmpty()) {
			String fileName = StringUtils.cleanPath(mainImageMultipart.getOriginalFilename());
			String uploadDir = "../book-images/" + savedBook.getId();
			
			FileUploadUtil.cleanDir(uploadDir);
			FileUploadUtil.saveFile(uploadDir, fileName, mainImageMultipart);		
		}
		
		if (extraImageMultiparts.length > 0) {
			String uploadDir = "../book-images/" + savedBook.getId() + "/extras";
			
			for (MultipartFile multipartFile : extraImageMultiparts) {
				if (multipartFile.isEmpty()) continue;
				
				String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
				FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
			}
		}
		
	}

	private void setNewExtraImageNames(MultipartFile[] extraImageMultiparts, Book book) {
		if (extraImageMultiparts.length > 0) {
			for (MultipartFile multipartFile : extraImageMultiparts) {
				if (!multipartFile.isEmpty()) {
					String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
					
					if (!book.containsImageName(fileName)) {
						book.addExtraImage(fileName);
					}
				}
			}
		}
	}

	private void setMainImageName(MultipartFile mainImageMultipart, Book book) {
		if (!mainImageMultipart.isEmpty()) {
			String fileName = StringUtils.cleanPath(mainImageMultipart.getOriginalFilename());
			book.setMainImage(fileName);
		}
	}
	
	@GetMapping("/books/{id}/enabled/{status}")
	public String updateCategoryEnabledStatus(@PathVariable("id") Integer id,
			@PathVariable("status") boolean enabled, RedirectAttributes redirectAttributes) {
		bookService.updateBookEnabledStatus(id, enabled);
		String status = enabled ? "enabled" : "disabled";
		String message = "The Book ID " + id + " has been " + status;
		redirectAttributes.addFlashAttribute("message", message);
		
		return "redirect:/books";
	}
	
	@GetMapping("/books/delete/{id}")
	public String deleteBook(@PathVariable(name = "id") Integer id, 
			Model model,
			RedirectAttributes redirectAttributes) {
		try {
			bookService.delete(id);
			String bookExtraImagesDir = "../book-images/" + id + "/extras";
			String bookImagesDir = "../book-images/" + id;
			
			FileUploadUtil.removeDir(bookExtraImagesDir);
			FileUploadUtil.removeDir(bookImagesDir);
			
			redirectAttributes.addFlashAttribute("message", 
					"The book ID " + id + " has been deleted successfully");
		} catch (BookNotFoundException ex) {
			redirectAttributes.addFlashAttribute("message", ex.getMessage());
		}
		
		return "redirect:/books";
	}
	
	@GetMapping("/books/edit/{id}")
	public String editBook(@PathVariable("id") Integer id, Model model,
			RedirectAttributes ra) {
		try {
			Book book = bookService.get(id);
			List<Author> listAuthors = authorService.listAll();
			Integer numberOfExistingExtraImages = book.getImages().size();
			
			model.addAttribute("book", book);
			model.addAttribute("listAuthors", listAuthors);
			model.addAttribute("pageTitle", "Edit Book (ID: " + id + ")");
			model.addAttribute("numberOfExistingExtraImages", numberOfExistingExtraImages);
			
			
			return "books/book_form";
			
		} catch (BookNotFoundException e) {
			ra.addFlashAttribute("message", e.getMessage());
			
			return "redirect:/books";
		}
	}
	
	@GetMapping("/books/detail/{id}")
	public String viewBookDetails(@PathVariable("id") Integer id, Model model,
			RedirectAttributes ra) {
		try {
			Book book = bookService.get(id);			
			model.addAttribute("book", book);		
			
			return "books/book_detail_modal";
			
		} catch (BookNotFoundException e) {
			ra.addFlashAttribute("message", e.getMessage());
			
			return "redirect:/books";
		}
	}	
}
