package com.aptech.common.entity.order;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.aptech.common.entity.Category;
import com.aptech.common.entity.IdBasedEntity;
import com.aptech.common.entity.book.Book;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Entity
@Table(name = "order_details")
@Getter
@Setter
@NoArgsConstructor
public class OrderDetail extends IdBasedEntity {
	private int quantity;
	private float bookCost;
	private float shippingCost;
	private float unitPrice;
	private float subtotal;
	
	@ManyToOne
	@JoinColumn(name = "book_id")
	private Book book;
	
	@ManyToOne
	@JoinColumn(name = "order_id")
	private Order order;
	
	public OrderDetail(String categoryName, int quantity, float bookCost, float shippingCost, float subtotal) {
		this.book = new Book();
		this.book.setCategory(new Category(categoryName));
		this.quantity = quantity;
		this.bookCost = bookCost * quantity;
		this.shippingCost = shippingCost;
		this.subtotal = subtotal;
	}
	
	public OrderDetail(int quantity, String bookName, float bookCost, float shippingCost, float subtotal) {
		this.book = new Book(bookName);
		this.quantity = quantity;
		this.bookCost = bookCost * quantity;
		this.shippingCost = shippingCost;
		this.subtotal = subtotal;
	}	

}
