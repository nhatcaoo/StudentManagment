package com.example.service;


import java.io.IOException;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = { "com.example" })
public class HelloWorldApplication {

	public static void main(String[] args) throws IOException {

		SpringApplication.run(HelloWorldApplication.class, args);
	}

}
