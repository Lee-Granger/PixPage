package com.codingdojo.pixpage.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.pixpage.models.Image;

@Repository
public interface ImageRepository extends CrudRepository<Image, Long>{
	@Query(value="SELECT * FROM pix.images WHERE album_id = ?1", nativeQuery=true)
	List<Image> findByAlbum(Long albumId);
	
	//delete image by id
	void deleteById(Long Id);

}
