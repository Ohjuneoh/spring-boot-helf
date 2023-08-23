package kr.co.helf.vo;

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
@Alias("TrainerReview")
public class TrainerReview {

    private int no;
    private String title;
    private String content;
    private Date createDate;
    private String status;
    private LessonApply apply;
    private Lesson lesson;
    private Trainer trainer;
    private Double rating;
}
