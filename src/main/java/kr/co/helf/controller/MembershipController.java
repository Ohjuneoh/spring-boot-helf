package kr.co.helf.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.helf.dto.MembershipJoinCategory;
import kr.co.helf.dto.MembershipListDto;
import kr.co.helf.dto.MyMembershipJoinDto;
import kr.co.helf.dto.OrderDetailDto;
import kr.co.helf.dto.OrderJoin;
import kr.co.helf.dto.OrderListDto;
import kr.co.helf.exception.MembershipException;
import kr.co.helf.form.AddMembershipForm;
import kr.co.helf.form.ModifyMembershipForm;
import kr.co.helf.form.SearchForm;
import kr.co.helf.service.MembershipService;
import kr.co.helf.service.OrderService;
import kr.co.helf.vo.Category;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/membership")
public class MembershipController {

	private final MembershipService membershipService;
	private final OrderService orderService;
	
	@GetMapping("/list")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String membershipList(@AuthenticationPrincipal User user, Model model) {
		
		List<MyMembershipJoinDto> myMemberships = membershipService.getMyMembershipListById(user.getId());
		model.addAttribute("list", myMemberships);
		
		return "membership/list";
	}
	
	@PostMapping("/wait-refund")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String waitRefund(@RequestParam("no") int no, @AuthenticationPrincipal User user) {
		
		try {
			membershipService.updateWaitRefund(no, user.getId());
		} catch (MembershipException e) {
			return "redirect:list?error=no-refund";
		}
		
		return "redirect:list";
	}
	
	@GetMapping("/order-list")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String orderList(@AuthenticationPrincipal User user, Model model,
							@ModelAttribute SearchForm form) {
		
		if(form.getPage() == null) {
			form.setPage(1);
		}
		
		Map<String, Object> map = new HashMap<>();
		if (StringUtils.hasText(form.getState())) {
			map.put("state", form.getState());
		}
		if (StringUtils.hasText(form.getType())) {
			map.put("type", form.getType());
		}
		if (StringUtils.hasText(form.getKeyword())) {
			map.put("keyword", form.getKeyword());
		}
		map.put("userId", user.getId());
		
		OrderListDto orderList = membershipService.getOrdersById(form.getPage(), map);
		
		model.addAttribute("dto", orderList);
		
		return "membership/orderList";
	}
	
	@GetMapping("/order-detail")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String orderDetail(@RequestParam("no") int no, Model model, @AuthenticationPrincipal User user) {
		
		OrderDetailDto dto = membershipService.getOrderDetailByNo(no);
		if(!dto.getOrderJoin().isUserId(user.getId())) {
			return "redirect:list?error=no-authority";
		}
		
		model.addAttribute("dto", dto);
		
		return "membership/orderDetail";
	}
	
	@PostMapping("/cancle-refund")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String cancleRefund(@RequestParam(name = "no", required = false) int no,
							   @RequestParam(name = "state", required = false) String state,
							   @RequestParam(name = "type", required = false) String type,
							   @RequestParam(name = "keyword", required = false) String keyword,
							   @RequestParam(name = "page", required = false, defaultValue = "1") int page,
							   RedirectAttributes attributes) {
		
		attributes.addAttribute("no", no);

		try {
			membershipService.cancleRefund(no);
		} catch (MembershipException e) {
			return "redirect:order-detail?error=dup";
		}
		
		attributes.addAttribute("state", state);
		attributes.addAttribute("type", type);
		attributes.addAttribute("keyword", keyword);
		attributes.addAttribute("page", page);
		
		return "redirect:order-detail";
	}
	
	@GetMapping("/create-form")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String createForm(Model model) {

		List<Category> categorys = membershipService.getAllCategory();
		model.addAttribute("categorys", categorys);
		
		return "membership/createForm";
	}
	
	@PostMapping("/create")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String create(@ModelAttribute AddMembershipForm form) {
		
		membershipService.addMembership(form);
		
		return "redirect:list-manager";
	}

