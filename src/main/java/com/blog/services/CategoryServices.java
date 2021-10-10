package com.blog.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.dao.CategoryRepository;
import com.blog.entities.Category;

@Service
public class CategoryServices {

	@Autowired
	private CategoryRepository categoryRepository;
	
	public List<Category> getAllCategory(){
		List<Category> list = (List<Category>) this.categoryRepository.findAll();
//		System.out.println(list);
		return list;
	}
}
