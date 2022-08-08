package com.aptech.common.entity.book;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.aptech.common.entity.IdBasedEntity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "book_details")
@NoArgsConstructor
@Setter
@Getter
public class BookDetail extends IdBasedEntity {

	@Column(nullable = false, length = 255)
	private String name;

	@Column(nullable = false, length = 255)
	private String value;

	@ManyToOne
	@JoinColumn(name = "book_id")
	private Book book;

	public BookDetail(String name, String value, Book book) {
		this.name = name;
		this.value = value;
		this.book = book;
	}
	
	public BookDetail(Integer id, String name, String value, Book book) {
		super();
		this.id = id;
		this.name = name;
		this.value = value;
		this.book = book;
	}
	
}
