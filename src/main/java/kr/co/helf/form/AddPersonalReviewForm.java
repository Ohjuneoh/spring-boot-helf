package kr.co.helf.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class AddPersonalReviewForm {
    private int consultationNo;
    private int personalLessonNo;
    private int trainerNo;
    private String content;
    private double rating;
}
