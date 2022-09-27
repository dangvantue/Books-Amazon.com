package com.aptech.admin.author;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.util.StringUtils;

import com.aptech.admin.AmazonS3Util;
import com.aptech.admin.FileUploadUtil;
import com.aptech.admin.category.CategoryService;
import com.aptech.common.entity.Author;
import com.aptech.common.entity.Category;

@Controller
public class AuthorController {
	@Autowired
	private AuthorService authorService;

	@Autowired
	private CategoryService categoryService;

	@GetMapping("/authors")
	public String listFirstPage(Model model) {
		return listByPage(1, model, "name", "asc", null);
	}
	
	@GetMapping("/authors/page/{pageNum}")
	public String listByPage(
			@PathVariable(name = "pageNum") int pageNum, Model model,
			@Param("sortField") String sortField, @Param("sortDir") String sortDir,
			@Param("keyword") String keyword
			) {
		Page<Author> page = authorService.listByPage(pageNum, sortField, sortDir, keyword);
		List<Author> listAuthors = page.getContent();
		
		long startCount = (pageNum - 1) * AuthorService.AUTHORS_PER_PAGE + 1;
		long endCount = startCount + AuthorService.AUTHORS_PER_PAGE - 1;
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
		model.addAttribute("listAuthors", listAuthors);
		
		return "authors/authors";		
	}

	@GetMapping("/authors/new")
	public String newAuthor(Model model) {
		List<Category> listCategories = categoryService.listCategoriesUsedInForm();

		model.addAttribute("listCategories", listCategories);
		model.addAttribute("author", new Author());
		model.addAttribute("pageTitle", "Create New Author");

		return "authors/author_form";
	}
	
	@PostMapping("/authors/save")
	public String saveAuthor(Author author, @RequestParam("fileImage") MultipartFile multipartFile,
			RedirectAttributes ra) throws IOException {
		if (!multipartFile.isEmpty()) {
			String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
			author.setImage(fileName);
			
			Author savedAuthor = authorService.save(author);
//			String uploadDir = "../author-images/" + savedAuthor.getId();
			
//			FileUploadUtil.cleanDir(uploadDir);
//			FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
			
			/* Save File Upload AWS */
			String uploadDir = "author-images/" + savedAuthor.getId();
			AmazonS3Util.removeFolder(uploadDir);
			AmazonS3Util.uploadFile(uploadDir, fileName, multipartFile.getInputStream());
			
		} else {
			authorService.save(author);
		}
		
		ra.addFlashAttribute("message", "The author has been saved successfully.");
		return "redirect:/authors";		
	}
	
	@GetMapping("/authors/edit/{id}")
	public String editAuthor(@PathVariable(name = "id") Integer id, Model model,
			RedirectAttributes ra) {
		try {
			Author author = authorService.get(id);
			List<Category> listCategories = categoryService.listCategoriesUsedInForm();
			
			model.addAttribute("author", author);
			model.addAttribute("listCategories", listCategories);
			model.addAttribute("pageTitle", "Edit Author (ID: " + id + ")");
			
			return "authors/author_form";			
		} catch (AuthorNotFoundException ex) {
			ra.addFlashAttribute("message", ex.getMessage());
			return "redirect:/authors";
		}
	}
	
	@GetMapping("/authors/delete/{id}")
	public String deleteAuthor(@PathVariable(name = "id") Integer id, 
			Model model,
			RedirectAttributes redirectAttributes) {
		try {
			authorService.delete(id);
//			String authorDir = "../author-images/" + id;
//			FileUploadUtil.removeDir(authorDir);
			
			/* Delete file Amazon S3 */
			String authorDir = "author-images/" + id;
			AmazonS3Util.removeFolder(authorDir);
			
			redirectAttributes.addFlashAttribute("message", 
					"The author ID " + id + " has been deleted successfully");
		} catch (AuthorNotFoundException ex) {
			redirectAttributes.addFlashAttribute("message", ex.getMessage());
		}
		
		return "redirect:/authors";
	}	
}
