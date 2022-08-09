package com.aptech.book;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.aptech.common.entity.book.Book;

public interface BookRepository extends PagingAndSortingRepository<Book, Integer> {
	@Query("SELECT b FROM Book b WHERE b.status = true "
			+ "AND (b.category.id = ?1 OR b.category.allParentIDs LIKE %?2%)"
			+ " ORDER BY b.name ASC")
	public Page<Book> listByCategory(Integer categoryId, String categoryIDMatch, Pageable pageable);
	
	public Book findByAlias(String alias);
	
	@Query(value = "SELECT * FROM Book WHERE status = true AND "
			+ "MATCH(name, description) AGAINST (?1)", 
			nativeQuery = true)
	public Page<Book> search(String keyword, Pageable pageable);
}
