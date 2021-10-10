package com.blog.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

import com.blog.entities.*;

public interface CommentRepository extends CrudRepository<Comment, Integer> {

	@Query(value = "Select * from comment where post_id =:p", nativeQuery = true)
	public List<Comment> findByPostId(@Param("p") int id);
}
