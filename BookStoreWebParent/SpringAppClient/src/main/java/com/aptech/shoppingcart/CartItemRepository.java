package com.aptech.shoppingcart;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.aptech.common.entity.CartItem;
import com.aptech.common.entity.Customer;
import com.aptech.common.entity.book.Book;


public interface CartItemRepository extends CrudRepository<CartItem, Integer> {
	public List<CartItem> findByCustomer(Customer customer);
	
	public CartItem findByCustomerAndBook(Customer customer, Book book);
	
	@Modifying
	@Query("UPDATE CartItem c SET c.quantity = ?1 WHERE c.customer.id = ?2 AND c.book.id = ?3")
	public void updateQuantity(Integer quantity, Integer customerId, Integer bookId);
	
	@Modifying
	@Query("DELETE FROM CartItem c WHERE c.customer.id = ?1 AND c.book.id = ?2")
	public void deleteByCustomerAndBook(Integer customerId, Integer bookId);
}
