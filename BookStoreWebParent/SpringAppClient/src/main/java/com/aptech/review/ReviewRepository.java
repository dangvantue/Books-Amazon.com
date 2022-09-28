package com.aptech.review;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.aptech.common.entity.Review;
import com.aptech.common.entity.book.Book;

public interface ReviewRepository extends JpaRepository<Review, Integer> {
	
	@Query("SELECT r FROM Review r WHERE r.customer.id = ?1")
	public Page<Review> findByCustomer(Integer customerId, Pageable pageable);
	
	@Query("SELECT r FROM Review r WHERE r.customer.id = ?1 AND ("
			+ "r.headline LIKE %?2% OR r.comment LIKE %?2% OR "
			+ "r.book.name LIKE %?2%)")
	public Page<Review> findByCustomer(Integer customerId, String keyword, Pageable pageable);
	
	@Query("SELECT r FROM Review r WHERE r.customer.id = ?1 AND r.id = ?2")
	public Review findByCustomerAndId(Integer customerId, Integer reviewId);	
	
	public Page<Review> findByBook(Book book, Pageable pageable);
	
	@Query("SELECT COUNT(r.id) FROM Review r WHERE r.customer.id = ?1 AND "
			+ "r.book.id = ?2")
	public Long countByCustomerAndBook(Integer customerId, Integer bookId);
}
