package kr.co.helf.controller;

import java.util.List;

import static kr.co.helf.controller.OrderEnum.*;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.helf.form.AddOrderForm;
import kr.co.helf.kakaopay.KakaoApproveResponse;
import kr.co.helf.kakaopay.KakaoPayReadyResponse;
import kr.co.helf.kakaopay.KakaoPayService;
import kr.co.helf.service.OrderService;
import kr.co.helf.vo.Membership;
import kr.co.helf.vo.MembershipJoinCategory;
import kr.co.helf.vo.Option;
import kr.co.helf.vo.OptionJoinDetail;
import kr.co.helf.vo.Period;
import kr.co.helf.vo.Rank;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/membership")
@RequiredArgsConstructor
@SessionAttributes({"addOrderForm", "tid"})
@Slf4j
public class OrderController {
	
	private final OrderService orderService;
	private final KakaoPayService kakaoPayService;

	@GetMapping("/list")
	public String list(Model model) {
		List<Membership> memberships = orderService.getAllMembership();
		model.addAttribute("memberships", memberships);
		
		return "membership/list";
	}
	
	@GetMapping("/condition")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String condition(@RequestParam("no") int no, @AuthenticationPrincipal User user, Model model) {

		orderService.checkUseMyMembership(no, user.getId());
		
		MembershipJoinCategory membershipJoinCat = orderService.getMembershipJoinCatByNo(no);
		model.addAttribute("membershipJoinCat", membershipJoinCat);
		
		AddOrderForm form = new AddOrderForm();
		form.setMembershipNo(no);
		form.setMembershipName(membershipJoinCat.getName());
		form.setMembershipDefaltPrice(membershipJoinCat.getPrice());

		model.addAttribute("addOrderForm", form);
		
		return "membership/orderStep1";
	}
	
	@GetMapping("/period")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String period(@ModelAttribute("addOrderForm") AddOrderForm form, Model model,
						 @AuthenticationPrincipal User user) {
		
		MembershipJoinCategory membershipJoinCat = orderService.getMembershipJoinCatByNo(form.getMembershipNo());

		if(membershipJoinCat.getCatName().equals(ONE_DAY.getOrderEnum())) {
			orderService.setOneDay(membershipJoinCat, form, user);
			
			model.addAttribute("membershipJoinCat", membershipJoinCat);
			model.addAttribute("user", user);
			model.addAttribute("form", form);
			
			return "membership/orderStep3";
		}
		
		List<Option> options = orderService.getOptions();
		model.addAttribute("options", options);
		
		List<OptionJoinDetail> optionJoinDetails = orderService.getAllOptionJoinDetail();
		model.addAttribute("optionJoinDetails", optionJoinDetails);
		
		List<Period> periods = orderService.getAllPeriodByType(membershipJoinCat.getCatProperty());
		model.addAttribute("periods", periods);
		
		return "membership/orderStep2";
	}
	
	@PostMapping("/order-check")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String orderCheck(@ModelAttribute("addOrderForm") AddOrderForm form, Model model, 
							 @AuthenticationPrincipal User user) {
		
		Period period = orderService.getPeriodByNo(form.getPeriodNo());
		form.setMembershipPrice(form.getMembershipDefaltPrice() + period.getAddPrice());
		form.setPeriodDuration(period.getDuration());
		
		if(period.getType().equals(TIME.getOrderEnum())) {
			form.setRemainderCnt(period.getProperty());
		}

		OptionJoinDetail locker = orderService.getOptionJoinDetailByNo(form.getLockerNo());
		OptionJoinDetail wear = orderService.getOptionJoinDetailByNo(form.getWearNo());
		
		form.setLockerName(locker.getName());
		form.setLockerPeriod(locker.getPeriod());
		form.setLockerPrice(locker.getPrice());
		form.setWearName(wear.getName());
		form.setWearPeriod(wear.getPeriod());
		form.setWearPrice(wear.getPrice());
		
		form.surtax(locker.getPrice(), wear.getPrice());
		int membershipOptionPrice = form.membershipOptionPrice(form.getLockerPrice(), form.getWearPrice());
		form.totalPrice(form.getMembershipOptionPrice(), form.getSurtax());
		
		Rank rank = orderService.getRankByNo(user.getRank().getNo());
		System.out.println(membershipOptionPrice*rank.getPointRate());
		
		int savePoint = (int)(membershipOptionPrice*rank.getPointRate());
		form.setSavePoint(savePoint);
		
		model.addAttribute("form", form);
		model.addAttribute("user", user);
		
		log.info("이용권 -> {}", form);
		return "membership/orderStep3";
	}
	
	@PostMapping("/kakaopay-ready")
	@ResponseBody
	public KakaoPayReadyResponse kakaoReady(@ModelAttribute AddOrderForm form, Model model) {
		KakaoPayReadyResponse ready = kakaoPayService.kakaoPayReadyResponse(form);
		model.addAttribute("tid", ready.getTid());
		
		return ready;
	}
	
	@GetMapping("/order")
	public String order(@ModelAttribute("addOrderForm")  AddOrderForm form, @AuthenticationPrincipal User user, 
						@ModelAttribute("tid")  String tid, @RequestParam("pg_token") String pgToken) {
		
		kakaoPayService.approveResponse(tid, pgToken);
		orderService.updateUser(form, user);
		orderService.insertOrder(form, user);
		
		return "redirect:/membership/order-completed";
	}
	
	@GetMapping("/order-completed")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String orderCompleted() {
		return "membership/orderCompleted";
	}
	
	@GetMapping("/order-fail")
	public void orderFail() {
		throw new RuntimeException("결제가 실패했습니다.");
	}

	@GetMapping("/order-cancle")
	public void orderCancle() {
		throw new RuntimeException("결제가 최소되었습니다.");
	}
}
