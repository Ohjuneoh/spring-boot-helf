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
	
	// 로그인화면 요청을 처리
	@GetMapping(value="login")
	public String loginForm() {
		return "loginform";
	}
	
	// Concept 화면 요청을 처리
	@GetMapping(value="concept")
	public String concept() {
		
		return "concept";
	}
		
	// 강사소개 화면 요청을 처리
	@GetMapping(value="trainerIntro")
	public String trainerIntro() {
		
		return "trainerIntro";
	}
	
	// 지점찾기 화면 요청을 처리
	@GetMapping(value="branch")
	public String gymfind() {
		
		return "branch";
	}

	
	@GetMapping(value="register")
	public String registerForm() {
		
		return "registerform";
	}
	
	@GetMapping(value = "/home")
	public String home2() {
		
		return "home";	
	}
}
