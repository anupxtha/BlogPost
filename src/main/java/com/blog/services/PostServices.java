package com.blog.services;

import java.util.List;

import com.blog.dao.PostRepository;
import com.blog.entities.Post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostServices {

	@Autowired
	private PostRepository postRepository;

	public Post savePost(Post post) {
		Post p = this.postRepository.save(post);
		return p;
	}

	public List<Post> getAllPost() {
		List<Post> list = (List<Post>) this.postRepository.findAll();
		return list;
	}

}
