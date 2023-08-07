package kr.co.helf.controller;

import java.util.List;

import kr.co.helf.SpringBootHelfApplication;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.helf.form.AddOrderForm;
import kr.co.helf.service.MembershipService;
import kr.co.helf.vo.Membership;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/membership")
@RequiredArgsConstructor
public class MembershipController {
	
	private final MembershipService memberService;

	@GetMapping("/list")
	public String list(Model model) {
		List<Membership> memberships = memberService.getAllMembership();
		model.addAttribute("memberships", memberships);
		
		return "membership/list";
	}
	
	@GetMapping("/order")
//	@PreAuthorize("hasRole('USER_ROLE')")
	public String order(@RequestParam("no") int no, Model model) {
		AddOrderForm add = new AddOrderForm();
		add.setNo(no);
		model.addAttribute("add", add);
		
		return "membership/order";

	}
}
