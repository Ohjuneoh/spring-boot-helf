package kr.co.helf.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class TrainerAttendance {

	private int no;
	private Date date; 
	private User user;
	private String cause;
	private String state;
}
