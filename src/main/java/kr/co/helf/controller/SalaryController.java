package kr.co.helf.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.helf.service.SalaryService;
import kr.co.helf.service.UserService;
import kr.co.helf.vo.MySalary;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/salary")
@Slf4j
public class SalaryController {

	@Autowired
	SalaryService salaryService;
	
	@Autowired
	UserService userService;
	
	
	@GetMapping(value="salary-list")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String salaryList(@RequestParam(name="page", required=false, defaultValue="1") int page,
			Model model) {
		
		log.info("page='{}'", page);
		
		Map<String, Object> param = new HashMap<>();
		param.put("page", page);
		
		
		Map<String, Object> result = salaryService.getAllTrainerSalary(param);
		model.addAttribute("mySalary", result.get("mySalaryList"));
		model.addAttribute("pagination", result.get("pagination"));
		model.addAttribute("totalRows", result.get("totalRows"));
		
		return "salary/salaryList";
	}
	
	@PostMapping(value="salary-info-save")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String insertSalary(@RequestParam("userId") String userId,
			@RequestParam("trainerNo") int trainerNo,
			@RequestParam("regularPay") int regularPay,
			@RequestParam("taxRate") double taxRate,
			@RequestParam("gclCommissionPct") int gclCommissionPct,
			@RequestParam("pclCommissionPct") int pclCommissionPct){
		log.info("regularPay='{}', taxRate='{}', gclCommissionPct='{}', pclCommissionPct='{}'", regularPay, taxRate, gclCommissionPct, pclCommissionPct);
		
		double gclCommissionPct1 = (double) gclCommissionPct/100;
		double pclCommissionPct1 = (double) pclCommissionPct/100;
		
		Map<String, Object> param = new HashMap<>();
		param.put("userId", userId);
		param.put("trainerNo", trainerNo);
		param.put("regularPay", regularPay);
		param.put("taxRate", taxRate);
		param.put("pclCommissionPct", pclCommissionPct1);
		param.put("gclCommissionPct", gclCommissionPct1);
		
		salaryService.saveOrUpdateSalaryInfoById(param);
		
		return "redirect:/salary/salary-list";
		
	}
	
	@GetMapping(value="salary-detail")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String trainerSalaryDetail(@RequestParam("id") String userId,
			Model model) {
		
		// 트레이너 개인 정보 
		MySalary trainerInfo = userService.getTrainerDetailById(userId);
		
		model.addAttribute("trainerInfo", trainerInfo);
		
		return "salary/salaryDetail";
	}
}
