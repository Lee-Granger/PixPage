package com.codingdojo.pixpage.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.pixpage.models.User;

public interface UserRepository extends CrudRepository<User, Long>{
	User findByEmail(String email);
	List<User> findAll();

}
