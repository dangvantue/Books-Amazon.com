package com.aptech.common.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "book_images")
@NoArgsConstructor
@Getter
@Setter
public class BookImage extends IdBasedEntity {
	@Column(nullable = false)
	private String name;

	@ManyToOne
	@JoinColumn(name = "book_id")
	private Book book;

	public BookImage(String name, Book book) {
		super();
		this.name = name;
		this.book = book;
	}

}
