package kr.co.helf.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Alias("Files")
@Data
@Getter
@Setter
@ToString
public class Files {

	private int no;
	private String title;
	private String name;
	private String added;
	private Date createDate;
	private int inquiryNo;
	
}
