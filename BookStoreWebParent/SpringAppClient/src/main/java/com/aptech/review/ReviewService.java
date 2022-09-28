package com.aptech.review;

import java.util.Date;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.aptech.book.BookRepository;
import com.aptech.common.entity.Customer;
import com.aptech.common.entity.Review;
import com.aptech.common.entity.book.Book;
import com.aptech.common.entity.order.OrderStatus;
import com.aptech.common.exception.ReviewNotFoundException;
import com.aptech.order.OrderDetailRepository;

@Service
@Transactional
public class ReviewService {
	public static final int REVIEWS_PER_PAGE = 5;
	
	@Autowired private ReviewRepository reviewRepo;
	@Autowired private OrderDetailRepository orderDetailRepo;
	@Autowired private BookRepository bookRepository;

	public Page<Review> listByCustomerByPage(Customer customer, String keyword, int pageNum, 
			String sortField, String sortDir) {
		Sort sort = Sort.by(sortField);
		sort = sortDir.equals("asc") ? sort.ascending() : sort.descending();
		
		Pageable pageable = PageRequest.of(pageNum - 1, REVIEWS_PER_PAGE, sort);
		
		if (keyword != null) {
			return reviewRepo.findByCustomer(customer.getId(), keyword, pageable);
		}
		
		return reviewRepo.findByCustomer(customer.getId(), pageable);
	}
	
	public Review getByCustomerAndId(Customer customer, Integer reviewId) throws ReviewNotFoundException {
		Review review = reviewRepo.findByCustomerAndId(customer.getId(), reviewId);
		if (review == null) 
			throw new ReviewNotFoundException("Customer does not have any reviews with ID " + reviewId);
		
		return review;
	}
	
	public Page<Review> list3MostRecentReviewsByBook(Book book) {
		Sort sort = Sort.by("reviewTime").descending();
		Pageable pageable = PageRequest.of(0, 3, sort);
		
		return reviewRepo.findByBook(book, pageable);		
	}	
	
	public Page<Review> listByBook(Book book, int pageNum, String sortField, String sortDir) {
		Sort sort = Sort.by(sortField);
		sort = sortDir.equals("asc") ? sort.ascending() : sort.descending(); 
		Pageable pageable = PageRequest.of(pageNum - 1, REVIEWS_PER_PAGE, sort);
		
		return reviewRepo.findByBook(book, pageable);
	}
	
	public boolean didCustomerReviewBook(Customer customer, Integer bookId) {
		Long count = reviewRepo.countByCustomerAndBook(customer.getId(), bookId);
		return count > 0;
	}
	
	public boolean canCustomerReviewBook(Customer customer, Integer bookId) {
		Long count = orderDetailRepo.countByBookAndCustomerAndOrderStatus(bookId, customer.getId(), OrderStatus.DELIVERED);
		return count > 0;
	}
	
	public Review save(Review review) {
		review.setReviewTime(new Date());
		Review savedReview = reviewRepo.save(review);
		
		Integer bookId = savedReview.getBook().getId();		
		bookRepository.updateReviewCountAndAverageRating(bookId);
		
		return savedReview;
	}
}
