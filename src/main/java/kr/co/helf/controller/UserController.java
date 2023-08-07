package kr.co.helf.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
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
	public String registerForm(Model model) {
		
		model.addAttribute("addUserForm", new AddUserForm());
		return "/registerform";
	}
	

	// 회원가입 요청
	@PostMapping(value="/register/user") 
	public String registerUser(@Valid AddUserForm form, BindingResult bindingResult, Model model) {
		// 검증 
		if (bindingResult.hasErrors()) {
			
			// 회원가입 실패 시 입력 데이터 값 유지
			model.addAttribute("form", form );
			
			// 유효성 검사를 통과하지 못 한 필드와 메시지 핸들링 
			Map<String, String> errorMap = new HashMap<>();

			for(FieldError error : bindingResult.getFieldErrors()) {
				errorMap.put("valid_"+error.getField(), error.getDefaultMessage());
			}
		// 회원가입 페이지로 리턴
		return "/registerform";
		
	}
		// 회원가입 성공 시 
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
	
	// 비밀번호찾기화면 요청처리
	@GetMapping(value="/findPwd")
	public String findPassword() {
		
		return "/findPwd";
	}

}
