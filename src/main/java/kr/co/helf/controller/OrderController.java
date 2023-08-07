package kr.co.helf.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.helf.form.AddOrderForm;
import kr.co.helf.service.OrderService;
import kr.co.helf.vo.Category;
import kr.co.helf.vo.Membership;
import kr.co.helf.vo.Period;
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
//	@PreAuthorize("hasRole('USER_ROLE')")
	public String condition(@RequestParam("no") int no, Model model) {
		Optional<Membership> optionalMembership =  orderService.getMembershipByNo(no);
		Membership membership = optionalMembership.orElseThrow(() -> new RuntimeException("번호에 해당하는 이용권이 없다."));

		Optional<Category> optionalCategory =  orderService.getCategortyByNo(membership.getCategory().getNo());
		Category category = optionalCategory.orElseThrow(() -> new RuntimeException("없다."));
		model.addAttribute("category", category);
		
		AddOrderForm orderForm = new AddOrderForm();
		orderForm.setNo(no);
		model.addAttribute("addOrderForm", orderForm);
		
		return "membership/orderStep1";
	}
	
	@GetMapping("/period")
//	@PreAuthorize("hasRole('USER_ROLE')")
	public String period(@ModelAttribute("addOrderForm") AddOrderForm orderForm, Model model) {
		Optional<Membership> optionalMembership =  orderService.getMembershipByNo(orderForm.getNo());
		Membership membership = optionalMembership.orElseThrow(() -> new RuntimeException("번호에 해당하는 이용권이 없다."));

		Optional<Category> optionalCategory =  orderService.getCategortyByNo(membership.getCategory().getNo());
		Category category = optionalCategory.orElseThrow(() -> new RuntimeException("없다."));
		
		model.addAttribute("addOrderForm", orderForm);
		if(category.getName().equals("하루운동")) {
			model.addAttribute("category", category);
			return "membership/orderStep4";
		}
		
		Optional<Period> optional = orderService.getPeriodByNo(orderForm.getNo());
		Period period = optional.orElseThrow(() -> new RuntimeException("번호에 해당하는 기간이 없다."));
		
		List<Period> periods = orderService.getAllPeriodByType(period.getType());

		model.addAttribute("periods", periods);
		return "membership/orderStep2";
	}
}
