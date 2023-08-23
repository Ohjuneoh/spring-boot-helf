package kr.co.helf.service;

import kr.co.helf.form.AddReviewForm;
import kr.co.helf.mapper.GroupLessonMapper;
import kr.co.helf.mapper.LessonMapper;
import kr.co.helf.mapper.TrainerReviewMapper;
import kr.co.helf.vo.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class TrainerReviewService {

    private final TrainerReviewMapper trainerReviewMapper;
    private final LessonMapper lessonMapper;
    private final GroupLessonMapper groupLessonMapper;

    // 리뷰 등록하는 로직
    public void createReview(AddReviewForm form){
        // 트레이너 리뷰 객체에 DTO에 필요한 객체 담기
        TrainerReview review = new TrainerReview();
        review.setTitle(form.getTitle());
        review.setContent(form.getContent());
        review.setRating(form.getRating());

        // 레슨신청 번호로 레슨신청 테이블에 있는 값 조회
        LessonApply lessonApply = lessonMapper.getLessonApplyByNo(form.getLessonApplyNo());
        // 레슨신청 테이블에 저장되어 있는 레슨 번호 찾기
        int lessonNo = lessonApply.getLesson().getNo();
        // 레슨번호로 레슨조회
        Lesson lesson = groupLessonMapper.getLessonByNo(lessonNo);

        // 유저에 들어가있는 트레이너 아이디로 트레이너 번호 찾기
        User user = lesson.getUser();
        Trainer trainer = trainerReviewMapper.getTrainerById(user.getId());

        //위에 있는 레슨번호 레슨신청번호 트레이너 번호 및 제목 내용 별점담기
        review.setLesson(lesson);
        review.setApply(lessonApply);
        review.setTrainer(trainer);

        trainerReviewMapper.insertReview(review);
    }

    // 트레이너 번호에 해당하는 리뷰 조회
    public List<TrainerReview> getReviewByTrainerNo(int trainerNo){
        List<TrainerReview> review = trainerReviewMapper.getReviewByTrainerNo(trainerNo);
        return review;
    }
}
