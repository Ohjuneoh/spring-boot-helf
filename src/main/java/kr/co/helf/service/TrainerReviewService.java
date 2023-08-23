package kr.co.helf.service;

import kr.co.helf.form.AddReviewForm;
import kr.co.helf.mapper.GroupLessonMapper;
import kr.co.helf.mapper.LessonMapper;
import kr.co.helf.mapper.TrainerReviewMapper;
import kr.co.helf.vo.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class TrainerReviewService {

    private final TrainerReviewMapper trainerReviewMapper;
    private final LessonMapper lessonMapper;
    private final GroupLessonMapper groupLessonMapper;

    public void createReview(AddReviewForm form){
        TrainerReview review = new TrainerReview();
        review.setTitle(form.getTitle());
        review.setContent(form.getContent());
        review.setRating(form.getRating());

        LessonApply lessonApply = lessonMapper.getLessonApplyByNo(form.getLessonApplyNo());
        int lessonNo = lessonApply.getLesson().getNo();
        // 레슨번호로 레슨조회
        Lesson lesson = groupLessonMapper.getLessonByNo(lessonNo);

        User user = lesson.getUser();
        Trainer trainer = trainerReviewMapper.getTrainerById(user.getId());

        review.setLesson(lesson);
        review.setApply(lessonApply);
        review.setTrainer(trainer);

        trainerReviewMapper.insertReview(review);

    }
}
