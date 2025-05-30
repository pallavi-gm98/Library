package com.student.studentcircle1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
public class Studentcircle1Application extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(Studentcircle1Application.class, args);
		System.err.println("Welcome to new project");
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(Studentcircle1Application.class);
	}
}
