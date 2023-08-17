package kr.co.helf.controller;

import kr.co.helf.service.LessonService;
import kr.co.helf.vo.Lesson;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/lesson")
public class LessonController {


    private final LessonService lessonService;

    @GetMapping(value = "registration")
	public String lessonRegist() {
		return "lesson/trainerform";
	}

    // 유저가 신청한 모든 수업 조회
    @GetMapping("/user-my-lesson")
    public String lessonList(@AuthenticationPrincipal User user, Model model) {
        List<LessonApply> applyList = lessonService.getAllMyLessons(user.getId());
        model.addAttribute("applyList",applyList);

        return "lesson/myLesson";
    }
    // 강사가 개설한 모든 수업 조회
    @GetMapping("/trainer-my-lesson")
    public String trainerList(@AuthenticationPrincipal User user, Model model){
        List<Lesson> createList = lessonService.getAllCreateLessons(user.getId());
        model.addAttribute("createList",createList);
        return "lesson/trainerLesson";
    }
    // 개설한 수업에 대해 유저목록 조회
    @GetMapping("/trainer-user-apply")
    @ResponseBody
    public List<LessonApply> getAllUsers(int lessonNo){
        List<LessonApply> LessonApplies = lessonService.getAllUsers(lessonNo);
        return LessonApplies;
    }
    // 개설한 수업에 대한 출석체크
    @GetMapping("/trainer-user-attendance")
    @ResponseBody
    public void updateAttendance(int lessonNo,String userId,String status){
        lessonService.updateAttendance(lessonNo,userId,status);
    }
}
