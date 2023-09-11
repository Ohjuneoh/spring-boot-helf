package kr.co.helf.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class GroupLessonForm {
    private int no;
    private String name;
    private int quota;
    private Date date;
    private String time;
    private String description;
}
