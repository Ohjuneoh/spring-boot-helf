package kr.co.helf.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.helf.dto.AttendanceList;
import kr.co.helf.service.PersonalLessonService;
import kr.co.helf.service.UserService;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.MyMembership;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/checkin")
@Slf4j
public class CheckInController {

	@Autowired
	UserService userService;
	
	@Autowired
	PersonalLessonService personalLessonService;
	
	// 입장 폼 요청 페이지 
	@GetMapping(value="check-in")
	public String checkInForm() {
		return "checkin/checkInform";
	}
	
	// 회원 휴대폰 뒷번호 네 자리 조회 요청과 매핑되는 요청핸들러 메소드 
	@GetMapping("/customer-verification")
	@ResponseBody
	public List<User> verifyNumbers(@RequestParam("fourDigits") String fourDigits) {
		List<User> userList = userService.getUsersWithFourDigits(fourDigits);
		return userList;
	}
	
	// 선택 폼 요청 페이지
	@GetMapping("/check-in-choice")
	public String checkInChoice() {
		return "checkin/checkInChoice";
	}
	

	// 회원 시설이용-정보 요청과 매핑되는 요청핸들러 메소드 
	@GetMapping("/welcome")
	@ResponseBody
	public Optional<MyMembership> getMyMembership(@RequestParam("userId") String userId){
		Optional<MyMembership> myMembership = userService.getMyMembershipDetail(userId);
		if(myMembership.isPresent()) {
			userService.createAttendance(userId);
		}
		return myMembership;  
	}
	
	// 회원 수업 출석 정보 요청과 매핑되는 요청핸들러 메소드 
	@GetMapping("/lesson")
	@ResponseBody
	public List<LessonApply> getMyLessons(@RequestParam("id") String id){
			List<LessonApply> myLessonLists = personalLessonService.getMyTodayLessons(id);
			return myLessonLists;
	}
	
	@PostMapping("/check-lesson-attendance")
	public String checkAttendance(@RequestParam("userId")String userId) {
		userService.createAttendance(userId);
		return "checkin/checkInChoice";
	}
	
	// 직원 출퇴근 화면 요청과 매핑되는 요청핸들러 메소
	@GetMapping("/attendance")
	@PreAuthorize("hasRole('ROLE_TRAINER')")
	public String attendance(@RequestParam(name="opt", required=false, defaultValue="") String opt,
			@RequestParam(name="page", required=false, defaultValue="1") int page,
			@RequestParam(name="keyword", required=false, defaultValue="") String keyword, 
			@AuthenticationPrincipal User user, 
			Model model) {
		log.info("opt='{}', page='{}', keyword='{}'", opt, page, keyword);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("page", page);
		param.put("userId", user.getId());
		if(StringUtils.hasText(opt) && StringUtils.hasText(keyword)) {
			param.put("opt", opt);
			param.put("keyword", keyword);
		}
		
		AttendanceList result = userService.getTrainerAttendances(param);
		model.addAttribute("result", result);
		
		return "checkin/attendance";
	}
	
	@GetMapping("/attendance-register")
	@PreAuthorize("hasRole('ROLE_TRAINER')")
	public String attendanceRegister(@RequestParam(name="attendance") String attendanceState,
			@RequestParam(name="cause") String cause,
			@AuthenticationPrincipal User user) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("state", attendanceState);
		param.put("cause", cause);
		param.put("userId", user.getId());
		
		userService.createTrainerAttendance(param);
		
		return "redirect:/checkin/attendance";
	}
	
}
