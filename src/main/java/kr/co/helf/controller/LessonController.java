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

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/lesson")
public class LessonController {

    private final LessonService lessonService;

    @GetMapping("/mylesson")
    public String lessonList(@AuthenticationPrincipal User user, Model model) {
        List<LessonApply> applyList = lessonService.getAllMyLessons(user.getId());
        model.addAttribute("applyList",applyList);

        return "lesson/mylesson";
    }
}
