package com.aptech.admin.category;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.aptech.common.entity.Category;

public interface CategoryRepository extends PagingAndSortingRepository<Category, Integer> {

}
