package kr.co.helf.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class GroupLessonForm {
    private int no;
    private String name;
    private String description;
    private int quota;
    private String userId;
}
