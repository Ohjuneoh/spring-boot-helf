package kr.co.helf.controller;

import kr.co.helf.service.GroupLessonService;
import kr.co.helf.vo.Lesson;
import kr.co.helf.vo.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/grouplesson")
@RequiredArgsConstructor
public class GroupLessonController {

    private final GroupLessonService groupLessonService;
    @GetMapping("/registration")
    public String lessonForm() {
        return "/grouplesson/form";
    }
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
        lesson.setDescription(description);
        // 로그인한 유저의 아이디 담기
        lesson.setUser(user);

        groupLessonService.createLesson(lesson);
        return "redirect:/grouplesson/list";
    }

    @GetMapping(value = "/list")
    public String lessonList(@RequestParam(name ="page", required = false,defaultValue ="1")int page, Model model) {
        Map<String,Object> param = new HashMap<String,Object>();
        param.put("page", page);

        Map<String,Object> result = groupLessonService.getAllLessons(param);

        model.addAttribute("result", result);
        return "grouplesson/list";
    }

    @GetMapping("/detail")
    public String lessonDetail(@RequestParam("no") int lessonNo, Model model){
        Lesson lesson = groupLessonService.getLessonByNo(lessonNo);
        model.addAttribute("lesson", lesson);
        return "/grouplesson/detail";
    }

    // 신청 시 신청인원 증가
    @GetMapping("/read")
    public String reqCount(@RequestParam("no") int lessonNo){
        groupLessonService.updateReqCount(lessonNo);

        return "redirect:/grouplesson/detail?no="+lessonNo;
    }
}
