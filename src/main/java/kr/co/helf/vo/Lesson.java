package kr.co.helf.vo;

import kr.co.helf.vo.membership.Membership;
import lombok.*;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
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

    @Builder
    public Lesson(int no, String name, String time, String description, String disabled, int reqCnt, int quota, String reservation, String type, Date date, User user, Membership membership) {
        this.no = no;
        this.name = name;
        this.time = time;
        this.description = description;
        this.disabled = disabled;
        this.reqCnt = reqCnt;
        this.quota = quota;
        this.reservation = reservation;
        this.type = type;
        this.date = date;
        this.user = user;
        this.membership = membership;
    }
}
