package kr.co.helf.controller;

import kr.co.helf.form.GroupLessonForm;
import kr.co.helf.service.GroupLessonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/grouplesson")
@RequiredArgsConstructor
public class GroupLessonController {

    private final GroupLessonService groupLessonService;
    @GetMapping("/registration")
    public String lessonForm() {
        return "grouplesson/trainerform";
    }
    @GetMapping(value = "list")
    public String lessonList() {
        return "grouplesson/trainerlist";
    }

//    @PostMapping("/registration")
//    public String lesson(GroupLessonForm groupLessonForm){
//        groupLessonService.insertLesson(groupLessonForm);
//        return "redirect:/grouplesson/list";
//    }

}
