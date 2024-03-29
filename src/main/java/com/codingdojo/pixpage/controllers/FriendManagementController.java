package com.codingdojo.pixpage.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.pixpage.services.AppService;

@Controller
public class FriendManagementController {
	@Autowired
	AppService appServ;
	
//***************************************************************************************
	@RequestMapping("/friend/add/{id}")
	public String addFriend(HttpSession session, @PathVariable("id") Long otherUserId) {
		Long loggedInId = (Long) session.getAttribute("userId");
		appServ.createFriendRelationship(loggedInId, otherUserId);
		return "redirect:/profile/view/{id}";
	}
//***************************************************************************************
//***************************************************************************************
//***************************************************************************************
//***************************************************************************************

}
