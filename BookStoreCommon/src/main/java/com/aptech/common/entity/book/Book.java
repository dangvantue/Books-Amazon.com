package com.aptech.common.entity.book;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.aptech.common.entity.Author;
import com.aptech.common.entity.Category;
import com.aptech.common.entity.IdBasedEntity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "books")
@NoArgsConstructor
@Getter
@Setter
public class Book extends IdBasedEntity {
	@Column(unique = true, length = 255, nullable = false)
	private String name;

	@Column(unique = true, length = 255, nullable = false)
	private String alias;

	@Column(length = 4096, nullable = false, name = "description")
	private String description;

	@Column(name = "created_time", nullable = false, updatable = false)
	private Date createdTime;

	@Column(name = "updated_time")
	private Date updatedTime;

	private boolean status;

	@Column(name = "in_stock")
	private boolean inStock;

	private float cost;

	private float price;

	@Column(name = "discount_percent")
	private float discountPercent;

	@Column(name = "main_image", nullable = false)
	private String mainImage;

	@ManyToOne
	@JoinColumn(name = "category_id")
	private Category category;

	@ManyToOne
	@JoinColumn(name = "author_id")
	private Author author;

	@OneToMany(mappedBy = "book", cascade = CascadeType.ALL, orphanRemoval = true)
	private Set<BookImage> images = new HashSet<>();

	@OneToMany(mappedBy = "book", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<BookDetail> details = new ArrayList<>();

	public void addExtraImage(String imageName) {
		this.images.add(new BookImage(imageName, this));
	}

	@Transient
	public String getMainImagePath() {
		if (id == null || mainImage == null)
			return "/images/image-thumbnail.png";

		return "/book-images/" + this.id + "/" + this.mainImage;
	}
	
	public void addDetail(String name, String value) {
		this.details.add(new BookDetail(name, value, this));
	}
	
	public boolean containsImageName(String imageName) {
		Iterator<BookImage> iterator = images.iterator();
		
		while (iterator.hasNext()) {
			BookImage image = iterator.next();
			if (image.getName().equals(imageName)) {
				return true;
			}
		}
		
		return false;
	}
	
	public void addDetail(Integer id, String name, String value) {
		this.details.add(new BookDetail(id, name, value, this));
	}
	
	@Transient
	public String getShortName() {
		if (name.length() > 70) {
			return name.substring(0, 70).concat("...");
		}
		return name;
	}

}
