package kr.co.helf.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Alias("TrainerPersonalReview")
public class TrainerPersonalReview {

    private int no;
    private String content;
    @JsonFormat(pattern = "yyyy년 M월 d일")
    private Date createDate;
    private String status;
    private Consultation consultation;
    private PersonalLesson personalLesson;
    private Trainer trainer;
    private Double rating;


    // 별점을 적용시키기 위해 생성한 getter 메소드
    public int getFillCount() {
        return rating.intValue();
    }

    public int getHalfCount() {
        return rating > getFillCount() ? 1 : 0;
    }

    public int getEmptyCount() {
        return 5 - getFillCount() - getHalfCount();
    }
}
