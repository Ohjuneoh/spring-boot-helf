package kr.co.helf.form;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Alias("ModifyPersonalReviewForm")
public class ModifyPersonalReviewForm {

	private int no;
    private Double rating;
    private String content;
}
