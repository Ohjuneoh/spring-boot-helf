package kr.co.helf.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@ToString
@Alias("Lesson")
public class Lesson {
    private int no;
    private String name;
    private String time;
    private String description;
    private String disabled;
    private int reqCnt;
    private int quota;
    private String reservation;
    private String type;
    private Date date;
    private User user;
    private Membership membership;

    public Lesson(int no){
        this.no = no;
    }
}
