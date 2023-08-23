package kr.co.helf.mapper;

import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.TrainerReview;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TrainerReviewMapper {

    // 리뷰테이블에 저장 시키기
    void insertReview(TrainerReview trainerReview);

    // 트레이너 아이디로 트레이너 번호 조회
    Trainer getTrainerById(String userId);

    // 한 트레이너에 대한 리뷰 목록 조회
    List<TrainerReview> getReviewByTrainerNo(int trainerNo);

    // 등록된 리뷰 수정
    void updateReview(TrainerReview trainerReview);

    // 등록된 리뷰 삭제
    void deleteReview(TrainerReview trainerReview);
}
