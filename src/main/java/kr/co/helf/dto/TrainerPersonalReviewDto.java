package kr.co.helf.dto;

import kr.co.helf.vo.TrainerPersonalReview;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class TrainerPersonalReviewDto {
    private List<TrainerPersonalReview> trainerPersonalReviews;
    private Double avgRating;
    private Integer cntReviews;

    // 별점 평균을 적용시키기 위해 생성한 getter 메소드
    public int getFillCount() {
        return avgRating.intValue();
    }

    public int getHalfCount() {
        return avgRating > getFillCount() ? 1 : 0;
    }

    public int getEmptyCount() {
        return 5 - getFillCount() - getHalfCount();
    }
}
