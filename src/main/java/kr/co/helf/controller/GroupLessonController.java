package kr.co.helf.controller;

import kr.co.helf.form.GroupLessonForm;
import kr.co.helf.service.GroupLessonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/lesson")
@RequiredArgsConstructor
public class GroupLessonController {

    private final GroupLessonService groupLessonService;
    @GetMapping(value = "registration")
    public String lessonForm() {
        return "lesson/form";
    }
    @PostMapping("/registration")
    public String lesson(GroupLessonForm groupLessonForm){
        groupLessonService.insertLesson(groupLessonForm);
        return "redirect:/lesson/list";
    }

    @GetMapping(value = "list")
    public String lessonList() {
        return "lesson/list";
    }

}
