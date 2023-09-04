package kr.co.helf.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.helf.form.AddInquiryForm;
import kr.co.helf.service.InquiryService;
import kr.co.helf.vo.Inquires;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/inquiry")
@RequiredArgsConstructor

public class InquiryController {

	@Autowired
	InquiryService inquiryService;
	
	
	// 1:1문의 전체 화면 
		@GetMapping(value="/inquiries")
		public String inquirylist(@RequestParam(name="page", required=false, defaultValue="1") int page, 
								  @RequestParam(name="type", required=false) String type,
								  @RequestParam(name="keyword", required=false) String keyword,
								  Model model) {
			Map<String, Object> param = new HashMap<>();
			param.put("page",page);
			
			if(StringUtils.hasText(type) && StringUtils.hasText(keyword)) {
				param.put("type", type);
				param.put("keyword", keyword);
			}
			
			Map<String, Object> result = inquiryService.getAllInquiry(param);
			
			model.addAttribute("result", result);
			
			return "inquiry/inquiries";
		}
			
	// 1:1문의 유저 문의하기 폼
		@GetMapping(value="/inquiryUserForm")
		@PreAuthorize("hasRole('ROLE_USER')")
		public String inquiryUserform() {
			
			return "inquiry/inquiryUserForm";
		}
		
	// 1:1문의 등록
		@PostMapping(value="/inquiryRegister")
		public String inquiryRegister(@AuthenticationPrincipal User user, AddInquiryForm form) throws IOException {
		
			inquiryService.addInquiry(user,form);
			
			return "redirect:/inquiry/inquiries";
		}

	// 1:1문의 상세보기 화면
		@GetMapping(value="/inquiryDetail")
		public String detail(@RequestParam("no") int no, Model model) {
			Inquires inquiry = inquiryService.getinquiryByNo(no);
			
			model.addAttribute("inquiry", inquiry);
			
			return "inquiry/detail";
		}
		
		
}
