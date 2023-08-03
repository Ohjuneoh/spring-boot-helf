package kr.co.helf.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class MyMembership {

	private int no;
	private Date startDate;
	private Date endDate;
	private int remainderCnt;
	private String state;
	private User user;
	private Period period;
	private Membership membership;
}
