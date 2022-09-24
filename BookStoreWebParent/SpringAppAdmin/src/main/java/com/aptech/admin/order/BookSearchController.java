package com.aptech.admin.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.aptech.admin.book.BookService;
import com.aptech.admin.paging.PagingAndSortingHelper;
import com.aptech.admin.paging.PagingAndSortingParam;


@Controller
public class BookSearchController {

	@Autowired private BookService service;
	
	@GetMapping("/orders/search_book")
	public String showSearchBookPage() {
		return "orders/search_book";
	}
	
	@PostMapping("/orders/search_book")
	public String searchBooks(String keyword) {
		return "redirect:/orders/search_book/page/1?sortField=name&sortDir=asc&keyword=" + keyword;
	}
	
	@GetMapping("/orders/search_book/page/{pageNum}")
	public String searchBooksByPage(@PagingAndSortingParam(listName = "listBooks", 
			moduleURL = "/orders/search_book") PagingAndSortingHelper helper,
			@PathVariable(name = "pageNum") int pageNum) {
		service.searchBook(pageNum, helper);
		return "orders/search_book";
	}
}
