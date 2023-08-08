package kr.co.helf.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Alias("Career")
public class Career {
	
	private int no;
	private String name;
	private Date startDate;
	private Date endDate;
	private Trainer trainer;
	
}
