package kr.co.helf.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.helf.service.UserService;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/checkin")
@Slf4j
public class CheckInController {

	@Autowired
	UserService userService;
	
	// 입장 폼 요청 페이지 
	@GetMapping(value="check-in")
	public String checkInForm() {
		return "checkin/checkInform";
	}
	
	// 회원 휴대폰 뒷번호 네 자리 조회 요청과 매핑되는 요청핸들러 메소드 
	@GetMapping("/customer-verification")
	@ResponseBody
	public List<User> verifyNumbers(@RequestParam("fourDigits") String fourDigits) {
		List<User> userList = userService.getUsersWithFourDigits(fourDigits);
		return userList;
	}
	
	// 선택 폼 요청 페이지
	@GetMapping("/check-in-choice")
	public String checkInChoice() {
		return "checkin/checkInChoice";
	}
	
	
	
}
