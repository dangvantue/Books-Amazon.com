package com.aptech.shoppingcart;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

import com.aptech.common.entity.CartItem;
import com.aptech.common.entity.Customer;
import com.aptech.common.entity.book.Book;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class CartItemRepositoryTests {

	@Autowired private CartItemRepository repo;
	@Autowired private TestEntityManager entityManager;
	
	@Test
	public void testSaveItem() {
		Integer customerId = 1;
		Integer bookId = 18;
		
		Customer customer = entityManager.find(Customer.class, customerId);
		Book book = entityManager.find(Book.class, bookId);
		
		CartItem newItem = new CartItem();
		newItem.setCustomer(customer);
		newItem.setBook(book);
		newItem.setQuantity(1);
		
		CartItem savedItem = repo.save(newItem);
		
		assertThat(savedItem.getId()).isGreaterThan(0);
	}
	
	@Test
	public void testSave2Items() {
		Integer customerId = 4;
		Integer bookId = 5;
		
		Customer customer = entityManager.find(Customer.class, customerId);
		Book book = entityManager.find(Book.class, bookId);
		
		CartItem item1 = new CartItem();
		item1.setCustomer(customer);
		item1.setBook(book);
		item1.setQuantity(2);
		
		CartItem item2 = new CartItem();
		item2.setCustomer(new Customer(customerId));
		item2.setBook(new Book(4));
		item2.setQuantity(3);
		
		Iterable<CartItem> iterable = repo.saveAll(List.of(item1, item2));
		
		assertThat(iterable).size().isGreaterThan(0);
	}
	
	@Test
	public void testFindByCustomer() {
		Integer customerId = 1;
		List<CartItem> listItems = repo.findByCustomer(new Customer(customerId));
		
		listItems.forEach(System.out::println);
		
		assertThat(listItems.size()).isEqualTo(2);
	}
	
	@Test
	public void testFindByCustomerAndBook() {
		Integer customerId = 1;
		Integer bookId = 1;
		
		CartItem item = repo.findByCustomerAndBook(new Customer(customerId), new Book(bookId));
		
		assertThat(item).isNotNull();
		
		System.out.println(item);
	}
	
	@Test
	public void testUpdateQuantity() {
		Integer customerId = 1;
		Integer bookId = 18;
		Integer quantity = 4;
		
		repo.updateQuantity(quantity, customerId, bookId);
		
		CartItem item = repo.findByCustomerAndBook(new Customer(customerId), new Book(bookId));
		
		assertThat(item.getQuantity()).isEqualTo(4);
	}
	
	@Test
	public void testDeleteByCustomerAndBook() {
		Integer customerId = 10;
		Integer bookId = 10;
		
		repo.deleteByCustomerAndBook(customerId, bookId);
		
		CartItem item = repo.findByCustomerAndBook(new Customer(customerId), new Book(bookId));
		
		assertThat(item).isNull();
	}
}

