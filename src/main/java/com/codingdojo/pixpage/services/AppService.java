package com.codingdojo.pixpage.services;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.codingdojo.pixpage.models.Album;
import com.codingdojo.pixpage.models.Image;
import com.codingdojo.pixpage.models.User;
import com.codingdojo.pixpage.models.Users_Friends;
import com.codingdojo.pixpage.repositories.AlbumRepository;
import com.codingdojo.pixpage.repositories.CommentRepository;
import com.codingdojo.pixpage.repositories.ImageRepository;
import com.codingdojo.pixpage.repositories.UserRepository;
import com.codingdojo.pixpage.repositories.UsersFriendsRepository;

@Service
public class AppService {
	@Autowired
	UserRepository uRep;
	@Autowired
	ImageRepository iRep;
	@Autowired
	AlbumRepository aRep;
	@Autowired
	UsersFriendsRepository UserFriendrep;
	@Autowired
	CommentRepository cRep;
	
	
//	***************************************************
	//register user and hash their password
	public User registerUser(User user) {
		String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(hashed);
		return uRep.save(user);
	}
//	***************************************************
	//find user by email
	public User findByEmail(String email) {
		return uRep.findByEmail(email);
	}
//	***************************************************
	//find user by id
	public User findUserById(Long id) {
		Optional<User> u = uRep.findById(id);
		
		if(u.isPresent()) {
			return u.get();
		} else {
			return null;
		}
	}
	
//	***************************************************
	//authenticate user
	public boolean authenticateUser(String email, String password) {
		//first find the user by email
		User user = uRep.findByEmail(email);
		//if we can't find it by email, return false
		if(user == null) {
			return false;
		} else {
			//if the passwords match, return true, else, return false
			if(BCrypt.checkpw(password, user.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}
//**************************************************************************************************
	public List<User> findUsers(){
		return uRep.findAll();
	}
//**************************************************************************************************
	public Album createAlbum(Album newAlbum) {
		return aRep.save(newAlbum);
	}
	
//**************************************************************************************************
	public Album findAlbumById(Long id) {
		Optional<Album> album = aRep.findById(id);
		if(album.isPresent()) {
			return album.get();
		} else {
			return null;
		}
	}
//**************************************************************************************************
	public Image addImageToAlbum(Image newImage) {
		System.out.println("here is what came to the service" + newImage);
		return iRep.save(newImage);
	}
//**************************************************************************************************
	public Image findImageById(Long imageId) {
		Optional<Image> i = iRep.findById(imageId);
		if(i.isPresent()) {
			return i.get();
		} else {
			return null;
		}
	}
//**************************************************************************************************
	public List<Image> albumImages(Long albumId) {
		return iRep.findByAlbum(albumId);
	}
//**************************************************************************************************
public Image storeImage(MultipartFile file, Long albumId, Long userId, String description) {
	//Normalize File name
	String fileName = StringUtils.cleanPath(file.getOriginalFilename());
	

		Image newImage = new Image();
		Album album = new Album();
		User user = new User();
		newImage.setName(fileName);
		Optional<Album> a = aRep.findById(albumId);
		if(a.isPresent()) {
			album = a.get();
		}
		Optional<User> u = uRep.findById(userId);
		if(u.isPresent()) {
			user = u.get();
		}
		newImage.setAlbum(album);
		newImage.setOwner(user);
		newImage.setDescription(description);
		
		try {
			newImage.setData(file.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
	return iRep.save(newImage);
} 

//**************************************************************************************************
public Users_Friends createFriendRelationship(Long loggedInId, Long otherUserId) {
	Users_Friends newInstance = new Users_Friends();
	newInstance.setUser_id(loggedInId);
	newInstance.setFriend_id(otherUserId);
	return UserFriendrep.save(newInstance);
}
//**************************************************************************************************
public boolean doesRelationshipExist(Long userId, Long friendId) {
	Users_Friends rel = UserFriendrep.doesRelationshipExist(userId, friendId);
	if(rel == null) {
		return false;
	} else {
		return true;
	}
	
}
//**************************************************************************************************

}
