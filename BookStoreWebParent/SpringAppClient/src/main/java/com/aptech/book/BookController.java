package com.aptech.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.aptech.ControllerHelper;
import com.aptech.Utility;
import com.aptech.category.CategoryService;
import com.aptech.common.entity.Category;
import com.aptech.common.entity.Customer;
import com.aptech.common.entity.Review;
import com.aptech.common.entity.book.Book;
import com.aptech.common.exception.BookNotFoundException;
import com.aptech.common.exception.CategoryNotFoundException;
import com.aptech.customer.CustomerService;
import com.aptech.review.ReviewService;
import com.aptech.review.vote.ReviewVoteService;

@Controller
public class BookController {
	@Autowired private BookService bookService;
	@Autowired private CategoryService categoryService;
	@Autowired private ReviewService reviewService;
	@Autowired private ControllerHelper controllerHelper;
	@Autowired private ReviewVoteService voteService;

	@GetMapping("/c/{category_alias}")
	public String viewCategoryFirstPage(@PathVariable("category_alias") String alias,
			Model model) {
		return viewCategoryByPage(alias, 1, model);
	}
	
	@GetMapping("/c/{category_alias}/page/{pageNum}")
	public String viewCategoryByPage(@PathVariable("category_alias") String alias,
			@PathVariable("pageNum") int pageNum,
			Model model) {
		try {
			Category category = categoryService.getCategory(alias);		
			List<Category> listCategoryParents = categoryService.getCategoryParents(category);
			
			Page<Book> pageBooks = bookService.listByCategory(pageNum, category.getId());
			List<Book> listBooks = pageBooks.getContent();
			
			long startCount = (pageNum - 1) * BookService.BOOKS_PER_PAGE + 1;
			long endCount = startCount + BookService.BOOKS_PER_PAGE - 1;
			if (endCount > pageBooks.getTotalElements()) {
				endCount = pageBooks.getTotalElements();
			}
			
			
			model.addAttribute("currentPage", pageNum);
			model.addAttribute("totalPages", pageBooks.getTotalPages());
			model.addAttribute("startCount", startCount);
			model.addAttribute("endCount", endCount);
			model.addAttribute("totalItems", pageBooks.getTotalElements());
			model.addAttribute("pageTitle", category.getName());
			model.addAttribute("listCategoryParents", listCategoryParents);
			model.addAttribute("listBooks", listBooks);
			model.addAttribute("category", category);
			
			return "book/books_by_category";
		} catch (CategoryNotFoundException ex) {
			return "error/404";
		}
	}
	
	@GetMapping("/b/{book_alias}")
	public String viewBookDetail(@PathVariable("book_alias") String alias, Model model, HttpServletRequest request) {
		
		try {
			Book book = bookService.getBook(alias);
			List<Category> listCategoryParents = categoryService.getCategoryParents(book.getCategory());
			Page<Review> listReviews = reviewService.list3MostVotedReviewsByBook(book);
			
			Customer customer = controllerHelper.getAuthenticatedCustomer(request);
			
			if (customer != null) {
				boolean customerReviewed = reviewService.didCustomerReviewBook(customer, book.getId());
				voteService.markReviewsVotedForBookByCustomer(listReviews.getContent(), book.getId(), customer.getId());
				
				if (customerReviewed) {
					model.addAttribute("customerReviewed", customerReviewed);
				} else {
					boolean customerCanReview = reviewService.canCustomerReviewBook(customer, book.getId());
					model.addAttribute("customerCanReview", customerCanReview);
				}
			}
			
			model.addAttribute("listCategoryParents", listCategoryParents);
			model.addAttribute("book", book);
			model.addAttribute("listReviews", listReviews);
			model.addAttribute("pageTitle", book.getShortName());
			
			return "book/book_detail";
		} catch (BookNotFoundException e) {
			return "error/404";
		}
	}
	
	@GetMapping("/search")
	public String searchFirstPage(@Param("keyword") String keyword, Model model) {
		return searchByPage(keyword, 1, model);
	}
	
	@GetMapping("/search/page/{pageNum}")
	public String searchByPage(@Param("keyword") String keyword,
			@PathVariable("pageNum") int pageNum,
			Model model) {
		Page<Book> pageBooks = bookService.search(keyword, pageNum);
		List<Book> listResult = pageBooks.getContent();
		
		long startCount = (pageNum - 1) * BookService.SEARCH_RESULTS_PER_PAGE + 1;
		long endCount = startCount + BookService.SEARCH_RESULTS_PER_PAGE - 1;
		if (endCount > pageBooks.getTotalElements()) {
			endCount = pageBooks.getTotalElements();
		}
		
		model.addAttribute("currentPage", pageNum);
		model.addAttribute("totalPages", pageBooks.getTotalPages());
		model.addAttribute("startCount", startCount);
		model.addAttribute("endCount", endCount);
		model.addAttribute("totalItems", pageBooks.getTotalElements());
		model.addAttribute("pageTitle", keyword + " - Search Result");
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("listResult", listResult);
		
		return "book/search_result";
	}
	
}
