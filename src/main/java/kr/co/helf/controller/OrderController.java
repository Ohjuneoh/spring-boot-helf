package kr.co.helf.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.helf.form.AddOrderForm;
import kr.co.helf.service.OrderService;
import kr.co.helf.vo.Membership;
import kr.co.helf.vo.MembershipJoinCategory;
import kr.co.helf.vo.Option;
import kr.co.helf.vo.OptionJoinDetaile;
import kr.co.helf.vo.Period;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/membership")
@RequiredArgsConstructor
@SessionAttributes({"addOrderForm"})
public class OrderController {
	
	private final OrderService orderService;

	@GetMapping("/list")
	public String list(Model model) {
		List<Membership> memberships = orderService.getAllMembership();
		model.addAttribute("memberships", memberships);
		
		return "membership/list";
	}
	
	@GetMapping("/condition")
//	@PreAuthorize("hasRole('ROLE_USER')")
	public String condition(@RequestParam("no") int no, @AuthenticationPrincipal User user, Model model) {
		
		Optional<MembershipJoinCategory> optionalMembershipJoinCat =  orderService.getMembershipByNo(no);
		MembershipJoinCategory membershipJoinCat = optionalMembershipJoinCat.orElseThrow(
														() -> new RuntimeException("번호에 해당하는 이용권이 없다.")
													);
		
		model.addAttribute("membershipJoinCat", membershipJoinCat);
		AddOrderForm form = new AddOrderForm();
		form.setNo(no);
		form.setMembershipName(membershipJoinCat.getName());
		form.setMembershipPrice(membershipJoinCat.getPrice());
		model.addAttribute("addOrderForm", form);
		
		return "membership/orderStep1";
	}
	
	@GetMapping("/period")
//	@PreAuthorize("hasRole('ROLE_USER')")
	public String period(@ModelAttribute("addOrderForm") AddOrderForm form, Model model,
						 @AuthenticationPrincipal User user) {
		Optional<MembershipJoinCategory> optionalMembershipJoinCat =  orderService.getMembershipByNo(form.getNo());
		MembershipJoinCategory membershipJoinCat = optionalMembershipJoinCat.orElseThrow(
														() -> new RuntimeException("번호에 해당하는 이용권이 없다.")
													);

		if(membershipJoinCat.getCatName().equals("하루운동")) {
			model.addAttribute("membershipJoinCat", membershipJoinCat);
			Period oneDayPeriod = orderService.getPeriodsByOne(membershipJoinCat.getCatProperty());
			form.setPeriodNo(oneDayPeriod.getNo());
			form.setPeriodDuration(oneDayPeriod.getDuration());
			form.setPeriodTime(oneDayPeriod.getProperty());
			
			form.surtax(form.getFirstOptionPrice(), form.getSecondOptionPrice());
			form.membershipAndOptionPrice(form.getMembershipPrice(), form.getFirstOptionPrice(), form.getSecondOptionPrice());
			form.totalPrice(form.getMembershipAndOptionPrice(), form.getSurtax());
			
			model.addAttribute("user", user);
			model.addAttribute("form", form);
			
			return "membership/orderStep4";
		}
		
		List<Period> periods = orderService.getAllPeriodByType(membershipJoinCat.getCatProperty());
		model.addAttribute("periods", periods);
		
		return "membership/orderStep2";
	}
	
	@PostMapping("/option")
//	@PreAuthorize("hasRole('ROLE_USER')")
	public String option(@ModelAttribute("addOrderForm") AddOrderForm form, @RequestParam("period") int periodNo, 
						 Model model) {
		
		form.setPeriodNo(periodNo);
		Optional<Period> optionalPeriod = orderService.getPeriodByNo(periodNo);
		Period period = optionalPeriod.orElseThrow(() -> new RuntimeException("없다."));
		form.setMembershipPrice(form.getMembershipPrice() + period.getAddPrice());
		form.setPeriodDuration(period.getDuration());
		
		if(period.getType().equals("횟수")) {
			form.setPeriodTime(period.getProperty());
		}
		
		List<Option> options = orderService.getOptions();
		model.addAttribute("options", options);
		
		List<OptionJoinDetaile> optionDetailes = orderService.getAllOptionDetaile();
		model.addAttribute("optionDetailes", optionDetailes);
		
		return "membership/orderStep3";
	}
	
	@PostMapping("/order")
//	@PreAuthorize("hasRole('ROLE_USER')")
	public String order(@ModelAttribute("addOrderForm") AddOrderForm form, Model model,
						@AuthenticationPrincipal User user,
						@RequestParam("lockerNo") int lockerNo, @RequestParam("wearNo") int wearNo) {

		Optional<OptionJoinDetaile> optionalLocker = orderService.getOptionDetaileByNo(lockerNo);
		OptionJoinDetaile lockerDetaile = optionalLocker.orElseThrow(() -> new RuntimeException("없다."));
		if(lockerDetaile.getPeriod() != 0) {
			form.setFirstOptionDetaileNo(lockerNo);
			form.setFirstOptionPeriod(lockerDetaile.getPeriod());
			form.setFirstOptionDetaileName(lockerDetaile.getName());
			form.setFirstOptionPrice(lockerDetaile.getPrice());
		}

		Optional<OptionJoinDetaile> optionalWear = orderService.getOptionDetaileByNo(wearNo);
		OptionJoinDetaile wearDetaile = optionalWear.orElseThrow(() -> new RuntimeException("없다."));
		if(wearDetaile.getPeriod() != 0) {
			form.setSecondOptionDetaileNo(wearNo);
			form.setSecondOptionPeriod(wearDetaile.getPeriod());
			form.setSecondOptionDetaileName(wearDetaile.getName());
			form.setSecondOptionPrice(wearDetaile.getPrice());
		}
		
		form.surtax(lockerDetaile.getPrice(), wearDetaile.getPrice());
		form.membershipAndOptionPrice(form.getMembershipPrice(), form.getFirstOptionPrice(), form.getSecondOptionPrice());
		form.totalPrice(form.getMembershipAndOptionPrice(), form.getSurtax());
		model.addAttribute("form", form);
		model.addAttribute("user", user);
		
		return "membership/orderStep4";
	}
}
