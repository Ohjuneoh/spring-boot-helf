package kr.co.helf.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class MoreGroupLessonDto {
    private int no;
    private String name;
    private String time;
    private Date date;
    private int reqCnt;
    private int quota;
    private int attendanceRate;
}
