package com.aptech.admin.book;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aptech.common.entity.Book;

@Service
public class BookService {
@Autowired private BookRepository repo;
	
	public List<Book> listAll() {
		return (List<Book>) repo.findAll();
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
		
		return repo.save(book);
	}
	
	public String checkUnique(Integer id, String name) {
		boolean isCreatingNew = (id == null || id == 0);
		Book bookByName = repo.findByName(name);
		
		if (isCreatingNew) {
			if (bookByName != null) return "Duplicate";
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
	
	public void delete(Integer id) throws BookNotFoundException {
		Long countById = repo.countById(id);
		
		if (countById == null || countById == 0) {
			throw new BookNotFoundException("Could not find any book with ID " + id);			
		}
		
		repo.deleteById(id);
	}	
}
