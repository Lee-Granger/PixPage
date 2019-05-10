package com.codingdojo.pixpage.controllers;

import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.pixpage.models.Album;
import com.codingdojo.pixpage.models.Comment;
import com.codingdojo.pixpage.models.Image;
import com.codingdojo.pixpage.models.User;
import com.codingdojo.pixpage.services.AppService;
import com.codingdojo.pixpage.validations.UserValidator;

@MultipartConfig
@Controller
public class PixCtrl {
	private final AppService appServ;
	private final UserValidator uservalidator;
	
	PixCtrl(AppService appServ, UserValidator uservalidator){
		this.appServ = appServ;
		this.uservalidator = uservalidator;
	}
//**************************************************************************
@RequestMapping("/")
public String index(@ModelAttribute("newUser") User newUser) {
	return "splash.jsp";
}


//*****************************************************************************
@RequestMapping("/register/page")
public String registerPage(@ModelAttribute("newUser") User newUser) {
	
	return "registerForm.jsp";
}
//*****************************************************************************
@RequestMapping("/login/page")
public String loginPage() {
	
	return "loginForm.jsp";
}
//*****************************************************************************
@PostMapping("/register/user")
public String registerUser(@Valid @ModelAttribute("newUser")User user, BindingResult result, HttpSession session) {
		uservalidator.validate(user, result);
		if(result.hasErrors()) {
			return "splash.jsp";
		} else {
			User newUser = appServ.registerUser(user);
			session.setAttribute("userId", newUser.getId());
			return "redirect:/home";
		}
		
	}
//********************************************************************************
@PostMapping("/login")
public String loginUser(@RequestParam("email") String email, @RequestParam("password")String password, Model model, HttpSession session, @ModelAttribute("newUser") User newUser) {
	boolean check = appServ.authenticateUser(email, password);
	if(check) {
		User u = appServ.findByEmail(email);
		session.setAttribute("userId", u.getId());
		return "redirect:/home";
	} else {
		model.addAttribute("error", "Invalid Credentials.  Please try again.");
		return "splash.jsp";
	}
}
//********************************************************************************
@RequestMapping("/home")
public String homePage(Model model, HttpSession session) {
	Long locator = (Long) session.getAttribute("userId");
	if (locator == null) {
		return "splash.jsp";
	} else {
	User user = appServ.findUserById(locator);
	model.addAttribute("user", user);
	List<User> userList = appServ.findUsers();
	model.addAttribute("userList", userList);
	return "home.jsp";
	}
}
//********************************************************************************
@RequestMapping("/logout")
public String logout(HttpSession session) {
	session.invalidate();
	return "redirect:/";
}

//********************************************************************************
@RequestMapping("album/add/new")
public String addAlbum(Model model,@ModelAttribute("newAlbum") Album newAlbum,HttpSession session) {
	Long locator = (Long) session.getAttribute("userId");
	User user = appServ.findUserById(locator);
	model.addAttribute("user", user);
	return "newAlbumForm.jsp";
}

//********************************************************************************
@PostMapping("/post/new/album")
public String postAlbum(@Valid @ModelAttribute("newAlbum") Album newAlbum) {
	appServ.createAlbum(newAlbum);
	return "redirect:/home";
}

//********************************************************************************
@RequestMapping("/album/view/{id}")
public String viewAlbum(@PathVariable("id") Long id, Model model, HttpSession session, @ModelAttribute("newImage") Image newImage) {
	Album album = appServ.findAlbumById(id);
	model.addAttribute("album", album);
	User user = appServ.findUserById((Long) session.getAttribute("userId"));
	model.addAttribute("user", user);
	model.addAttribute("sessId", (Long) session.getAttribute("userId"));
	return "albumView.jsp";
}

//********************************************************************************
	@RequestMapping("/image/view/{id}")
	public String imageDetail(@PathVariable("id") Long id, @ModelAttribute("newComment") Comment newComment, Model model, HttpSession session) {
		Image image = appServ.findImageById(id);
		model.addAttribute("image", image);
		model.addAttribute("sessId", (Long) session.getAttribute("userId"));
		return "imageDetail.jsp";
	}
//********************************************************************************
	@RequestMapping("/profile/view/{id}")
	public String profileView(@PathVariable("id") Long id, Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		User loggedIn = appServ.findUserById(userId);
		model.addAttribute("user", loggedIn);
		User usersProfile = appServ.findUserById(id);
		model.addAttribute("otherUser", usersProfile);
		boolean relationship = appServ.doesRelationshipExist(userId, id);
		model.addAttribute("status", relationship);
		return "profileView.jsp";
	}
//********************************************************************************
	@RequestMapping("/image/delete/{id}")
	public String deleteImage(@PathVariable("id") Long id) {
		Long album = appServ.findImageById(id).getAlbum().getId();
		appServ.deleteImage(id);
		return "redirect:/album/view/" + album;
	}

//********************************************************************************
	@RequestMapping("/home/friend/list")
	public String showFriendsList(HttpSession session, Model model) {
		User user = appServ.findUserById((Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		return "friendsList.jsp";
		
	}

//********************************************************************************
	@RequestMapping("/remove/friend/{id}")
	public String removeFriend(@PathVariable("id") Long id, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		appServ.removeFriend(userId, id);
		return "redirect:/home";
	}

//********************************************************************************
	@PostMapping("/post/comment/{imageId}")
	public String postComment(@Valid @ModelAttribute("newComment") Comment newComment, BindingResult result, HttpSession session, @PathVariable("imageId") Long imageId) {
		User user = appServ.findUserById((Long)session.getAttribute("userId"));
		Image image = appServ.findImageById(imageId);
		newComment.setImage(image);
		newComment.setUser(user);
		appServ.addComment(newComment);	
		return "redirect:/image/view/" + imageId;
		
		
	}
//********************************************************************************
//********************************************************************************
//********************************************************************************
//********************************************************************************
//********************************************************************************
//********************************************************************************
//********************************************************************************
@RequestMapping("/test")
public String testPage(@ModelAttribute("newImage") Image newImage) {
	
	return "testPage.jsp";
}
//********************************************************************************

//********************************************************************************

//*******************************************************************************

	
//**************************************************************************
}
