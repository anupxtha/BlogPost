package com.blog.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "Post")
public class Post {
	@Id
	@Column(name = "post_id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	private String title;

	private String image;

	private String description;

	private LocalDateTime post_date;

	@ManyToOne
	@JsonBackReference
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne
	@JsonBackReference
	@JoinColumn(name = "cat_id")
	private Category category;

	@OneToMany(mappedBy = "post", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JsonManagedReference
	private List<Comment> comment = new ArrayList<>();

	public Post() {
		super();
	}

	public Post(String title, String image, String description, LocalDateTime post_date, User user, Category category,
			List<Comment> comment) {
		super();
		this.title = title;
		this.image = image;
		this.description = description;
		this.post_date = post_date;
		this.user = user;
		this.category = category;
		this.comment = comment;
	}

	public Post(int id, String title, String image, String description, LocalDateTime post_date, User user,
			Category category, List<Comment> comment) {
		super();
		this.id = id;
		this.title = title;
		this.image = image;
		this.description = description;
		this.post_date = post_date;
		this.user = user;
		this.category = category;
		this.comment = comment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getPost_date() {
		return post_date;
	}

	public void setPost_date(LocalDateTime post_date) {
		this.post_date = post_date;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<Comment> getComment() {
		return comment;
	}

	public void setComment(List<Comment> comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "Post [category=" + category + ", comment=" + comment + ", description=" + description + ", id=" + id
				+ ", image=" + image + ", post_date=" + post_date + ", title=" + title + ", user=" + user + "]";
	}

}
