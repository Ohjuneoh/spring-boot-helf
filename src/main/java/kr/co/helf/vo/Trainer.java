package kr.co.helf.vo;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Trainer")
public class Trainer {
	
	private int no;
	private String file;
	private Date resignationDate;
	private String title;
	private User user;
	private Date hiredDate;
	private List<Career> careers;

	
	

}
