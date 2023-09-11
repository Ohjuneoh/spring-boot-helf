package kr.co.helf.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Alias("Career")
public class Career {
	
	private int careerNo;
	private String careerName;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date careerStartDate;	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date careerEndDate;
	private Trainer trainer;
	
}
