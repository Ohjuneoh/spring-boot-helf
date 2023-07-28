package kr.co.helf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@GetMapping(value = "/home")
	public String home2() {
		
		return "home";	
	}
	
	@GetMapping(value="/about")
	public String about() {
		
		return "about";
		
	}
	
	@GetMapping(value="/blog")
	public String blog() {
		
		return "blog";
		
	}
	
	@GetMapping(value="/detail")
	public String detail() {
		
		return "detail";
		
	}
	
	@GetMapping(value="/feature")
	public String feature() {
		
		return "feature";
		
	}
	
	@GetMapping(value="/lesson")
	public String lesson() {
		
		return "lesson";
		
	}
	
	
	
}
