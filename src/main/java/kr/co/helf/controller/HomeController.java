package kr.co.helf.controller;

import kr.co.helf.service.TrainerReviewService;
import kr.co.helf.vo.Trainer;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
@Slf4j
public class HomeController {

	private final TrainerReviewService trainerReviewService;
	
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
	public String trainerIntro(Model model) {
		List<Trainer> trainers = trainerReviewService.getAllTrainers();
		model.addAttribute("trainers",trainers);
		return "trainerIntro";
	}
	
	// 지점찾기 화면 요청을 처리
	@GetMapping(value="branch")
	public String branch() {
		return "branch";
	}	
	
	
	@GetMapping(value = "/")
	public String home() {
		
		return "home";	
	}
}
