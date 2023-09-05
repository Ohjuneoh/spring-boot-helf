package kr.co.helf.form;

import kr.co.helf.vo.Lesson;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class LessonApplyForm {
    private int no;
    private String status;
    private int lessonNo;
    private String userId;
    private Date date;

}
