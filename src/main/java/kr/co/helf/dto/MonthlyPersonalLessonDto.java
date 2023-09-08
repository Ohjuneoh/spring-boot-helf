package kr.co.helf.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MonthlyPersonalLessonDto {

	private Date lessonDate;
	private String time;
	private String membershipName;
	private String status;
	private int membershipPrice;
	private int unitPrice;
	private int lessonPrice;
	private double pclPct;
	private String userName;
	private String trainerName;
	private String trainerId;
}
