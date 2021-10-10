package com.blog.dao;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

import com.blog.entities.*;

public interface PostRepository extends CrudRepository<Post, Integer> {

	@Query(value = "Select * from post where cat_id =:n", nativeQuery = true)
	public List<Post> findByCatId(@Param("n") int id);

	@Query(value = "Select * from post where user_id =:u", nativeQuery = true)
	public List<Post> findByUserId(@Param("u") int id);

	@Query(value = "Select * from post where post_id =:p", nativeQuery = true)
	public Post findPostId(@Param("p") int id);

}
