package kr.co.helf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/Faq")
@RequiredArgsConstructor
public class FaqController {

	// 자주묻는 질문 화면
	@GetMapping(value="/faqList")
	public String inquirylist(Model model) {
		
//		Map<String, Object> result = faqService.getAllfaq();
		
//		model.addAttribute("result", result);
		
		return "board/faq";
	}
}
