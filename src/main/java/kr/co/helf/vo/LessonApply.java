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
@Alias("LessonApply")
public class LessonApply {
    private int no;
    private String attendanceStatus;
    private Lesson lesson;
    private User user;
    private Date applyDate;
    private MyMembership myMembership;

}
