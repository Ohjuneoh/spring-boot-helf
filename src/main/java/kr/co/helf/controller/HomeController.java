package kr.co.helf.controller;

import kr.co.helf.dto.TrainerDto;
import kr.co.helf.service.LessonService;
import kr.co.helf.service.TrainerReviewService;
import kr.co.helf.service.UserService;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class HomeController {

	private final TrainerReviewService trainerReviewService;

	private final UserService userService;

	private final LessonService lessonService;
	
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
		// 트레이너를 조회하는 로직
		List<Trainer> trainers = trainerReviewService.getAllTrainers();
		model.addAttribute("trainers",trainers);
		return "trainerIntro";
	}
	
	// 지점찾기 화면 요청을 처리
	@GetMapping(value="branch")
	public String branch() {
		return "branch";
	}	
	

	//홈 화면에 총 유저 수 , 개설 수업 수 , 강사정보 출력
	@GetMapping(value = "/")
	public String home(Model model) {
		// 총 유저 수를 조회하는 로직
		User user = userService.getUserAndTrainerCount();
		// 총 개설된 수업 수
		TrainerDto getAllCountLessons = lessonService.getAllCountLessons();
		// 강사 정보(강사사진포함)을 조회하는 로직
		List<Trainer> trainers = trainerReviewService.getAllTrainers();

		model.addAttribute("users",user);
		model.addAttribute("getAllCountLessons", getAllCountLessons);
		model.addAttribute("trainers", trainers);
		return "home";	
	}

}
