package kr.co.helf.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
@SessionAttributes("addUserForm")
@RequiredArgsConstructor

public class UserController {
	
	@Autowired
	UserService userService = new UserService();
	
	/* 회원가입 시작 */
	// 회원가입 초기화면 
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

	// 회원가입 완료화면(유저)
	@GetMapping(value="/welcome")
	public String welcomePage() {
		
		return "welcome"; 	
	}
	
	// 회원가입 두번째 화면(트레이너)
	@PostMapping(value="/register/trainer") 
	public String registerTrainer(@ModelAttribute("addUserForm") AddUserForm form) {
		
		return "register/trainerRegisterform2";
	}

	
	// 회원가입 완료화면 (트레이너)
	@PostMapping(value="/register/trainer2")
	public String registerTrainer2(@ModelAttribute("addUserForm") AddUserForm form) throws IOException {
		System.out.println(form);
		userService.createTrainer(form);
		
		return "register/trainerWelcome";
	}
	

	// 아이디 중복검사 요청(ajax)
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
	/* 회원가입 끝 */
	
	
	
	
	/* 로그인 시작 */
	
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
	
	
	
	// 아이디 찾기 (ajax)
	@GetMapping("/findId")
	@ResponseBody
	public String findId(@RequestParam("name") String name,@RequestParam("tel") String tel) throws Exception {
		String result = userService.findId(name, tel);
		
		if(result == null) {
			return "fail";	
		} else {
			return result;	
		}
	}
	
	
	// 비밀번호 찾기 (ajax) - 인증번호 전송
	@GetMapping("/findPwdAuth")
	@ResponseBody
	public String findPwd(@RequestParam("id") String userId) throws Exception {
		try {
			userService.findPwdAuth(userId);
			return "success";	
			
		} catch (RuntimeException ex) {
			ex.printStackTrace();
			return "fail";	
		}
	}
	
	// 비밀번호 찾기 (ajax) - 인증번호 인증
	
	
	
	
//	@PostMapping("/findPwd")
//	public String findPassword(String userId) {
//		userService.initPassword(userId);
//		return "/login/findPwdFinish";
//	}
	
	
	
	
	
	
	
//	@PostMapping(value="/findIdByEmail")
//	@ResponseBody
//	public String findIdEmail(@RequestParam("name") String name, 
//			@RequestParam(name = "email", required = false) String email) {
//		
//		try {
//			userService.getFindIdByTel(name, email);		
//			return "success";
//		} catch (RuntimeException ex) {
//			return "fail";
//		}
		
		
		
//	}
	
	// 비밀번호찾기 화면
	@GetMapping(value="/findPwd")
	public String findPassword() {
		
		return "login/findPwd";
	}
	
	//인증되지 않은 사용자가 접근 했을 때 이동되는 페이지(by 준오)
	@GetMapping(value="/denied")
	public String unAuthenticatedUser() {
		
		return "error/user";
	}

	/* 로그인 끝 */
}
