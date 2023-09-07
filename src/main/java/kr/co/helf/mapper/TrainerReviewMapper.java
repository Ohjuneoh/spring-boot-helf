package kr.co.helf.mapper;

import kr.co.helf.form.ModifyPersonalReviewForm;
import kr.co.helf.form.ModifyReviewForm;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.TrainerPersonalReview;
import kr.co.helf.vo.TrainerReview;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface TrainerReviewMapper {

    // 리뷰테이블에 저장 시키기
    void insertReview(TrainerReview trainerReview);

    // 트레이너 아이디로 트레이너 번호 조회
    Trainer getTrainerById(String userId);

    // 한 트레이너에 대한 리뷰 목록 조회
    List<TrainerReview> getReviewByTrainerNo(@Param("trainerNo") int trainerNo);

    // 트레이너 번호로 트레이너 조회
    List<Trainer> getAllTrainers();

    // 등록된 리뷰 수정
    void updateReview(ModifyReviewForm form);

    // 등록된 리뷰 삭제
    void deleteReview(TrainerReview trainerReview);

    // 트레이너 리뷰 번호에 해당하는 리뷰 조회
    TrainerReview getTrainerReviewByNo(int reviewNo);

    // 트레이너 리뷰 평점 평균 조회
    Double getAvgRating(int trainerNo);

    // 트레이너번호에 해당하는 전체 리뷰 갯수 조회
    Integer getCountReviews(int trainerNo);

    // 트레이버 리뷰 리스트(더보기 페이징처리)
    List<TrainerReview> getReviewsByMore(@Param("trainerNo") int trainerNo, @Param("begin") int begin,@Param("end") int end);

    // 마이페이지 - 내 리뷰 보기
    List<TrainerReview> getMyReviews(String userId);

    // 마이페이지 - 트레이너 (내 리뷰 보기)
//    List<TrainerReview> getTrainerReviews(@Param("trainerNo") int trainerNo);

	void insertPersonalReview(TrainerPersonalReview personalReview);

	int getLessonNoByPersonalReviewCount(int personalLessonNo);

	String getLessonNoByPersonalLesson(int personalLessonNo);

	List<TrainerPersonalReview> getPersonalReviewsByMore(@Param("trainerNo") int trainerNo, @Param("begin") int begin,@Param("end") int end);

	Double getPersonalAvgRating(int trainerNo);

	Integer getCountPersonalReviews(int trainerNo);

	TrainerPersonalReview getTrainerPersonalReviewByNo(int no);

	void updatePersonalReview(ModifyPersonalReviewForm form);

	void deletePersonalReview(TrainerPersonalReview personalReview);

    // 트레이너 번호로 트레이너 정보 조회(트레이너 파일)
    Trainer getTrainerByNo(@Param("trainerNo") int trainerNo);


}
