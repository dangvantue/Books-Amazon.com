package com.aptech.admin.author;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.aptech.common.entity.Author;

public interface AuthorRepository extends PagingAndSortingRepository<Author, Integer> {
	
	public Long countById(Integer id);
	
	public Author findByName(String name);
	
	@Query("SELECT a FROM Author a WHERE a.name LIKE %?1%")
	public Page<Author> findAll(String keyword, Pageable pageable);
	
	@Query("SELECT NEW Author(a.id, a.name) FROM Author a ORDER BY a.name ASC")
	public List<Author> findAll();
}
