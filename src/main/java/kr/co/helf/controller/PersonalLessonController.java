package kr.co.helf.controller;

import kr.co.helf.service.PersonalLessonService;
import kr.co.helf.vo.Consultation;
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
@RequestMapping("/personal-lesson")
@RequiredArgsConstructor
public class PersonalLessonController {
	
	private final PersonalLessonService personalLessonService;

    //유저가 트레이너에게 상담신청하는 페이지
	@GetMapping("/consultation")
	public String consultingForm(Model model) {
		List<Trainer> trainers = personalLessonService.getTrainers();
		model.addAttribute("trainers", trainers); // 트레이너 목록을 뷰에 전달
		return "personal-lesson/consultingform";
	}
	//상담신청 제출
	@PostMapping("/consultation")
	public String createConsultation(@AuthenticationPrincipal User user,
							 @RequestParam("goal") String goal,
							 @RequestParam("abnormalities") String abnormalities,
							 @RequestParam("date") Date date,
							 @RequestParam("time") String time,
							 @RequestParam("trainerNumber") int trainerNumber){
		
		Consultation consultation = new Consultation();
		consultation.setGoal(goal);
		consultation.setAbnormalities(abnormalities);
		consultation.setRequestDate(date);
		consultation.setRequestTime(time);
		consultation.setUser(user);
		Trainer trainer = new Trainer();
		trainer.setTrainerNo(trainerNumber);
		
		consultation.setTrainer(trainer);
		
		personalLessonService.createConsultation(consultation);
		
		return "redirect:/personal-lesson/consultation";
		
	}
	
	//트레이너 1대1 상담신청 조회
	@GetMapping("/list")
	public String consultationList(Model model) {
		return "personal-lesson/consultationlist";
	}
	
}