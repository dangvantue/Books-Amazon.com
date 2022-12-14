package com.aptech.admin.book;

import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.aptech.admin.paging.PagingAndSortingHelper;
import com.aptech.common.entity.book.Book;
import com.aptech.common.exception.BookNotFoundException;

@Service
@Transactional
public class BookService {
	public static final int BOOKS_PER_PAGE = 5;

	@Autowired
	private BookRepository repo;

	public List<Book> listAll() {
		return (List<Book>) repo.findAll();
	}

	public Page<Book> listByPage(int pageNum, String sortField, String sortDir, 
			String keyword, Integer categoryId) {
		Sort sort = Sort.by(sortField);
		
		sort = sortDir.equals("asc") ? sort.ascending() : sort.descending();
				
		Pageable pageable = PageRequest.of(pageNum - 1, BOOKS_PER_PAGE, sort);
		
		if (keyword != null && !keyword.isEmpty()) {
			if (categoryId != null && categoryId > 0) {
				String categoryIdMatch = "-" + String.valueOf(categoryId) + "-";
				return repo.searchInCategory(categoryId, categoryIdMatch, keyword, pageable);
			}
			
			return repo.findAll(keyword, pageable);
		}
		
		if (categoryId != null && categoryId > 0) {
			String categoryIdMatch = "-" + String.valueOf(categoryId) + "-";
			return repo.findAllInCategory(categoryId, categoryIdMatch, pageable);
		}
		
		return repo.findAll(pageable);		
	}	
	
	public void searchBook(int pageNum, PagingAndSortingHelper helper) {
		Pageable pageable = helper.createPageable(BOOKS_PER_PAGE, pageNum);
		String keyword = helper.getKeyword();		
		Page<Book> page = repo.searchBooksByName(keyword, pageable);		
		helper.updateModelAttributes(pageNum, page);
	}

	public Book save(Book book) {
		if (book.getId() == null) {
			book.setCreatedTime(new Date());
		}

		if (book.getAlias() == null || book.getAlias().isEmpty()) {
			String defaultAlias = book.getName().replaceAll(" ", "-");
			book.setAlias(defaultAlias);
		} else {
			book.setAlias(book.getAlias().replaceAll(" ", "-"));
		}

		book.setUpdatedTime(new Date());

		Book updatedBook = repo.save(book);
		repo.updateReviewCountAndAverageRating(updatedBook.getId());
		
		return updatedBook;
	}

	public String checkUnique(Integer id, String name) {
		boolean isCreatingNew = (id == null || id == 0);
		Book bookByName = repo.findByName(name);

		if (isCreatingNew) {
			if (bookByName != null)
				return "Duplicate";
		} else {
			if (bookByName != null && bookByName.getId() != id) {
				return "Duplicate";
			}
		}

		return "OK";
	}

	public void updateBookEnabledStatus(Integer id, boolean enabled) {
		repo.updateEnabledStatus(id, enabled);
	}
	
	public void saveBookPrice(Book bookInForm) {
		Book bookInDB = repo.findById(bookInForm.getId()).get();
		bookInDB.setCost(bookInForm.getCost());
		bookInDB.setPrice(bookInForm.getPrice());
		bookInDB.setDiscountPercent(bookInForm.getDiscountPercent());
		
		repo.save(bookInDB);
	}

	public void delete(Integer id) throws BookNotFoundException {
		Long countById = repo.countById(id);

		if (countById == null || countById == 0) {
			throw new BookNotFoundException("Could not find any book with ID " + id);
		}

		repo.deleteById(id);
	}

	public Book get(Integer id) throws BookNotFoundException {
		try {
			return repo.findById(id).get();
		} catch (NoSuchElementException ex) {
			throw new BookNotFoundException("Could not find any book with ID " + id);
		}
	}
}
