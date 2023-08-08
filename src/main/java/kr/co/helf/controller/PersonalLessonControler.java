package kr.co.helf.controller;

import kr.co.helf.service.PersonalLessonService;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.User;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/personallesson")
@RequiredArgsConstructor
public class PersonalLessonControler {
	
	private final PersonalLessonService personalLessonService;
	

	//트레이너가 자신의 강의에 수강신청한 유저목록을 조회하는 페이지
//    @GetMapping("/userlist")
//    public String trainerUserList() {
//        return "personallesson/list";
//    }
    
    //유저가 트레이너에게 상담신청하는 페이지
    @GetMapping("/consulting")
    public String trainerList(Model model) {
    	List<Trainer> trainerList = personalLessonService.getAllTrainers();
    	model.addAttribute("trainers", trainerList);
        return "personallesson/consultingform";
    }



}
