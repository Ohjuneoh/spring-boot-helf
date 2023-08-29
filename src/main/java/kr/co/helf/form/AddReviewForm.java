package kr.co.helf.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class AddReviewForm {
    private int lessonApplyNo;
    private int lessonNo;
    private String title;
    private String content;
    private double rating;
}
