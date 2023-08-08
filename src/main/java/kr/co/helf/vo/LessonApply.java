package kr.co.helf.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class LessonApply {
    private int no;
    private String status;
    private Lesson lesson;
    private User user;
    private Date date;
}
