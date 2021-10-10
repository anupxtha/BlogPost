package com.blog.dao;

import org.springframework.data.repository.CrudRepository;

import com.blog.entities.*;

public interface CategoryRepository extends CrudRepository<Category, Integer>{
	public Category findById(int id);
	
}
