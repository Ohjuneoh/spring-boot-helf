package kr.co.helf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.helf.form.AddUserForm;
import kr.co.helf.service.UserService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
	
	@Autowired
	UserService userService = new UserService();
	
	
	// 로그인화면 요청처리
	@GetMapping(value="/loginform")
	public String loginForm() {
		return "/loginform";
	}

	// 회원가입화면 요청처리
	@GetMapping(value="/registerform")
	public String registerForm() {
		return "/registerform";
	}
	

	// 회원가입 요청
	@PostMapping(value="/register/user") 
	public String registerUser(AddUserForm form) {
		userService.createUser(form);
		
		return "redirect:/";
	}
	
	// 회원가입 요청
	@PostMapping(value="/register/trainer") 
	public String registerTrainer(AddUserForm form) {
		userService.createTrainer(form);
		
		return "redirect:/";
	}
	
	
	// 아이디찾기화면 요청처리
	@GetMapping(value="/findId")
	public String findId() {
		
		return "/findId";
	}

}
