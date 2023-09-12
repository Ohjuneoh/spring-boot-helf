package kr.co.helf.controller;

import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.helf.dto.MonthlyTotalSalaryDto;
import kr.co.helf.exception.SalaryException;

import kr.co.helf.service.SalaryService;
import kr.co.helf.service.UserService;
import kr.co.helf.vo.MonthlyGclPayRecords;
import kr.co.helf.vo.MonthlyPclPayRecords;
import kr.co.helf.vo.MySalary;
import kr.co.helf.vo.SalaryRecords;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/salary")
@Slf4j
public class SalaryController {

	@Autowired
	SalaryService salaryService;
	
	@Autowired
	UserService userService;
	
	// 급여 목록 페이지 화면 요청 
	@GetMapping(value="salary-list")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String salaryList(@RequestParam(name="page", required=false, defaultValue="1") int page,
			Model model) {
		
		log.info("page='{}'", page);
		
		Map<String, Object> param = new HashMap<>();
		param.put("page", page);
		
		// 급여 정보 리스트 
		Map<String, Object> result = salaryService.getAllTrainerSalary(param);
		// 지난달 급여 목록 - 그래프 
		List<SalaryRecords> graphData = salaryService.getPreviousMonthlyTrainerSalary();
		
		model.addAttribute("mySalary", result.get("mySalaryList"));
		model.addAttribute("pagination", result.get("pagination"));
		model.addAttribute("totalRows", result.get("totalRows"));
		model.addAttribute("graphData", graphData);
		return "salary/salaryList";
	}
	
	// 기본급 설정 정보 저장 
	@PostMapping(value="salary-info-save")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	public String insertSalary(@RequestParam("userId") String userId,
			@RequestParam("trainerNo") int trainerNo,
			@RequestParam("regularPay") int regularPay,
			@RequestParam("taxRate") double taxRate,
			@RequestParam("gclCommissionPct") int gclCommissionPct,
			@RequestParam("pclCommissionPct") int pclCommissionPct,
			@RequestParam("gclLessonFee") int gclLessonFee){
		log.info("regularPay='{}', taxRate='{}', gclCommissionPct='{}', pclCommissionPct='{}'", regularPay, taxRate, gclCommissionPct, pclCommissionPct, gclLessonFee);
		
		double taxRate1 = taxRate/100;
		double gclCommissionPct1 = (double) gclCommissionPct/100;
		double pclCommissionPct1 = (double) pclCommissionPct/100;
		
		Map<String, Object> param = new HashMap<>();
		param.put("userId", userId);
		param.put("trainerNo", trainerNo);
		param.put("regularPay", regularPay);
		param.put("taxRate", taxRate1);
		param.put("pclCommissionPct", pclCommissionPct1);
		param.put("gclCommissionPct", gclCommissionPct1);
		param.put("gclLessonFee", gclLessonFee);
		
		salaryService.saveOrUpdateSalaryInfoById(param);
		
		return "redirect:/salary/salary-list";
	}
	
	// Tap1 급여 정산 내역 목록 화면 요청 컨트롤러 
	@GetMapping(value="salary-detail")
	@PreAuthorize("hasRole('ROLE_MANAGER') || hasRole('ROLE_TRAINER')")
	public String trainerSalaryDetail(@RequestParam("id") String userId,
			@RequestParam(name="page", required=false, defaultValue="1") int page,
			Model model) {
		Map<String, Object> param = new HashMap<>();
		param.put("userId", userId);
		param.put("page", page);
		
		// 트레이너 개인 정보 
		MySalary trainerInfo = userService.getTrainerDetailById(userId);
		// 트레이너 월별 급여 정보 
		Map<String, Object> result = salaryService.getTrainerSalaryRecords(param);
		
		model.addAttribute("trainerInfo", trainerInfo);
		model.addAttribute("salaryRecords", result.get("salaryRecords"));
		model.addAttribute("pagination", result.get("pagination"));
		model.addAttribute("totalRows", result.get("totalRows"));
		return "salary/salaryDetail";
	}
	
