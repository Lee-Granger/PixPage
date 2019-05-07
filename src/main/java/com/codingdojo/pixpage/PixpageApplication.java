package com.codingdojo.pixpage;

import java.io.File;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.codingdojo.pixpage.controllers.FileUploadController;

@SpringBootApplication
@ComponentScan({"com.codingdojo.pixpage", "com.codingdojo.pixpage.controllers"})
public class PixpageApplication {

	public static void main(String[] args) {
		//Will create the directory on startup if it does not exist. File() takes a String. you set the string or path 
		//in the uploadController file.
		new File(FileUploadController.uploadDirectory).mkdir();
		
		
		SpringApplication.run(PixpageApplication.class, args);
	}

}
