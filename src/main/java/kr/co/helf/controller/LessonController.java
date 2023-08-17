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

<<<<<<< Updated upstream
    private final LessonService lessonService;
=======
	@GetMapping(value = "registration")
	public String lessonRegist() {
		return "lesson/trainerform";
	}
>>>>>>> Stashed changes

    @GetMapping("/user-my-lesson")
    public String lessonList(@AuthenticationPrincipal User user, Model model) {
        List<LessonApply> applyList = lessonService.getAllMyLessons(user.getId());
        model.addAttribute("applyList",applyList);

        return "lesson/mylesson";
    }
    @GetMapping("/trainer-my-lesson")
    public String trainerList(@AuthenticationPrincipal User user, Model model){
        List<Lesson> createList = lessonService.getAllCreateLessons(user.getId());
        model.addAttribute("createList",createList);

        return "lesson/trainerlesson";
    }
}
