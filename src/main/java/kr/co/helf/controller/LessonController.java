package kr.co.helf.controller;

import kr.co.helf.dto.MyPersonalLessonDto;
import kr.co.helf.service.LessonService;
import kr.co.helf.vo.Consultation;
import kr.co.helf.vo.Lesson;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.PersonalLesson;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/lesson")
public class LessonController {

    private final LessonService lessonService;

    // 유저가 신청한 모든 수업 조회
    @GetMapping("/user-my-lesson")
    public String lessonList(@AuthenticationPrincipal User user, Model model) {
    	//유저의 그룹수업 조회
        List<LessonApply> applyList = lessonService.getAllMyLessons(user.getId());
        // 유저의 1:1 개인PT 조회
        List<MyPersonalLessonDto> myPersonalLessonList = lessonService.getAllMyTrainers(user.getId());
        
        model.addAttribute("personalLessonList",myPersonalLessonList);
        model.addAttribute("applyList",applyList);

        return "lesson/myLesson";
    }

    // 강사가 개설한 모든 수업 조회 (0829 최종수정 by 준오)
    @GetMapping("/trainer-my-lesson")
    public String trainerList(@AuthenticationPrincipal User user, Model model){
        List<Lesson> createList = lessonService.getAllCreateLessons(user.getId());
        //트레이너의 번호 조회
        Trainer trainer = lessonService.getTrainerNo(user.getId());
        //트레이너의 번호를 기준으로 레슨조회
        List<PersonalLesson> personalLessonList = lessonService.getAllPersonalLessons(trainer.getTrainerNo());
        //트레이너의 번호를 기준으로 상담내역 조회
        List<Consultation> consultationList = lessonService.getAllConsultationList(trainer.getTrainerNo());
        
        model.addAttribute("consultationList", consultationList);
        model.addAttribute("personalLessonList", personalLessonList);
        model.addAttribute("createList",createList);
        return "lesson/trainerLesson";
    }

    // 개설한 그룹수업에 대해 유저목록 조회
    @GetMapping("/trainer-user-apply")
    @ResponseBody
    public List<LessonApply> getAllUsers(int lessonNo){
        List<LessonApply> LessonApplies = lessonService.getAllUsers(lessonNo);
        return LessonApplies;
    }

    // 개설한 그룹수업에 대한 출석체크
    @GetMapping("/trainer-user-attendance")
    @ResponseBody
    public void updateAttendance(int lessonNo,String userId,String status){
        lessonService.updateAttendance(lessonNo,userId,status);
    }

    //개인 PT 유저의 수업목록 조회
    @GetMapping("trainer-user-consultation")
    @ResponseBody
    public List<PersonalLesson> getAllPersonalLesson(int membershipNo, int trainerNo, String userId){
    	
    	Map<String, Object> params = new HashMap<>();
    	params.put("membershipNo", membershipNo);
        params.put("trainerNo", trainerNo);
        params.put("userId", userId);
    	
    	List<PersonalLesson> personalLessonList = lessonService.getAllPersonalLessonByUser(params);
    	return personalLessonList;
    }

    //개인수업 출석체크
    @GetMapping("/personal-lesson-attendance")
    @ResponseBody
    public void updatePersonalLessonAttendance(int lessonNo,String status){
        lessonService.updatePersonalLessonAttendance(lessonNo,status);
    }
    
}
