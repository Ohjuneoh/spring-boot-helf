package kr.co.helf.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ModifyGroupLessonForm {
    private int no;
    private String name;
    private Date date;
    private String time;
    private int quota;
    private String description;
}
