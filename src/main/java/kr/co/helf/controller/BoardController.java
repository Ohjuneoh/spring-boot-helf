package kr.co.helf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.helf.form.AddBoardForm;
import kr.co.helf.service.BoardService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {

	@Autowired
	BoardService boardService;
	
	
	// 공지사항 화면 요청처리
	@GetMapping(value="/notice")
	public String notice() {
		return "board/notice";
	}
	
	// 공지사항 등록폼 화면 요청처리
	@GetMapping(value="/noticeform")
	public String noticeform() {
		return "board/noticeform";
	}
	
	// 공지사항 등록 요청처리
	@PostMapping(value="/addNotice")
	public String addNotice(AddBoardForm form) {

		boardService.addNotice(form);
		
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
