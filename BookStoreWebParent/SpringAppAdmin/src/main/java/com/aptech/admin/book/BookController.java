package com.aptech.admin.book;

import org.springframework.util.StringUtils;

import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.aptech.admin.FileUploadUtil;
import com.aptech.admin.author.AuthorService;
import com.aptech.common.entity.Author;
import com.aptech.common.entity.Book;

@Controller
@Transactional
public class BookController {
	@Autowired
	private BookService bookService;
	
	@Autowired
	private AuthorService authorService;

	@GetMapping("/books")
	public String listAll(Model model) {
		List<Book> listBooks = bookService.listAll();

		model.addAttribute("listBooks", listBooks);

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

		return "books/book_form";
	}

	@PostMapping("/books/save")
	public String saveBook(Book book, RedirectAttributes ra, @RequestParam("fileImage") MultipartFile multipartFile) throws IOException {
		if (!multipartFile.isEmpty()) {
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
			book.setMainImage(fileName);
			
			Book savedBook = bookService.save(book);
			String uploadDir = "../book-images/" + savedBook.getId();
			
			FileUploadUtil.cleanDir(uploadDir);
			FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
			
		} else {
			bookService.save(book);
		}
		
		
		ra.addFlashAttribute("message", "The book has been saved successfully.");
		
		return "redirect:/books";
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
			
			redirectAttributes.addFlashAttribute("message", 
					"The book ID " + id + " has been deleted successfully");
		} catch (BookNotFoundException ex) {
			redirectAttributes.addFlashAttribute("message", ex.getMessage());
		}
		
		return "redirect:/books";
	}	
}
