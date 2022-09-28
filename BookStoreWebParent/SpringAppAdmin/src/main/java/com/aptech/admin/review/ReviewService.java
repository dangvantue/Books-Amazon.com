package com.aptech.admin.review;

import java.util.NoSuchElementException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aptech.admin.book.BookRepository;
import com.aptech.admin.paging.PagingAndSortingHelper;
import com.aptech.common.entity.Review;
import com.aptech.common.exception.ReviewNotFoundException;

@Service
@Transactional
public class ReviewService {
	public static final int REVIEWS_PER_PAGE = 5;
	
	@Autowired private ReviewRepository reviewRepository;
	@Autowired private BookRepository bookRepository;
	
	public void listByPage(int pageNum, PagingAndSortingHelper helper) {
		helper.listEntities(pageNum, REVIEWS_PER_PAGE, reviewRepository);
	}
	
	public Review get(Integer id) throws ReviewNotFoundException {
		try {
			return reviewRepository.findById(id).get();
		} catch (NoSuchElementException ex) {
			throw new ReviewNotFoundException("Could not find any reviews with ID " + id);
		}
	}
	
	public void save(Review reviewInForm) {
		Review reviewInDB = reviewRepository.findById(reviewInForm.getId()).get();
		reviewInDB.setHeadline(reviewInForm.getHeadline());
		reviewInDB.setComment(reviewInForm.getComment());
		
		reviewRepository.save(reviewInDB);
		bookRepository.updateReviewCountAndAverageRating(reviewInDB.getBook().getId());
	}
	
	public void delete(Integer id) throws ReviewNotFoundException {
		if (!reviewRepository.existsById(id)) {
			throw new ReviewNotFoundException("Could not find any reviews with ID " + id);
		}
		
		reviewRepository.deleteById(id);
	}
}
