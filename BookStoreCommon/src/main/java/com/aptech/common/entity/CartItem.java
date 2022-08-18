package com.aptech.common.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.aptech.common.entity.book.Book;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "cart_items")
@NoArgsConstructor
@Getter
@Setter
public class CartItem extends IdBasedEntity {

	@ManyToOne
	@JoinColumn(name = "customer_id")
	private Customer customer;

	@ManyToOne
	@JoinColumn(name = "book_id")
	private Book book;

	private int quantity;

	@Transient
	private float shippingCost;

	@Override
	public String toString() {
		return "CartItem [id=" + id + ", customer=" + customer.getFullName() + ", book=" + book.getShortName()
				+ ", quantity=" + quantity + "]";
	}

	@Transient
	public float getSubtotal() {
		return book.getDiscountPrice() * quantity;
	}

	@Transient
	public float getShippingCost() {
		return shippingCost;
	}

	public void setShippingCost(float shippingCost) {
		this.shippingCost = shippingCost;
	}

}
