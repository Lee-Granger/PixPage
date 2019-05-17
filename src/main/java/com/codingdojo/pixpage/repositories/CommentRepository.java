package com.codingdojo.pixpage.repositories;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.codingdojo.pixpage.models.Comment;

public interface CommentRepository extends CrudRepository<Comment, Long>{

@Query
(value="DELETE from pix.comments WHERE image_id = ?1", nativeQuery=true)
public void deleteImageComments(Long imageId);
}
