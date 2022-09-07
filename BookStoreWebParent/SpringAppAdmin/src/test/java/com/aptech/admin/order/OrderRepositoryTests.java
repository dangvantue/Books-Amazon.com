package com.aptech.admin.order;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Date;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase;
import org.springframework.boot.test.autoconfigure.jdbc.AutoConfigureTestDatabase.Replace;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.annotation.Rollback;

import com.aptech.common.entity.Customer;
import com.aptech.common.entity.book.Book;
import com.aptech.common.entity.order.Order;
import com.aptech.common.entity.order.OrderDetail;
import com.aptech.common.entity.order.OrderStatus;
import com.aptech.common.entity.order.PaymentMethod;

@DataJpaTest
@AutoConfigureTestDatabase(replace = Replace.NONE)
@Rollback(false)
public class OrderRepositoryTests {
	@Autowired private OrderRepository repo;
	@Autowired private TestEntityManager entityManager;
	
	@Test
	public void testCreateNewOrderWithSingleBook() {
		Customer customer = entityManager.find(Customer.class, 1);
		Book book = entityManager.find(Book.class, 2);
		
		Order mainOrder = new Order();
		mainOrder.setOrderTime(new Date());
		mainOrder.setCustomer(customer);
		mainOrder.copyAddressFromCustomer();
		
		mainOrder.setShippingCost(10);
		mainOrder.setBookCost(book.getCost());
		mainOrder.setTax(0);
		mainOrder.setSubtotal(book.getPrice());
		mainOrder.setTotal(book.getPrice() + 10);
		
		mainOrder.setPaymentMethod(PaymentMethod.CREDIT_CARD);
		mainOrder.setStatus(OrderStatus.NEW);
		mainOrder.setDeliverDate(new Date());
		mainOrder.setDeliverDays(1);
		
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setBook(book);
		orderDetail.setOrder(mainOrder);
		orderDetail.setBookCost(book.getCost());
		orderDetail.setShippingCost(10);
		orderDetail.setQuantity(1);
		orderDetail.setSubtotal(book.getPrice());
		orderDetail.setUnitPrice(book.getPrice());
		
		mainOrder.getOrderDetails().add(orderDetail);
		
		Order savedOrder = repo.save(mainOrder);
		
		assertThat(savedOrder.getId()).isGreaterThan(0);		
	}
	
	@Test
	public void testCreateNewOrderWithMultipleBooks() {
		Customer customer = entityManager.find(Customer.class, 10);
		Book book1 = entityManager.find(Book.class, 6);
		Book book2 = entityManager.find(Book.class, 11);
		
		Order mainOrder = new Order();
		mainOrder.setOrderTime(new Date());
		mainOrder.setCustomer(customer);
		mainOrder.copyAddressFromCustomer();
		
		OrderDetail orderDetail1 = new OrderDetail();
		orderDetail1.setBook(book1);
		orderDetail1.setOrder(mainOrder);
		orderDetail1.setBookCost(book1.getCost());
		orderDetail1.setShippingCost(10);
		orderDetail1.setQuantity(1);
		orderDetail1.setSubtotal(book1.getPrice());
		orderDetail1.setUnitPrice(book1.getPrice());
		
		OrderDetail orderDetail2 = new OrderDetail();
		orderDetail2.setBook(book2);
		orderDetail2.setOrder(mainOrder);
		orderDetail2.setBookCost(book2.getCost());
		orderDetail2.setShippingCost(20);
		orderDetail2.setQuantity(2);
		orderDetail2.setSubtotal(book2.getPrice() * 2);
		orderDetail2.setUnitPrice(book2.getPrice());
		
		mainOrder.getOrderDetails().add(orderDetail1);
		mainOrder.getOrderDetails().add(orderDetail2);
		
		mainOrder.setShippingCost(30);
		mainOrder.setBookCost(book1.getCost() + book2.getCost());
		mainOrder.setTax(0);
		float subtotal = book1.getPrice() + book2.getPrice() * 2;
		mainOrder.setSubtotal(subtotal);
		mainOrder.setTotal(subtotal + 30);
		
		mainOrder.setPaymentMethod(PaymentMethod.CREDIT_CARD);
		mainOrder.setStatus(OrderStatus.PACKAGED);
		mainOrder.setDeliverDate(new Date());
		mainOrder.setDeliverDays(3);
		
		Order savedOrder = repo.save(mainOrder);		
		assertThat(savedOrder.getId()).isGreaterThan(0);		
	}
	
	@Test
	public void testListOrders() {
		Iterable<Order> orders = repo.findAll();
		
		assertThat(orders).hasSizeGreaterThan(0);
		
		orders.forEach(System.out::println);
	}
	
	@Test
	public void testUpdateOrder() {
		Integer orderId = 2;
		Order order = repo.findById(orderId).get();
		
		order.setStatus(OrderStatus.SHIPPING);
		order.setPaymentMethod(PaymentMethod.COD);
		order.setOrderTime(new Date());
		order.setDeliverDays(2);
		
		Order updatedOrder = repo.save(order);
		
		assertThat(updatedOrder.getStatus()).isEqualTo(OrderStatus.SHIPPING);
	}
	
	@Test
	public void testGetOrder() {
		Integer orderId = 3;
		Order order = repo.findById(orderId).get();
		
		assertThat(order).isNotNull();
		System.out.println(order);
	}
	
	@Test
	public void testDeleteOrder() {
		Integer orderId = 3;
		repo.deleteById(orderId);
		
		Optional<Order> result = repo.findById(orderId);
		assertThat(result).isNotPresent();
	}
}
