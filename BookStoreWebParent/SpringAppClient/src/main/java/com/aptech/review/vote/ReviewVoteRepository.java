package com.aptech.review.vote;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.aptech.common.entity.ReviewVote;

public interface ReviewVoteRepository extends JpaRepository<ReviewVote, Integer> {

	@Query("SELECT v FROM ReviewVote v WHERE v.review.id = ?1 AND v.customer.id = ?2")
	public ReviewVote findByReviewAndCustomer(Integer reviewId, Integer customerId);
	
	@Query("SELECT v FROM ReviewVote v WHERE v.review.book.id = ?1 AND v.customer.id = ?2")
	public List<ReviewVote> findByBookAndCustomer(Integer bookId, Integer customerId);	
}
