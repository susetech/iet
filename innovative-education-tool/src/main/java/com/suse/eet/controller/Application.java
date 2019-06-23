package com.suse.eet.controller;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.suse.eet")
@EntityScan("com.suse.eet")
public class Application {

	public static void main(String[] args) {
		ApplicationContext ctx = SpringApplication.run(Application.class, args);

	}
}
