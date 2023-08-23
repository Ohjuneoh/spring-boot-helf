package kr.co.helf.controller;

import kr.co.helf.form.AddReviewForm;
import kr.co.helf.service.TrainerReviewService;
import kr.co.helf.vo.TrainerReview;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/trainer-review")
@RequiredArgsConstructor
@Slf4j
public class TrainerReviewController {

    private final TrainerReviewService trainerReviewService;
    // 트레이너 리뷰 리스트 화면 출력 - 후에 강사소개 페이지에서 값 전달 되면 트레이너 번호 받아서 출력해야 함.
    @GetMapping("/list")
    public String reviewList(@RequestParam("trainerNo") int trainerNo, Model model){
        List<TrainerReview> reviews = trainerReviewService.getReviewByTrainerNo(trainerNo);
        model.addAttribute("reviews",reviews);
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
