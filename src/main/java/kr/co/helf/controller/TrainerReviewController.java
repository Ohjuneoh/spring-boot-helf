package kr.co.helf.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("trainer-review")
@Slf4j
public class TrainerReviewController {

    @GetMapping("/list")
    public String review(){
        return "/trainer-review/list";
    }
    @GetMapping("/registration")
    public String reviewForm(){
        return "/trainer-review/form";
    }

}
