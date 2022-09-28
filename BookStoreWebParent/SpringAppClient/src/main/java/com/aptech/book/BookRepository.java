package com.aptech.book;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.aptech.common.entity.book.Book;

public interface BookRepository extends PagingAndSortingRepository<Book, Integer> {
	@Query("SELECT b FROM Book b WHERE b.status = true "
			+ "AND (b.category.id = ?1 OR b.category.allParentIDs LIKE %?2%)"
			+ " ORDER BY b.name ASC")
	public Page<Book> listByCategory(Integer categoryId, String categoryIDMatch, Pageable pageable);
	
	public Book findByAlias(String alias);
	
	@Query(value = "SELECT * FROM books WHERE status = true AND "
			+ "MATCH(name, description) AGAINST (?1)", 
			nativeQuery = true)
	public Page<Book> search(String keyword, Pageable pageable);

	@Query("Update Book b SET b.averageRating = COALESCE((SELECT AVG(r.rating) FROM Review r WHERE r.book.id = ?1), 0),"
			+ " b.reviewCount = (SELECT COUNT(r.id) FROM Review r WHERE r.book.id =?1) "
			+ "WHERE b.id = ?1")
	@Modifying
	public void updateReviewCountAndAverageRating(Integer bookId);
}
