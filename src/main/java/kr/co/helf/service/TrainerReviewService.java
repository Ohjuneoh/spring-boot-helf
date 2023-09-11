package kr.co.helf.service;

import kr.co.helf.dto.TrainerPersonalReviewDto;
import kr.co.helf.dto.TrainerReviewDto;
import kr.co.helf.form.AddPersonalReviewForm;
import kr.co.helf.form.AddReviewForm;
import kr.co.helf.form.ModifyPersonalReviewForm;
import kr.co.helf.form.ModifyReviewForm;
import kr.co.helf.mapper.GroupLessonMapper;
import kr.co.helf.mapper.LessonMapper;
import kr.co.helf.mapper.TrainerReviewMapper;
import kr.co.helf.vo.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TrainerReviewService {

    private final TrainerReviewMapper trainerReviewMapper;
    private final LessonMapper lessonMapper;
    private final GroupLessonMapper groupLessonMapper;

    // 리뷰 등록하는 로직
    public void createReview(AddReviewForm form) {
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
        review.setLessonApply(lessonApply);
        review.setTrainer(trainer);

        trainerReviewMapper.insertReview(review);
    }


    // 트레이너 번호에 해당하는 리뷰 조회
    public TrainerReviewDto getReviewByTrainerNo(int trainerNo) {
        // 트레이너번호에 해당하는 전체 리스트
        List<TrainerReview> reviews = trainerReviewMapper.getReviewsByMore(trainerNo, 1, 3);
        // 트레이너 번호에 해당하는 평균평점
        Double avgRating = trainerReviewMapper.getAvgRating(trainerNo);
        // 트레이너 번호에 해당하는 리스트 갯수
        Integer cntReviews = trainerReviewMapper.getCountReviews(trainerNo);
        
        TrainerReviewDto dto = new TrainerReviewDto();
        dto.setTrainerReviews(reviews);
        dto.setAvgRating(avgRating);
        dto.setCntReviews(cntReviews);


        return dto;
    }

    // 트레이너 번호로 모든 트레이너 정보 조회
    public List<Trainer> getAllTrainers() {
        return trainerReviewMapper.getAllTrainers();
    }

    // 트레이너 리뷰 번호에 해당하는 리뷰 수정
    public void updateReview(ModifyReviewForm form) {
        TrainerReview trainerReview = trainerReviewMapper.getTrainerReviewByNo(form.getNo());
        BeanUtils.copyProperties(form, trainerReview);
        trainerReviewMapper.updateReview(form);
    }

    // 트레이너 리뷰번호로 트레이너 리뷰 조회
    public TrainerReview getReviewByNo(int reviewNo) {
        TrainerReview review = trainerReviewMapper.getTrainerReviewByNo(reviewNo);
        return review;
    }

    // 트레이너 리뷰 번호에 해당하는 리뷰 삭제
    public void deleteReview(int reviewNo) {
        TrainerReview trainerReview = trainerReviewMapper.getTrainerReviewByNo(reviewNo);
        trainerReview.setStatus("N");
        trainerReviewMapper.deleteReview(trainerReview);
    }

    // 트레이너 리뷰 리스트 출력 (더 보기 페이징처리)
    public List<TrainerReview> reviewMore(int trainerNo,int page){
        int begin = (page-1)* 3 + 1;
        int end = page * 3;

        List<TrainerReview> reviews = trainerReviewMapper.getReviewsByMore(trainerNo,begin,end);

        return reviews;
    }
    
    //개인수업 리뷰 작성
	public void createPersonalReview(AddPersonalReviewForm form) {
	
		TrainerPersonalReview personalReview = new TrainerPersonalReview();
		
		personalReview.setContent(form.getContent());
		personalReview.setRating(form.getRating());
		
		Trainer trainer = new Trainer();
		trainer.setTrainerNo(form.getTrainerNo());
		
		Consultation consultation = new Consultation();
		consultation.setConsultationNo(form.getConsultationNo());
		
		PersonalLesson personalLesson = new PersonalLesson();
		personalLesson.setNo(form.getPersonalLessonNo());
		
		personalReview.setTrainer(trainer);
		personalReview.setConsultation(consultation);
		personalReview.setPersonalLesson(personalLesson);
		
		int existingPersonalLesson = trainerReviewMapper.getLessonNoByPersonalReviewCount(form.getPersonalLessonNo());
		String attendanceCheck = trainerReviewMapper.getLessonNoByPersonalLesson(form.getPersonalLessonNo());
		
		
	    if(existingPersonalLesson > 0) {
	        throw new RuntimeException("이미 작성한 리뷰입니다.");
	    }

	    if("W".equals(attendanceCheck) || "N".equals(attendanceCheck)) {
	        throw new RuntimeException("출석 후 리뷰를 작성할 수 있습니다.");
	    }
		trainerReviewMapper.insertPersonalReview(personalReview);
	}

	public TrainerPersonalReviewDto getPersonalReviewByTrainerNo(int trainerNo) {
		
		List<TrainerPersonalReview> personalReviews = trainerReviewMapper.getPersonalReviewsByMore(trainerNo, 1, 3);
		
        Double personalAvgRating = trainerReviewMapper.getPersonalAvgRating(trainerNo);
        
        Integer cntPersonalReviews = trainerReviewMapper.getCountPersonalReviews(trainerNo);
        
        TrainerPersonalReviewDto personalReviewDto = new TrainerPersonalReviewDto();
        
        personalReviewDto.setTrainerPersonalReviews(personalReviews);
        personalReviewDto.setAvgRating(personalAvgRating);
        personalReviewDto.setCntReviews(cntPersonalReviews);
        
		return personalReviewDto;
	}

	public void updatePersonalReview(ModifyPersonalReviewForm form) {
		
		TrainerPersonalReview trainerPersonalReview = trainerReviewMapper.getTrainerPersonalReviewByNo(form.getNo());
		
		BeanUtils.copyProperties(form, trainerPersonalReview);
		
	    trainerReviewMapper.updatePersonalReview(form);
	}


	public void deletePersonalReview(int reviewNo) {
		TrainerPersonalReview personalReview = trainerReviewMapper.getTrainerPersonalReviewByNo(reviewNo);
		personalReview.setStatus("N");
		
		trainerReviewMapper.deletePersonalReview(personalReview);
	}

    // 트레이너 번호로 트레이너 정보 조회(파일이름)
    public Trainer getTrainerByNo(int trainerNo){
        Trainer trainer = trainerReviewMapper.getTrainerByNo(trainerNo);
        return trainer;
    }




}