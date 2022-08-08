package com.aptech.common.entity.book;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.aptech.common.entity.IdBasedEntity;

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
	
	public BookImage(Integer id, String name, Book book) {
		this.id = id;
		this.name = name;
		this.book = book;
	}

	@Transient
	public String getImagePath() {
		return "/book-images/" + book.getId() + "/extras/" + this.name;
	}
}
