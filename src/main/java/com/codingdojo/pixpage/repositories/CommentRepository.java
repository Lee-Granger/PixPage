package com.codingdojo.pixpage.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.codingdojo.pixpage.models.Comment;

public interface CommentRepository extends CrudRepository<Comment, Long>{
	

}
