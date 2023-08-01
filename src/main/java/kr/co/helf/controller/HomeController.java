package kr.co.helf.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
@Slf4j
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
<<<<<<< HEAD
	
	// 지점찾기 화면 요청을 처리
	@GetMapping(value="branch")
	public String gymfind() {
		
		return "branch";
	}
=======
>>>>>>> ceed97ca7d134a16daece5865b524d94cd9c7581

	@GetMapping(value="register")
	public String registerForm() {
		
		return "registerform";
	}
<<<<<<< HEAD
	
	@GetMapping(value = "/home")
	public String home2() {

		return "gymfind";
	}		

=======

	@GetMapping(value = "/")
	public String home() {
		
		return "home";	
	}
>>>>>>> ceed97ca7d134a16daece5865b524d94cd9c7581
}
