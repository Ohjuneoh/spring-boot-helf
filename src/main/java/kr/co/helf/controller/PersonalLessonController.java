package kr.co.helf.controller;

import kr.co.helf.dto.UserConsultations;
import kr.co.helf.dto.UserMyMemberships;
import kr.co.helf.service.PersonalLessonService;
import kr.co.helf.vo.Consultation;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.PersonalLesson;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.User;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/personal-lesson")
@RequiredArgsConstructor
public class PersonalLessonController {
	
	private final PersonalLessonService personalLessonService;

    //유저가 트레이너에게 상담신청하는 페이지
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/consultation")
	public String consultingForm(@AuthenticationPrincipal User user, Model model) {
		List<Trainer> trainers = personalLessonService.getTrainers(user.getId());
		List<UserMyMemberships> memberships = personalLessonService.getUserMembershipById(user.getId());
		model.addAttribute("memberships",memberships);
		model.addAttribute("trainers", trainers); 
		return "personal-lesson/consultingform";
	}
	//상담신청 제출
	@PreAuthorize("hasRole('ROLE_USER')")
	@PostMapping("/consultation")
	public String createConsultation(@AuthenticationPrincipal User user,
							 @Valid Consultation consultation,BindingResult bindingResult,
							 @RequestParam("trainerNumber") int trainerNumber,
							 @RequestParam("membershipNo") int membershipNo, Model model){
		if(bindingResult.hasErrors()) {
	        List<String> errorMessages = bindingResult.getAllErrors().stream()
	            .map(ObjectError::getDefaultMessage)
	            .collect(Collectors.toList());
	        model.addAttribute("errors", errorMessages);
	        return "error/personalLesson";
	    }
		consultation.setUser(user);
		MyMembership myMembership = new MyMembership();
		myMembership.setNo(membershipNo);
		Trainer trainer = new Trainer();
		trainer.setTrainerNo(trainerNumber);
		
		consultation.setTrainer(trainer);
		consultation.setMyMembership(myMembership);
		
		personalLessonService.createConsultation(consultation);
		
		return "redirect:/personal-lesson/consultation";
		
	}
	
	//트레이너 1대1 상담신청 조회
	@PreAuthorize("hasRole('ROLE_TRAINER')")
	@GetMapping("/list")
	public String consultationList(@AuthenticationPrincipal User user, Model model) {
		
		List<UserConsultations> consultations = personalLessonService.getUserConsultationsByTrainerNo(user.getId());
		
		model.addAttribute("consultations",consultations);
		return "personal-lesson/consultationlist";
	}
	//유저 상담신청한 트레이너 조회
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/trainer-list")
	public String trainerList(@AuthenticationPrincipal User user, Model model) {
		
		List<UserConsultations> consultations = personalLessonService.getUserConsultationsByUserId(user.getId());
		List<Trainer> trainers = personalLessonService.getTrainerByConsultationWithUserId(user.getId());
		List<UserMyMemberships> memberships = personalLessonService.getUserMembershipById(user.getId());
		
		model.addAttribute("memberships",memberships);
		model.addAttribute("trainers", trainers); 
		model.addAttribute("consultations",consultations);
		
		return "personal-lesson/userConsultationList";
	}
	
	//유저가 상담 신청한 신청내역 조회
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/consultation-list")
	@ResponseBody
	public Consultation userConsultationList(@AuthenticationPrincipal User user,@RequestParam("trainerNo") int trainerNo, Model model) {
		
		Consultation consultation = personalLessonService.getConsultationByUserId(user.getId(), trainerNo);
		
		model.addAttribute("consultation",consultation);
		
		return consultation;
	}
	
	

	//트레이너 1대1 상담신청 조회 후 수업개설
	@PreAuthorize("hasRole('ROLE_TRAINER')")
	@PostMapping("/list")
	public String reservation(@RequestParam("userId") String userId,
								@RequestParam("trainerNo") int trainerNo,
								@RequestParam("myMembershipNo") int membershipNo,
								@RequestParam("lessonName") String lessonName,
								@RequestParam("content") String content,
								 @RequestParam("date") String dateStr,
								@RequestParam("time") String time,
								@RequestParam("consultationNo") int consultationNo)  {
		
		PersonalLesson personalLesson = new PersonalLesson();
		
		personalLesson.setName(lessonName);
		personalLesson.setContent(content);
		 try {
		        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		        Date date = formatter.parse(dateStr);
		        personalLesson.setDate(date);
		    } catch (ParseException e) {
		        e.printStackTrace();
		        // 날짜 형식이 잘못된 경우 적절한 오류 처리를 수행합니다. (예: 오류 메시지를 보여주거나 로그를 남김)
		    }
		    
		    personalLesson.setTime(time);
		personalLesson.setTime(time);
		
		User user = new User();
		user.setId(userId);
		
		Trainer trainer = new Trainer();
		trainer.setTrainerNo(trainerNo);
		
		MyMembership myMembership = new MyMembership();
		myMembership.setNo(membershipNo);
		
		personalLesson.setUser(user);
		personalLesson.setMyMembership(myMembership);
		personalLesson.setTrainer(trainer);
		
		Consultation consultation = new Consultation();
		consultation.setConsultationNo(consultationNo);
		
		
		personalLessonService.createPersonalLesson(personalLesson, consultation);
		
		return "redirect:/personal-lesson/list";
	}
	
	//상담요청 삭제
	@PostMapping("/consultation-delete")
	public String consultationDelete(@AuthenticationPrincipal User user, Model model, int consultationNo, int trainerNo) {
		personalLessonService.updateConsultationStatus(user.getId(), consultationNo);
		
		return "redirect:/personal-lesson/trainer-list?trainerNo=" + trainerNo;
		
	}
	
	
	
}