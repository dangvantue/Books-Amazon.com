package com.aptech.shoppingcart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aptech.common.entity.CartItem;
import com.aptech.common.entity.Customer;
import com.aptech.common.entity.book.Book;

@Service
public class ShoppingCartService {
@Autowired private CartItemRepository cartRepo;
	
	public Integer addBook(Integer bookId, Integer quantity, Customer customer) 
			throws ShoppingCartException {
		Integer updatedQuantity = quantity;
		Book book = new Book(bookId);
		
		CartItem cartItem = cartRepo.findByCustomerAndBook(customer, book);
		
		if (cartItem != null) {
			updatedQuantity = cartItem.getQuantity() + quantity;
			
			if (updatedQuantity > 5) {
				throw new ShoppingCartException("Could not add more " + quantity + " item(s)"
						+ " because there's already " + cartItem.getQuantity() + " item(s) "
						+ "in your shopping cart. Maximum allowed quantity is 5.");
			}
		} else {
			cartItem = new CartItem();
			cartItem.setCustomer(customer);
			cartItem.setBook(book);
		}
		
		cartItem.setQuantity(updatedQuantity);
		
		cartRepo.save(cartItem);
		
		return updatedQuantity;
	}
}
