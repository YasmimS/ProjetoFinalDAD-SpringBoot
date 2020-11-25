package com.myapphelloworld.example.myapphelloworld.rest;

import java.time.LocalDateTime;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloRestController {
	@GetMapping("/")
	public String sayHelloWorld() {
		return "Hello World in Spring Boot Time on Server is: " +LocalDateTime.now();
	}
	
}
