package kr.co.helf.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {

	// 공지사항화면 요청처리
	@GetMapping(value="/notice")
	public String noticeform() {
		return "board/notice";
	}
	
	// faq화면 요청처리
	@GetMapping(value="/faq")
	public String faqform() {
		return "board/faq";
	}

	// 1:1문의 화면 요청처리
	@GetMapping(value="/inquiries")
	public String inquiriesform() {
		return "board/inquiries";
	}
	
}