	// Tap2 실시간 급여 정산 명세서 컨트롤러
	@GetMapping(value="tab2Content")
	@PreAuthorize("hasRole('ROLE_MANAGER') || hasRole('ROLE_TRAINER')")
	public String tab2Content(@RequestParam("id") String userId,
			@RequestParam(name="page", required=false, defaultValue="1" ) int page,
			@RequestParam(name ="startDate", required = false) String startDate,
			Model model) {

		Map<String, Object> param = new HashMap<>();
		param.put("userId", userId);
		LocalDate parsedStartDate = YearMonth.now().atDay(1);
		param.put("startDate", parsedStartDate);

		// 트레이너 개인 정보 
		MySalary trainerInfo = userService.getTrainerDetailById(userId);
			
		// 실시간 급여 지급 내역 조회 
		Optional<MonthlyTotalSalaryDto> salaryInfo = salaryService.getTotalMonthlySalary(param);
		
		// model에 담아서 전달
		model.addAttribute("trainerInfo", trainerInfo);
		if(salaryInfo.isPresent()) {
			model.addAttribute("salaryInfo", salaryInfo.get());
		} else {
			model.addAttribute("salaryInfo", new MonthlyTotalSalaryDto());
		}
		return "salary/salaryTap2Detail";
	}
	
