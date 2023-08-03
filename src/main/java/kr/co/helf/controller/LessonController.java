package kr.co.helf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/lesson")
@RequiredArgsConstructor
@Slf4j
public class LessonController {
	
	@GetMapping(value="reservation")
	public String loginForm() {
		return "lesson/lessonreservation";
	}
	
	

}
