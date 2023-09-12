package kr.co.helf.controller;


import java.io.IOException;
import java.util.List;

import javax.validation.Valid;

import kr.co.helf.vo.Inquires;
import kr.co.helf.dto.TrainerDto;
import kr.co.helf.exception.WithdrawalUserException;
import kr.co.helf.form.AddUserForm;
import kr.co.helf.form.UpdateUserForm;
import kr.co.helf.service.PersonalLessonService;
import kr.co.helf.service.UserService;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.TrainerReview;
import kr.co.helf.vo.User;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/user")
@SessionAttributes("addUserForm")
@RequiredArgsConstructor

public class UserController {
   
   @Autowired
   UserService userService;

   @Autowired
   PersonalLessonService personalLessonService;
   
   
/* 회원가입 시작 */
   // 회원가입 초기화면 
   @GetMapping(value="/registerform")
   public String registerForm(Model model) {
      
      model.addAttribute("addUserForm", new AddUserForm());
      return "/registerform";
   }
   

   // 회원가입 요청(유저)
   @PostMapping(value="/register/user") 
   public String registerUser(@Valid AddUserForm form, BindingResult bindingResult, RedirectAttributes attributes) {
      if(bindingResult.hasErrors()) {
         bindingResult.getAllErrors().forEach(System.out::println);
         return "registerform";
      }
      
      
      userService.createUser(form);
      attributes.addFlashAttribute("name", form.getName());
      
      return "redirect:/user/welcome";
      
   }

   // 회원가입 완료화면(유저)
   @GetMapping(value="/welcome")
   public String welcomePage() {
      
      return "welcome";    
   }
   
   // 회원가입 두번째 화면(트레이너)
   @PostMapping(value="/register/trainer") 
   public String registerTrainer(@ModelAttribute("addUserForm") AddUserForm form) {
	   
      return "register/trainerRegisterform2";
   }

   
   // 회원가입 완료화면 (트레이너)
   @PostMapping(value="/register/trainer2")
   public String registerTrainer2(@ModelAttribute("addUserForm") AddUserForm form) throws IOException {
	   
      System.out.println(form);
      userService.createTrainer(form);
      
      return "register/trainerWelcome";
   }
   

   // 아이디 중복검사 요청(ajax)
   @RequestMapping(value ="/idChk", method = RequestMethod.POST)
   @ResponseBody
   public String idCheck(String userId) throws Exception{
      int result = userService.idCheck(userId);
      
      if(result != 0) {
         return "fail";   // 중복 아이디가 존재
         
      } else {
         return "success";   // 중복 아이디 x
      }
   } 
/* 회원가입 끝 */
   
   
   
   
/* 로그인 시작 */
   // 로그인화면 
   @GetMapping(value="/loginform")
   public String loginForm() {
      return "login/loginform";
   }
   
   // 아이디찾기 화면
   @GetMapping(value="/findIdform")
   public String findIdform() {
      
      return "login/findId";
   }
   
   // 아이디 찾기 (ajax)
   @GetMapping("/findId")
   @ResponseBody
   public List<String> findId(@RequestParam("name") String name,@RequestParam("tel") String tel) throws Exception {
      List<String> result = userService.findId(name, tel);
      return result;
   }
   
   // 비밀번호찾기 화면
      @GetMapping(value="/findPwd")
      public String findPassword() {
         
         return "login/findPwd";
   }
      
   // 비밀번호 찾기 (ajax) - 인증번호 전송
   @GetMapping("/findPwdByAuth")
   @ResponseBody
   public String findPwd(@RequestParam("id") String userId) throws Exception {
      
      try {
         userService.findPwdAuth(userId);
         return "success";   

      } catch (RuntimeException ex) {
         ex.printStackTrace();
         return "fail";   
      }
   }
   
   // 비밀번호 찾기 (ajax) - 인증번호 인증(확인)
   @GetMapping("/findPwdAuthChk")
   @ResponseBody
   public String checkAuth(@RequestParam("auth") String auth, @RequestParam("id") String userId) throws Exception {
      
      try {
         userService.checkPwdAuth(auth, userId);
         return "success";   

      } catch (RuntimeException ex) {
         ex.printStackTrace();
         return "fail";   
      }
   }
   
   // 비밀번호 변경 화면
   @GetMapping("/changePwdForm")
   public String changePwdform() {
      
      return "/login/changePwdForm";
   }
   
   // 비밀번호 변경 
   @PostMapping("/changePwd")
   public String changePwd(@RequestParam("id") String userId, @RequestParam("newPwd") String newPwd) {
      
      userService.updateUserPwd(userId, newPwd);
      
      return "/login/changePwdFinish";
   }
   
   
   //인증되지 않은 사용자가 접근 했을 때 이동되는 페이지(by 준오)
   @GetMapping(value="/denied")
   public String unAuthenticatedUser() {
      
      return "error/user";
   }
/* 로그인 끝 */
   
   
/* 마이페이지 시작 */
   
