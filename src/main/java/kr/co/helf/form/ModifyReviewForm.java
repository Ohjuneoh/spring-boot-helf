package kr.co.helf.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ModifyReviewForm {

    private int no;
    private String title;
    private Double rating;
    private String content;
    private int trainerNo;
}
