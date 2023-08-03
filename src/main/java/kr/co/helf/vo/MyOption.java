package kr.co.helf.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class MyOption {

	private int no;
	private String state;
	private Option option;
	private Date startDate;
	private Date endDate;
	private int duration;
	private MyMembership myMembership;
}
