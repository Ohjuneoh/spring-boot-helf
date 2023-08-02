package kr.co.helf.vo.membership;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyOption {

	private int no;
	private String state;
	private Option option;
	private Date startDate;
	private Date endDate;
	private int duration;
	private MyMembership myMembership;
}
