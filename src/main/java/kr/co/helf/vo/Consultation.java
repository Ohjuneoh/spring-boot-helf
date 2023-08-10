package kr.co.helf.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
@Alias("Consultation")
public class Consultation {
	
	private int consultationNo;
	private String consultationStatus;
	private Lesson lesson;
	private Date applicationDate;
	private String goal;
	private String abnormalities;
	private Date requestDate;
	private String requestTime;
	private User user;
	private Trainer trainer;
	

}
