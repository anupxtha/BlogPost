package com.blog.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "Comment")
public class Comment {
	@Id
	@Column(name = "comment_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	private String comment_text;

	@ManyToOne
	@JsonBackReference
	@JoinColumn(name = "user_id")
	private User users;

	@ManyToOne
	@JsonBackReference
	@JoinColumn(name = "post_id")
	private Post post;

	// // ManyToMany relationship with post then this
	// private List<Post> post = new ArrayList<>();

	public Comment() {
		super();
	}

	public Comment(String comment_text, User users, Post post) {
		super();
		this.comment_text = comment_text;
		this.users = users;
		this.post = post;
	}

	public Comment(int id, String comment_text, User users, Post post) {
		super();
		this.id = id;
		this.comment_text = comment_text;
		this.users = users;
		this.post = post;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment_text() {
		return comment_text;
	}

	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}

	public User getUsers() {
		return users;
	}

	public void setUsers(User users) {
		this.users = users;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

}
