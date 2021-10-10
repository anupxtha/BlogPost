package com.blog.services;

import com.blog.dao.CommentRepository;
import com.blog.entities.Comment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServices {

  @Autowired
  private CommentRepository commentRepository;

  public Comment addComment(Comment c) {
    Comment comment = this.commentRepository.save(c);
    return comment;
  }

}
