package kr.co.helf.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;
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
    private int attendanceRate;

    // 홈페이지 개설된 수업을 위한 변수
    private int allLessons;

    public Lesson(int no){
        this.no = no;
    }

    public boolean isPast() {
        return date.before(new Date());
    }
}
