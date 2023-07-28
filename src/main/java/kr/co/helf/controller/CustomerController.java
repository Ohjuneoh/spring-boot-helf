package kr.co.helf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cust")
public class CustomerController {

	// 로그인폼 화면 요청을 처리하는 요청핸들러 메소드
	@GetMapping(value="/login")
	public String form() {
		return "customer/loginform";
	}
	
}
