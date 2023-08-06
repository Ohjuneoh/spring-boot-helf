package kr.co.helf.dto;

import lombok.*;

import java.util.Date;

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
