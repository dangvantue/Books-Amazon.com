package com.aptech.admin.book;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.aptech.common.entity.Book;

public interface BookRepository extends PagingAndSortingRepository<Book, Integer> {
	public Book findByName(String name);

	@Query("UPDATE Book b SET b.status = ?2 WHERE b.id = ?1")
	@Modifying
	public void updateEnabledStatus(Integer id, boolean enabled);

	public Long countById(Integer id);
}
