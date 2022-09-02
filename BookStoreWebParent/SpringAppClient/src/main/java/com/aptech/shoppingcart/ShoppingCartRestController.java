package com.aptech.shoppingcart;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.aptech.Utility;
import com.aptech.common.entity.Customer;
import com.aptech.common.exception.CustomerNotFoundException;
import com.aptech.customer.CustomerService;

@RestController
public class ShoppingCartRestController {
	@Autowired private ShoppingCartService cartService;
	@Autowired private CustomerService customerService;
	
	@PostMapping("/cart/add/{bookId}/{quantity}")
	public String addBookToCart(@PathVariable("bookId") Integer bookId,
			@PathVariable("quantity") Integer quantity, HttpServletRequest request) {
		
		try {
			Customer customer = getAuthenticatedCustomer(request);
			Integer updatedQuantity = cartService.addBook(bookId, quantity, customer);
			
			return updatedQuantity + " item(s) of this book were added to your shopping cart.";
		} catch (CustomerNotFoundException ex) {
			return "You must login to add this book to cart.";
		} catch (ShoppingCartException ex) {
			return ex.getMessage();
		}
		
	}
	
	private Customer getAuthenticatedCustomer(HttpServletRequest request) 
			throws CustomerNotFoundException {
		String email = Utility.getEmailOfAuthenticatedCustomer(request);
		if (email == null) {
			throw new CustomerNotFoundException("No authenticated customer");
		}
				
		return customerService.getCustomerByEmail(email);
	}
	
	@PostMapping("/cart/update/{bookId}/{quantity}")
	public String updateQuantity(@PathVariable("bookId") Integer bookId,
			@PathVariable("quantity") Integer quantity, HttpServletRequest request) {
		try {
			Customer customer = getAuthenticatedCustomer(request);
			float subtotal = cartService.updateQuantity(bookId, quantity, customer);
			
			return String.valueOf(subtotal);
		} catch (CustomerNotFoundException ex) {
			return "You must login to change quantity of book.";
		}	
	}
}
