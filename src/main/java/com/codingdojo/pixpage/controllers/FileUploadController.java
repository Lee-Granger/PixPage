package com.codingdojo.pixpage.controllers;

import java.util.List;

//import java.io.IOException;
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.codingdojo.pixpage.models.Album;
import com.codingdojo.pixpage.models.Image;
import com.codingdojo.pixpage.models.User;
import com.codingdojo.pixpage.services.AppService;

@MultipartConfig
@Controller
public class FileUploadController {
	public static String uploadDirectory = System.getProperty("user.dir")+"/uploads";
	private final AppService appServ;
	
	FileUploadController(AppService appServ){
		this.appServ = appServ;
	}
	
	@RequestMapping("/chicken")
	public String uploadPage(Model model) {
		System.out.println("The upload directory is: " + uploadDirectory);
		return "testPage.jsp";
	}
	
	
	//This method will store an image inside a directory in the workspace
	
//	@PostMapping("/test/upload/chicken")
//	public String chickenUpload(Model model, @RequestParam("files") MultipartFile[] files) {
//		StringBuilder fileNames = new StringBuilder();
//		for(MultipartFile file : files) {
//			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
//			fileNames.append(file.getOriginalFilename());
//			try {
//				Files.write(fileNameAndPath, file.getBytes());
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//		model.addAttribute("msg", "Successfully uploaded files " + fileNames.toString());
//		return "redirect:/home";
//	}
//**********************************************************************************************
	@PostMapping("/image/upload/{id}")
	public String imageUpload(Model model, @RequestParam("files") MultipartFile[] files, HttpSession session, @PathVariable("id") Long id, @RequestParam("description") String description) {
		StringBuilder fileNames = new StringBuilder();
		Long userId = (Long) session.getAttribute("userId");
		Long albumId = id;
		if(files[0].isEmpty()) {
//			*********************************
			Album album = appServ.findAlbumById(id);
			model.addAttribute("album", album);
			User user = appServ.findUserById((Long) session.getAttribute("userId"));
			model.addAttribute("user", user);
			List<Image> albumImages = album.getImages();
			if(albumImages.size() > 0) {
			Image img = albumImages.get(0);
			model.addAttribute("img", img);
			}
			model.addAttribute("error", "You must select a file");
			return "albumView.jsp";
		}
		for(MultipartFile file : files) {
//			Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			fileNames.append(file.getOriginalFilename());
			appServ.storeImage(file, albumId, userId, description);
		}
		model.addAttribute("message", "Upload Successful. Add Some more, or head back");
		return "redirect:/album/view/{id}";
	}
//**********************************************************************************************
//**********************************************************************************************







}
