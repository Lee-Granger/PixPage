package com.codingdojo.pixpage;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication
@ComponentScan({"com.codingdojo.pixpage", "com.codingdojo.pixpage.controllers"})
public class PixpageApplication {

	public static void main(String[] args) {
		SpringApplication.run(PixpageApplication.class, args);
	}

}
