package kr.co.helf.mapper;

import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.TrainerReview;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TrainerReviewMapper {

    void insertReview(TrainerReview trainerReview);

    Trainer getTrainerById(String userId);
}
