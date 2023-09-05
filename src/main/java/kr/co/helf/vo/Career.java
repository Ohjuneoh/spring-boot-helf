package kr.co.helf.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Alias("Career")
public class Career {
	
	private int careerNo;
	private String careerName;
	private Date careerStartDate;
	private Date careerEndDate;
	private Trainer trainer;
	
}
