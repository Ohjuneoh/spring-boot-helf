package kr.co.helf.controller;

import kr.co.helf.service.GroupLessonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/personallesson")
@RequiredArgsConstructor
public class PersonalLessonControler {

	//트레이너가 자신의 강의에 수강신청한 유저목록을 조회하는 페이지
    private final GroupLessonService groupLessonService;
    @GetMapping("/userlist")
    public String trainerUserList() {
        return "personallesson/list";
    }
    
    //유저가 트레이너에게 상담신청하는 페이지
    @GetMapping("/consulting")
    public String personalLessonRegistration() {
        return "personallesson/consultingform";
    }



}
