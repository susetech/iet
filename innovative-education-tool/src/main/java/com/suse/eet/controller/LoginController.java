package com.suse.eet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.suse.eet.service.EETService;

@RestController
@RequestMapping("/rest/hello")
public class LoginController {
	@Autowired
	private EETService service;

	
	

	@GetMapping("/all")
	public String hello() {
		return "Hello Sujith first commit";
	}

	@PreAuthorize("hasAnyRole('ADMIN')")
	@GetMapping("/secured/all")
	public String securedHello() {
		return "Secured Hello";
	}
}
