package kr.co.helf.controller;

import kr.co.helf.form.AddReviewForm;
import kr.co.helf.service.TrainerReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("trainer-review")
@RequiredArgsConstructor
@Slf4j
public class TrainerReviewController {

    private final TrainerReviewService trainerReviewService;
    // 트레이너 리뷰 리스트 화면 출력
    @GetMapping("/list")
    public String reviewList(){
        return "/trainer-review/list";
    }
    // 트레이너 리뷰 등록 화면
    @GetMapping("/registration")
    public String reviewForm(){
        return "/trainer-review/form";
    }
    // 트레이너 리뷰 등록
    @PostMapping("/registration")
    public String review(AddReviewForm form){
        trainerReviewService.createReview(form);
        return "trainer-review/list";
    }

}
