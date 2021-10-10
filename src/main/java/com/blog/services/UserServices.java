package com.blog.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.entities.*;
import com.blog.dao.*;

@Service
public class UserServices {

	@Autowired
	private UserRepository userRepository;

	public User addUser(User u) {
		User user = this.userRepository.save(u);
		return user;
	}

	public List<User> getAllUser() {
		try {
			List<User> list = (List<User>) this.userRepository.findAll();
			return list;
		} catch (Exception e) {
			return null;
		}

	}

	public User getUserByName(String username) {
		User user = this.userRepository.getUserByUserName(username);
		return user;
	}

	public void updateUser(User user, int userId) {
		user.setId(userId);
		this.userRepository.save(user);
	}
}
