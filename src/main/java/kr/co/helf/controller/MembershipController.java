package kr.co.helf.controller;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.helf.service.MembershipService;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/membership")
@Slf4j
public class MembershipController {

	private final MembershipService membershipService;
	
	@GetMapping("/list")
	//@PreAuthorize("hasRole('ROLE_USER')")
	public String membershipList(@AuthenticationPrincipal User user, Model model) {
		List<MyMembership> myMemberships = membershipService.getMyMembershipById(user.getId());
		model.addAttribute("myMemberships", myMemberships);
		
		return "membership/list";
	}
}
