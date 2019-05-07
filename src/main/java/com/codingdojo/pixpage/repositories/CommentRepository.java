package com.codingdojo.pixpage.repositories;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.pixpage.models.Comment;

public interface CommentRepository extends CrudRepository<Comment, Long>{

}
