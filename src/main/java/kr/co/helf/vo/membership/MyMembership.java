package kr.co.helf.vo.membership;

import java.util.Date;

import kr.co.helf.vo.User;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyMembership {

	private int no;
	private Date startDate;
	private Date endDate;
	private int remainderCnt;
	private int remainderDuration;
	private String state;
	private User user;
	private Period period;
	private Membership membership;
}
