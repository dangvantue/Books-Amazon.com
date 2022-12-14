package com.aptech.category;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.aptech.common.entity.Category;

public interface CategoryRepository extends CrudRepository<Category, Integer> {

	@Query("SELECT c FROM Category c WHERE c.status = true ORDER BY c.name ASC")
	public List<Category> findAllEnabled();
	
	@Query("SELECT c FROM Category c WHERE c.status = true AND c.alias = ?1")
	public Category findByAliasEnabled(String alias);
}