	// Tap2 이번 달 급여 지급 내역 정산하기 
	@PostMapping(value="save-monthly-salary")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	@ResponseBody
	public ResponseEntity<String> saveMonthlySalaryData(
			@RequestParam("userId") String userId,
			@RequestParam("startDate") String startDate,
            @RequestParam("pclNo") int pclNo,
            @RequestParam("gclNo") int gclNo,
            @RequestParam("totalPayment") int totalPayment,
            @RequestParam("totalLessonFee") int totalLessonFee,
            @RequestParam("totalTax") int totalTax) {
	try {
		// String to Date 
		LocalDate parsedStartDate = LocalDate.parse(startDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
		Map<String, Object> param = new HashMap<>();
		param.put("userId", userId);
		param.put("startDate", parsedStartDate); // monthly_pcl_month가 될 것이다. 
		param.put("pclNo", pclNo);
		param.put("gclNo", gclNo);
		param.put("totalPayment", totalPayment);
		param.put("totalLessonFee", totalLessonFee);
		param.put("totalTax", totalTax);
		
		salaryService.saveMonthlySalaryData(param);
		
		return ResponseEntity.ok("이번 달 급여 정산이 확정되었습니다!");
	} catch(SalaryException e) {
		return ResponseEntity.badRequest().body(e.getMessage());
	}
	}
	
	
	// Tap3 개인레슨 화면 요청 컨트롤러 
	@GetMapping(value="tab3Content")
	@PreAuthorize("hasRole('ROLE_MANAGER') || hasRole('ROLE_TRAINER')")
	public String tab3Content(@RequestParam("id") String userId,
			@RequestParam(name="page", required=false, defaultValue="1" ) int page,
			@RequestParam(name ="startDate", required = false) String startDate,
			@RequestParam(name ="endDate", required = false) String endDate,
			Model model){
		
		Map<String, Object> param = new HashMap<>();
		param.put("userId", userId);
		param.put("page", page);
		
		if (StringUtils.hasText(startDate) && StringUtils.hasText(endDate)) {
			// String to Date 
			LocalDate parsedStartDate = LocalDate.parse(startDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			LocalDate parsedEndDate = LocalDate.parse(endDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			param.put("startDate", parsedStartDate);
			param.put("endDate", parsedEndDate);
			
		} else {
			LocalDate parsedStartDate = YearMonth.now().atDay(1);
			LocalDate parsedEndDate   = YearMonth.now().atEndOfMonth();
			param.put("startDate", parsedStartDate);
			param.put("endDate", parsedEndDate);
		}

		// 트레이너 개인 정보 
		MySalary trainerInfo = userService.getTrainerDetailById(userId);
		// 개인 레슨 수당 조회 
		Map<String, Object> result = salaryService.getPersonalLessonsById(param);
		// 그래프 관련 정보 담기
		List<MonthlyPclPayRecords> graphData = salaryService.getPclMonthlyPayById(userId);
		// model 담기 
		model.addAttribute("trainerInfo", trainerInfo);
		model.addAttribute("monthlyPclList", result.get("monthlyPclList"));
		model.addAttribute("pagination", result.get("pagination"));
		model.addAttribute("totalRows", result.get("totalRows"));
		model.addAttribute("graphData", graphData);
		return "salary/salaryTap3Detail";
	}
	
	// Tap3 트레이너 개인레슨 정산내역 저장 
	@PostMapping(value="saveData")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	@ResponseBody
	public ResponseEntity<String> savePclData(
			@RequestParam("userId") String userId,
            @RequestParam("totalLessonPrice") int totalLessonPrice,
            @RequestParam("totalRows") int totalRows,
            @RequestParam("startDate") String startDate){
	try {	
		// String to Date 
		LocalDate parsedStartDate = LocalDate.parse(startDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
		Map<String, Object> param = new HashMap<>();
		param.put("userId", userId);
		param.put("totalLessonPrice", totalLessonPrice);
		param.put("lessonCnt", totalRows);
		param.put("startDate", parsedStartDate); // monthly_pcl_month가 될 것이다. 
		
		salaryService.savePclData(param);
		
		return ResponseEntity.ok("저장완료!");
	} catch(SalaryException e) {
		return ResponseEntity.badRequest().body(e.getMessage());
	}
	}
	
	
	// Tap4 그룹레슨 정산 페이지 요청 컨트롤러 
	@GetMapping(value="tab4Content")
	@PreAuthorize("hasRole('ROLE_MANAGER') || hasRole('ROLE_TRAINER')")
	public String tab4Content(@RequestParam("id") String userId,
			@RequestParam(name="page", required=false, defaultValue="1" ) int page,
			@RequestParam(name = "startDate", required = false) String startDate,
			@RequestParam(name = "endDate", required = false) String endDate,
			Model model){
		Map<String, Object> param = new HashMap<>();
		param.put("userId", userId);
		param.put("page", page);
		
		if (StringUtils.hasText(startDate) && StringUtils.hasText(endDate)) {
			// String to Date 
			LocalDate parsedStartDate = LocalDate.parse(startDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			LocalDate parsedEndDate = LocalDate.parse(endDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			param.put("startDate", parsedStartDate);
			param.put("endDate", parsedEndDate);
			
		} else {
			// 이번 달 시작일과 마지막일 구하기 
			LocalDate parsedStartDate = YearMonth.now().atDay(1);
			LocalDate parsedEndDate   = YearMonth.now().atEndOfMonth();
			param.put("startDate", parsedStartDate);
			param.put("endDate", parsedEndDate);
		}

		// 트레이너 개인 정보 
		MySalary trainerInfo = userService.getTrainerDetailById(userId);
		// 그룹 레슨 수당 조회 
		Map<String, Object> result = salaryService.getGroupLessonsById(param);
		// 그래프 관련 정보 담기
		List<MonthlyGclPayRecords> graphData = salaryService.getGclMonthlyPayById(userId);
		// model에 담기 
		model.addAttribute("trainerInfo", trainerInfo);
		model.addAttribute("monthlyGclList", result.get("monthlyGclList"));
		model.addAttribute("pagination", result.get("pagination"));
		model.addAttribute("totalRows", result.get("totalRows"));
		model.addAttribute("graphData", graphData);
		return "salary/salaryTap4Detail";
	}
	
	// Tap4 트레이너 그룹레슨 정산내역 저장 
	@PostMapping(value="saveGclData")
	@PreAuthorize("hasRole('ROLE_MANAGER')")
	@ResponseBody
	public ResponseEntity<String> saveGclData(
			@RequestParam("userId") String userId,
            @RequestParam("totalLessonPrice") int totalLessonPrice,
            @RequestParam("totalRows") int totalRows,
            @RequestParam("startDate") String startDate){
	try {
		// String to Date 
		LocalDate parsedStartDate = LocalDate.parse(startDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
		Map<String, Object> param = new HashMap<>();
		param.put("userId", userId);
		param.put("totalLessonPrice", totalLessonPrice);
		param.put("lessonCnt", totalRows);
		param.put("startDate", parsedStartDate); // monthly_gcl_month가 될 것이다. 
		
		salaryService.saveGclData(param);
		
		return ResponseEntity.ok("저장 완료!");
	} catch(SalaryException e) {
		return ResponseEntity.badRequest().body(e.getMessage());
	}
}
	
	
	
	
}
