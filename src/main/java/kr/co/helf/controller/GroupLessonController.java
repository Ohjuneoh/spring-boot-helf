package kr.co.helf.controller;

import kr.co.helf.form.ModifyGroupLessonForm;
import kr.co.helf.service.GroupLessonService;
import kr.co.helf.vo.Lesson;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/group-lesson")
@RequiredArgsConstructor
@ControllerAdvice
public class GroupLessonController {

    private final GroupLessonService groupLessonService;

    // 레슨 등록 화면
    @GetMapping("/registration")
    public String lessonForm() {
        return "/group-lesson/form";
    }
    // 레슨 등록
    @PostMapping("/registration")
    public String lesson(@AuthenticationPrincipal User user,
                         @RequestParam("name") String name,
                         @RequestParam("quota") int quota,
                         @RequestParam("date")Date date,
                         @RequestParam("time") String time,
                         @RequestParam("description")String description){
        // 레슨객체에 trainerform에 입력값 담기
        Lesson lesson = new Lesson();
        lesson.setName(name);
        lesson.setQuota(quota);
        lesson.setDate(date);
        lesson.setTime(time);
        lesson.setType("group");
        lesson.setDescription(description);
        // 로그인한 유저의 아이디 담기
        lesson.setUser(user);

        groupLessonService.createLesson(lesson);
        return "redirect:/group-lesson/list";
    }

    // 전체 게시글 조회(페이징 처리 포함)
    @GetMapping(value = "/list")
    public String lessonList(@AuthenticationPrincipal User user,
                             @RequestParam(name ="page", required = false,defaultValue ="1")int page,
                             Model model) {
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("page", page);
        Map<String,Object> result = groupLessonService.getAllLessons(user.getId(),user.getType(),param);

        model.addAttribute("result", result);
        return "group-lesson/list";
    }

    // 개설된 레슨 상세
    @GetMapping("/detail")
    public String lessonDetail(@RequestParam("no") int lessonNo, Model model){
        Lesson lesson = groupLessonService.getLessonByNo(lessonNo);
        List<LessonApply> lessonApplies = groupLessonService.getAllDetailUsers(lessonNo);

        model.addAttribute("lesson", lesson);
        model.addAttribute("lessonApplies", lessonApplies);
        return "group-lesson/detail";
    }

    // 유저가 수업신청 시 신청인원 증가 , LessonApply 테이블에 저장, 중복신청 불가, 이용권 횟수 차감, 이용권 모두 소진시 이용권 상태 변경
    @GetMapping("/request")
    @ResponseBody
    public Map<String, String> reqCount(@RequestParam("no") int lessonNo, @AuthenticationPrincipal User user) {
        Map<String,String> response = new HashMap<>();
        // 맵에 status란 이름으로 값을 담아서 jsp에서 예외처리 하는 로직
        try {
            groupLessonService.updateApplyLesson(lessonNo,user);
            response.put("status","success");
        } catch (Exception ex) {
            response.put("status","fail");
        }
        return response;
    }

    // 개설된 수업 수정 화면요청
    @GetMapping("/modify")
    public String getLessonModify(@RequestParam("no") int lessonNo,Model model){
        Lesson lesson = groupLessonService.getLessonByNo(lessonNo);
        model.addAttribute("lesson", lesson);

        return "group-lesson/modifyForm";
    }
    
    // 개설된 수업 수정
    @PostMapping("/modify")
    public String modifyLesson(@RequestParam("no") int no,
                               @RequestParam("name") String name,
                               @RequestParam("quota") int quota,
                               @RequestParam("date") Date date,
                               @RequestParam("time") String time,
                               @RequestParam("description") String description,
                               @AuthenticationPrincipal User user) {
        ModifyGroupLessonForm form = new ModifyGroupLessonForm();
        form.setNo(no);
        form.setName(name);
        form.setQuota(quota);
        form.setDate(date);
        form.setTime(time);
        form.setDescription(description);

        groupLessonService.updateLesson(form,user);

        return "redirect:/group-lesson/list";
    }
    // 개설된 레슨 삭제
    @GetMapping("/delete")
    public String deleteLesson(@RequestParam("no") int lessonNo, @AuthenticationPrincipal User user) {
        groupLessonService.deleteLesson(lessonNo,user);

        return "redirect:/group-lesson/list";
    }

}