   // 유저 마이페이지 화면 (유리,예광)
   @GetMapping("/userMypage")
   @PreAuthorize("hasRole('ROLE_USER')")
   public String userMypage(@AuthenticationPrincipal User user, Model model) {
      
      // 마이페이지 내정보 조회
      User userInfo = userService.getUserById(user.getId());
      model.addAttribute("userInfo", userInfo);
      
      // 트레이너 리뷰 
      List<TrainerReview>  reviews = userService.getMyReviews(user.getId());
      model.addAttribute("reviews", reviews);
      
      // 내 문의내역
      List<Inquires> moreInquiries = userService.moreInquiries(user.getId());
      model.addAttribute("moreInquiries", moreInquiries);
      
      return "/mypage/userInfo";
   }
   
   // 유저 마이페이지 수정화면
   @GetMapping("/userModify")
   public String userModifypage(Model model, @AuthenticationPrincipal User user) {
      
      System.out.println(user.getId());
      // 마이페이지 내정보 조회
      User userInfo = userService.getUserById(user.getId());
      model.addAttribute("userInfo", userInfo);
      
      return "/mypage/userModifyInfo";
   }
   
	// 유저 마이페이지 정보수정
	@PostMapping("/userInfoChange")
	public String userInfoChange(@AuthenticationPrincipal User user, @ModelAttribute("form") UpdateUserForm form) {
		userService.updateUser(user.getId(), form);
		
		return "redirect:/user/userMypage";
	}
   
   // 트레이너 마이페이지화면 - 내 리뷰 보기 (유리, 예광)
   @GetMapping("/trainerMypage")
   public String trainerMypage(@AuthenticationPrincipal User user, Model model) {
      
      // 마이페이지 내정보 조회 (유저테이블)
      User userInfo = userService.getUserById(user.getId());
      model.addAttribute("userInfo", userInfo);
    
      // 마이페이지 내정보 조회2 (트레이너테이블)
      Trainer trainerInfo = personalLessonService.getTrainerById(user.getId());
      model.addAttribute("trainerInfo", trainerInfo);
      
      // 트레이너 리뷰 보기
      List<TrainerReview> reviews = userService.getTrainerReviews(user);
      Trainer trainer = userService.getTrainerById(user);

      model.addAttribute("reviews", reviews);
      model.addAttribute("trainer", trainer);

      return "/mypage/trainerInfo";
   }
   
   // 트레이너 마이페이지 수정화면
   @GetMapping("/trainerModify")
   public String trainerModifypage(@AuthenticationPrincipal User user, Model model) {
      
	  // 마이페이지 내정보 조회 (유저테이블)
      User userInfo = userService.getUserById(user.getId());
      Trainer trainerInfo = personalLessonService.getTrainerById(user.getId());
      
      model.addAttribute("trainerInfo", trainerInfo);
      model.addAttribute("userInfo", userInfo);
	   
      return "/mypage/trainerModifyInfo";
   }

	// 트레이너 마이페이지 정보수정
	@PostMapping("/trainerInfoChange")
	public String userInfoChangeTrainer(@AuthenticationPrincipal User user, @ModelAttribute("updateForm") UpdateUserForm updateForm, @ModelAttribute("insertForm") AddUserForm insertForm) throws IOException {
	    userService.updateTrainer(user.getId(), updateForm);
	    
	    if (insertForm != null && 
	        insertForm.getCareerNames() != null && 
	        insertForm.getCareerStartDates() != null && 
	        insertForm.getCareerEndDates() != null) {
	        
	        userService.insertTrainer(user.getId(), insertForm);
	    }
		
		return "redirect:/user/trainerMypage";
	}
   
   // 마이페이지 - 트레이너 리뷰 더 보기 (예광)
   @GetMapping("/moreReviews")
   public String moreReviews(@AuthenticationPrincipal User user, Model model) {
      List<TrainerReview>  reviews = userService.getMyReviews(user.getId());
      model.addAttribute("reviews", reviews);
      
         return "/mypage/myMoreReviews";
   }

   
   // 마이페이지 - 내 문의내역 더보기 (유리)   
   @GetMapping("/moreInquiries")
   public String moreInquiries(@AuthenticationPrincipal User user, Model model) {
      List<Inquires> moreInquiries = userService.moreInquiries(user.getId());
      model.addAttribute("moreInquiries", moreInquiries);
      
         return "/mypage/myMoreInquiry";
   }
   
   // 마이페이지 - 유저 회원탈퇴
   @GetMapping("/withdrawal")
   public String withdrawalUser(@AuthenticationPrincipal User user) {
	  
	   try {
		  userService.withdrawalUser(user);
	   } catch (WithdrawalUserException e) {
		   return "redirect:/user/trainerMypage?error=no-withdrawal";
	   }
      
      // 회원탈퇴 후 로그아웃
      SecurityContextHolder.getContext().setAuthentication(null);
      
      return "redirect:/";
   }
   
   
/* 마이페이지 끝 */
   
/* 강사소개 */
   // 강사소개 - 자격 & 개설 수업수 
   @GetMapping("/trainerIntroLesson")
   @ResponseBody
   public TrainerDto trainerLessonCount(@RequestParam("userId") String userId,
		   @RequestParam("trainerNo") int trainerNo) {
	  
	   TrainerDto dto = userService.getTrainerInfo(userId, trainerNo);
	   return dto;
   }
   
	// 경력삭제
	@PostMapping("/delete-career")
	public String deleteByCareerNo(int careerNo)  {
	    userService.deleteCareer(careerNo);
	    

	    return "redirect:/user/trainerMypage";
	}

   
   
   
}