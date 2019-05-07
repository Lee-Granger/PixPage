package com.codingdojo.pixpage.repositories;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.pixpage.models.Album;

public interface AlbumRepository extends CrudRepository<Album, Long>{

}
