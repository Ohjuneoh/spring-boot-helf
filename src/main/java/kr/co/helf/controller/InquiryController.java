package kr.co.helf.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.helf.form.AddInquiryForm;
import kr.co.helf.service.InquiryService;
import kr.co.helf.vo.Answer;
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

		
	// 1:1문의 수정
		@PostMapping(value="/inquiryUpdate")
		public String updateInquiry(@AuthenticationPrincipal User user, AddInquiryForm form) throws IOException {
		
			inquiryService.updateInquiry(user,form);
			
			return "redirect:/inquiry/inquiries";
		}
		
		
	// 1:1문의 상세보기 화면
		@GetMapping(value="/inquiryDetail")
		public String detail(@RequestParam("no") int no, @AuthenticationPrincipal User user, Model model) {
			Inquires inquiry = inquiryService.getinquiryByNo(no);
			model.addAttribute("inquiry", inquiry);
			
			if("N".equals(inquiry.getSecret())) {
				return "inquiry/detail";
			}
			
			
			if(user == null) {
				model.addAttribute("error", true);
				return "inquiry/detail";
			}
			
			
			if(!user.getType().equals("ROLE_MANAGER")) {
				if (!inquiry.getUser().getId().equals(user.getId())) {
					model.addAttribute("error", true);
					return "inquiry/detail";
				}	
			}
			
			List<Answer> answers = inquiryService.answerList(no);
			model.addAttribute("answers", answers);
			
			
			return "inquiry/detail";
		}
		
	// 1:1 문의 답변
		@PostMapping("/addReply")
		@ResponseBody
		public List<Answer> addReply(@AuthenticationPrincipal User user, 
				@RequestParam("no") int inquiryNo,
				@RequestParam("content") String content) {
			
			// answer 저장 로직
			inquiryService.addAnswer(user, inquiryNo, content);
			
			// 답변목록 조회
			List<Answer> answerList = inquiryService.answerList(inquiryNo);
			
			return answerList;
		}
		
	
	// 문의 답변 삭제 
		@GetMapping("/deleteAnswer")
		public String deleteAnswer(@RequestParam("inquiryNo") int inquiryNo,
								   @RequestParam("answerNo") int answerNo) {
			
			inquiryService.deleteAnswer(inquiryNo, answerNo);
			
			return "redirect:/inquiry/inquiries";
		}
		

		
}
