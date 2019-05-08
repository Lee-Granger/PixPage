package com.codingdojo.pixpage.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.pixpage.models.Users_Friends;

@Repository	
public interface UsersFriendsRepository extends CrudRepository<Users_Friends, Long>{
	
	@Query
	(value="select * from users_friends where user_id = ?1 and friend_id = ?2", nativeQuery=true)
	Users_Friends doesRelationshipExist(Long userId,Long friendId);
	

}
