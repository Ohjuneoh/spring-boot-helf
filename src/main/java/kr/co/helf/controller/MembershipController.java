package kr.co.helf.controller;

import java.util.List;

import static kr.co.helf.controller.OrderEnum.*;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.helf.dto.MyMembershipListDto;
import kr.co.helf.service.MembershipService;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.Order;
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
	@PreAuthorize("hasRole('ROLE_USER')")
	public String membershipList(@AuthenticationPrincipal User user, Model model) {
		
		List<MyMembershipListDto> myMemberships = membershipService.getMyMembershipById(user.getId());
		
		model.addAttribute("list", myMemberships);
		
		return "membership/list";
	}
	
	@GetMapping("/refound")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String refound(@RequestParam("no") int no, @AuthenticationPrincipal User user) {
		Order order = membershipService.getOrderByMyMembershipNo(no);
		
		if(!user.getId().equals(order.getUser().getId())) {
			return "redirect: list?error=no-authority";
		}
		
		order.setState(WAITREFOUND.getOrderEnum());
		membershipService.updateOrder(order);
		
		MyMembership myMembership = membershipService.getMyMembershipByNo(no);
		myMembership.setState(IMPOSSIBILITY.getOrderEnum());
		membershipService.updateMyMembership(myMembership);
		
		return "redirect:list";
	}
}
