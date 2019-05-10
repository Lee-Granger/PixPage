package com.codingdojo.pixpage.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Size(min=3, message="Please enter a valid first name")
	private String firstName;
	
	@Size(min=2, message="Please enter a valid last name")
	private String lastName;
	
	private String location;
	
	@Size(max=250, message="Please shorten your bio")
	private String bio;
	
	@Email(message="Please enter a valid email")
	private String email;
	
	@Size(min=3, message="Your password is weak")
	private String password;
	
	@Transient
	private String passwordConfirmation;
	
	@OneToMany(mappedBy="user")
	private List<Comment> comments;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "users_friends",
			joinColumns = @JoinColumn(name = "user_id"),
			inverseJoinColumns = @JoinColumn(name = "friend_id")
			)
	private List<User> friends;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
			name = "users_friends",
			joinColumns = @JoinColumn(name = "friend_id"),
			inverseJoinColumns = @JoinColumn(name = "user_id")
			)
	private List<User> userFriends;
	
	@OneToMany(mappedBy="owner", fetch=FetchType.LAZY)
	private List<Image> images;
	
	@OneToMany(mappedBy="creator", fetch=FetchType.LAZY)
	private List<Album> albums;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	
	public User() {}
	
	
	
	
	public Long getId() {
		return id;
	}




	public List<Image> getImages() {
		return images;
	}




	public void setImages(List<Image> images) {
		this.images = images;
	}




	public List<Album> getAlbums() {
		return albums;
	}




	public void setAlbums(List<Album> albums) {
		this.albums = albums;
	}




	public void setId(Long id) {
		this.id = id;
	}




	public String getFirstName() {
		return firstName;
	}




	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}




	public String getLastName() {
		return lastName;
	}




	public void setLastName(String lastName) {
		this.lastName = lastName;
	}




	public String getLocation() {
		return location;
	}




	public void setLocation(String location) {
		this.location = location;
	}




	public String getBio() {
		return bio;
	}




	public void setBio(String bio) {
		this.bio = bio;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getPassword() {
		return password;
	}




	public void setPassword(String password) {
		this.password = password;
	}




	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}




	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}




	public List<User> getFriends() {
		return friends;
	}




	public void setFriends(List<User> friends) {
		this.friends = friends;
	}




	public List<User> getUserFriends() {
		return userFriends;
	}




	public void setUserFriends(List<User> userFriends) {
		this.userFriends = userFriends;
	}


	public List<Comment> getComments() {
		return comments;
	}


	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}


	public Date getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}




	public Date getUpdatedAt() {
		return updatedAt;
	}




	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}




	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
	
	
	

}