	@GetMapping("/list-manager")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String listManager(Model model, @RequestParam(name = "state", required = false) String state,
										   @RequestParam(name = "type", required = false) String type,
										   @RequestParam(name = "keyword", required = false) String keyword,
										   @RequestParam(name = "page", required = false, defaultValue = "1") int page) {

		Map<String, Object> param = new HashMap<>();
		param.put("page", page);
		
		if(StringUtils.hasText(state)) {
			param.put("state", state);
		}

		if(StringUtils.hasText(type) && StringUtils.hasText(keyword)) {
			param.put("type", type);
			param.put("keyword", keyword);
		}
		
		MembershipListDto dto = membershipService.getAllMembership(param);
		model.addAttribute("dto", dto);
		
		return "membership/listManager";
	}
	
	@GetMapping("/detail-manager")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String detailManager(Model model, @RequestParam("no") int no) {
		
		MembershipJoinCategory membership = orderService.getMembershipJoinCatByNo(no);
		model.addAttribute("membership", membership);
		
		return "membership/detailManager";
	}
	
	@PostMapping("/deleted")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String deleted(Model model, @RequestParam("no") int no) {
		
		membershipService.deleteMembershipByNo(no);
		MembershipJoinCategory membership = orderService.getMembershipJoinCatByNo(no);
		model.addAttribute("membership", membership);
		
		return "membership/detailManager";
	}
	
	@GetMapping("/modify-form")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String modifyForm(Model model, @RequestParam("no") int no) {
		
		MembershipJoinCategory membership = membershipService.getMembershipByNo(no);
		List<Category> cats = membershipService.getAllCategory();
		
		model.addAttribute("membership", membership);
		model.addAttribute("categorys", cats);
		
		return "membership/modifyForm";
	}

	@PostMapping("/modify")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String modify(Model model, @ModelAttribute ModifyMembershipForm form,
									  @RequestParam(name = "state", required = false) String state,
									  @RequestParam(name = "type", required = false) String type,
									  @RequestParam(name = "keyword", required = false) String keyword,
									  @RequestParam(name = "page", required = false, defaultValue = "1") int page,
									  RedirectAttributes attributes) {
		
		membershipService.updateMembershipByNo(form);
		
		attributes.addAttribute("no", form.getNo());
		attributes.addAttribute("state", state);
		attributes.addAttribute("type", type);
		attributes.addAttribute("keyword", keyword);
		attributes.addAttribute("page", page);
		
		return "redirect:detail-manager";
	}
	
	@GetMapping("/refund-manager")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String refundManager(Model model, @RequestParam(name = "state", required = false) String state,
										     @RequestParam(name = "type", required = false) String type,
										     @RequestParam(name = "keyword", required = false) String keyword,
										     @RequestParam(name = "id", required = false) String id,
										     @RequestParam(name = "page", required = false, defaultValue = "1") int page) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("page", page);
		
		if(StringUtils.hasText(state)) {
			param.put("state", state);
		}
		
		if(StringUtils.hasText(id)) {
			param.put("id", id);
		}
		
		if(StringUtils.hasText(type)) {
			param.put("type", type);
			
			if(StringUtils.hasText(keyword)) {
				param.put("keyword", keyword);
			}
		}
		
		OrderListDto dto = membershipService.getAllRefund(param);
		model.addAttribute("dto", dto);
		
		return "membership/refundManager";
	}
	
	@GetMapping("/refund-detail")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String refundDetail(Model model, @RequestParam("no") int no) {
		
		OrderJoin orderJoin = membershipService.getRefundDetailByNo(no);
		model.addAttribute("orderJoin", orderJoin);
		
		return "membership/refundDetail";
	}
	
	@PostMapping("/refund")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String refund(@RequestParam(name = "no", required = false) List<Integer> noList,
						 @RequestParam(name = "state", required = false) String state,
					     @RequestParam(name = "type", required = false) String type,
					     @RequestParam(name = "keyword", required = false) String keyword,
					     @RequestParam(name = "id", required = false) String id,
					     @RequestParam(name = "page", required = false, defaultValue = "1") int page, 
					     RedirectAttributes redirectAttributes) {
		
		if(noList == null) {
			return "redirect:/membership/refund-manager?error=no-subject";
		}
		
		try {
			membershipService.refundApproved(noList);
		} catch (MembershipException e) {
			return "redirect:refund-manager?error=refunded";
		}
		
		redirectAttributes.addAttribute("state", state);
		redirectAttributes.addAttribute("type", type);
		redirectAttributes.addAttribute("keyword", keyword);
		redirectAttributes.addAttribute("page", page);
		
		return "redirect:refund-manager";
	}
}
