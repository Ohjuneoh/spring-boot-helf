package kr.co.helf.dto;

import kr.co.helf.vo.TrainerPersonalReview;
import kr.co.helf.vo.TrainerReview;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ReviewIntegrationDto {

    private TrainerReview trainerReview;
    private TrainerPersonalReview trainerPersonalReview;
}
