package kr.co.helf.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.helf.dto.CustomerDetailDto;
import kr.co.helf.dto.CustomerListDto;
import kr.co.helf.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/management")
@Slf4j
public class ManagementController {

	@Autowired
	UserService userService;
	
	
	// 전체 고객 목록 화면 요청과 매핑되는 요청핸들러 메소드 
	@GetMapping(value="customer-list")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String customerList(@RequestParam(name="rows", required=false, defaultValue="20") int rows,
			@RequestParam(name="page", required=false, defaultValue = "1") int page,
			@RequestParam(name="opt", required=false, defaultValue= "") String opt, 
			@RequestParam(name="keyword", required=false, defaultValue="") String keyword,
			@RequestParam(name="userStatus", required=false, defaultValue="") String userStatus,
			@RequestParam(name="membershipState", required=false, defaultValue="") String membershipState,
			@RequestParam(name="remainderCnt", required=false) Integer remainderCnt,
			@RequestParam(name="remainingDays1", required=false, defaultValue="") @DateTimeFormat(pattern ="yyyy-MM-dd") Date remainingDays1,
			@RequestParam(name="remainingDays2", required=false, defaultValue="") @DateTimeFormat(pattern ="yyyy-MM-dd") Date remainingDays2,
			Model model) {
		log.info("rows='{}', page='{}', opt='{}' keyword='{}' userStatus='{}' membershipState='{}' remainderCnt='{}' remainingDays1='{}' remainingDays2='{}' ", 
				rows, page, opt, keyword, userStatus, membershipState, remainderCnt, remainingDays1, remainingDays2);
		 	
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("rows", rows);
		param.put("page", page);
		param.put("remainderCnt", remainderCnt);
		param.put("userStatus", userStatus);
		param.put("membershipState", membershipState);
		if(StringUtils.hasText(opt) && StringUtils.hasText(keyword)) {
			param.put("opt", opt);
			param.put("keyword", keyword);
		}
		if(remainingDays1 != null && remainingDays2 != null) {
			param.put("remainingDays1", remainingDays1);
			param.put("remainingDays2", remainingDays2);
		}
		
		Map<String, Object> result = userService.getAllCustomerInfo(param);
		
		model.addAttribute("customers", result.get("customerList"));
		model.addAttribute("pagination", result.get("paginatioin"));
		model.addAttribute("totalRows", result.get("totalRows"));
		
		return "management/customerList";
	}
	
	// 고객 상세 페이지 요청과 매핑되는 요청핸들러 메소드
	@GetMapping(value="customer-detail")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String customerDetail(@RequestParam("id") String userId, Model model) {
		CustomerDetailDto detailDto = userService.getCustomerDetails(userId);
		model.addAttribute("detailDto", detailDto);
		
		return "management/customerDetail";
	}
	
	// 트레이너 목록 페이지 요청과 매핑되는 요청핸들러 메소드
	@GetMapping(value="trainer-list")
//	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String trainerList(Model model) {
		return "management/trainerList";
	}
	
}
