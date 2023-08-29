package kr.co.helf.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Board")  
public class Board {

	private int no;
	private String title;
	private String content;
	private Date createDate;
	private Date updateDate;
	private String deleted;
	private int readCount;
	private String type;
	private User user;
	private Date deleteDate;
	private int main;
}
