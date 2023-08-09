package kr.co.helf.controller;

import kr.co.helf.service.PersonalLessonService;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.User;

import java.util.Date;
import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/personallesson")
@RequiredArgsConstructor
public class PersonalLessonControler {
	
	private final PersonalLessonService personalLessonService;

    //유저가 트레이너에게 상담신청하는 페이지
	@GetMapping("/consulting")
	public String consultingForm(Model model) {
		List<Trainer> trainers = personalLessonService.getTrainers();
		model.addAttribute("trainers", trainers); // 트레이너 목록을 뷰에 전달
		return "personallesson/consultingform";
	}
	
//	@PostMapping("/consulting")
//	public String consulting(@AuthenticationPrincipal User user,
//							 @RequestParam("goal") String goal,
//							 @RequestParam("abnormality") String abnormality,
//							 @RequestParam("date") Date date,
//							 @RequestParam("time") String time){
//		LessonApply lessonApply = new LessonApply();
//		lessonApply.setExerciseGoal(goal);
//		lessonApply.setPhysicalAbnomality(abnormality);
//		lessonApply.setRequestDate(date);
//		lessonApply.setRequestTime(time);
//		
//		lessonApply.setUser(user);
//		
//		personalLessonService.personalLessonApply(lessonApply);
//		
//		
//		
//	}
	
}