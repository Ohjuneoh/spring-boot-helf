package kr.co.helf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class HomeController {
	
	@GetMapping(value = "/")
	public String home() {
		
		
		return "home";	
	}
	
	@GetMapping(value="/user/login")
	public String loginForm() {
		return "loginform";
	}
	
	@GetMapping(value="/user/register")
	public String registerForm() {
		return "registerform";
	}
	
	@GetMapping(value = "/home")
	public String home2() {
		
		return "home";	
	}
}
