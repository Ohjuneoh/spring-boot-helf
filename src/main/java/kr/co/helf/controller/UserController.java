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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.helf.form.AddUserForm;
import kr.co.helf.service.UserService;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@SessionAttributes("AddUserForm")
@RequiredArgsConstructor

public class UserController {
	
	@Autowired
	UserService userService = new UserService();
	
	// 회원가입화면 
	@GetMapping(value="/registerform")
	public String registerForm(Model model) {
		
		model.addAttribute("addUserForm", new AddUserForm());
		return "/registerform";
	}
	

	// 회원가입 요청(유저)
	@PostMapping(value="/register/user") 
	public String registerUser(AddUserForm form, RedirectAttributes attributes) {

		userService.createUser(form);
		attributes.addFlashAttribute("name", form.getName());
		
		return "redirect:/user/welcome";
		
	}
	
	// 요청 완료화면 요청 
	@GetMapping(value="/welcome")
	public String welcomePage() {
		
		return "welcome"; 	
	}
	
	// 회원가입 요청1(트레이너)
	@PostMapping(value="/register/trainer") 
	public String registerTrainer(AddUserForm form) {
		
		return "register/trainerRegisterform2";
	}

	
	// 회원가입 요청2(트레이너)
	@PostMapping(value="/register/trainer2")
	public String registerTrainer2(AddUserForm form) {
		userService.createTrainer(form);
		
		return "/";
		
	}
	
	
	// 회원가입 완료 요청(트레이너) 
	@PostMapping(value="/register/trainter2")
	public String registerTrainerForm(AddUserForm form, RedirectAttributes attributes) {
		userService.createTrainer(form);
		
		
		return "redirect:/user/welcome";
	}
	
	
	// 아이디 중복검사 요청
	@RequestMapping(value ="/idChk", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(String userId) throws Exception{
		int result = userService.idCheck(userId);
		
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
			
		} else {
			return "success";	// 중복 아이디 x
		}
	} 
	
	
	// 로그인화면 
	@GetMapping(value="/loginform")
	public String loginForm() {
		return "login/loginform";
	}
	
	// 아이디찾기 화면
	@GetMapping(value="/findIdform")
	public String findIdform() {
		
		return "login/findId";
	}
	
	// 아이디찾기 구현
//	@PostMapping(value="/")
//	public String findI(AddUserForm form, RedirectAttributes attributes) {
//
//		userService.createUser(form);
//		attributes.addFlashAttribute("name", form.getName());
//		
//		return "redirect:/user/welcome";
//	}
	
	// 비밀번호찾기 화면
	@GetMapping(value="/findPwd")
	public String findPassword() {
		
		return "login/findPwd";
	}

}
