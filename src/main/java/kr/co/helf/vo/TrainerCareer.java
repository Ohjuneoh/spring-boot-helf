package kr.co.helf.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("TrainerCareer")

public class TrainerCareer {
	private int no;
	private String name;
	private Date startDate;
	private Date endDate;
	private int trainerNo;
	
}
