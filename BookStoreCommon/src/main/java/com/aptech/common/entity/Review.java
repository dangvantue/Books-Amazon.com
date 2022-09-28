package com.aptech.common.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.aptech.common.entity.book.Book;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "reviews")
@Getter
@Setter
public class Review extends IdBasedEntity{
	@Column(length = 128, nullable = false)
	private String headline;
	
	@Column(length = 4096, nullable = false)
	private String comment;
	
	private int rating;	
	
	@Column(nullable = false)
	private Date reviewTime;
	
	@ManyToOne
	@JoinColumn(name = "book_id")
	private Book book;
	
	@ManyToOne
	@JoinColumn(name = "customer_id")
	private Customer customer;
	
	@Override
	public String toString() {
		return "Review [headline=" + headline + ", rating=" + rating + ", reviewTime=" + reviewTime + ", book="
				+ book.getShortName() + ", customer=" + customer.getFullName() + "]";
	}
}
