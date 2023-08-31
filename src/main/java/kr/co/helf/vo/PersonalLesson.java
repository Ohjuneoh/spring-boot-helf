package kr.co.helf.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("PersonalLesson")
public class PersonalLesson {
	
	private int no;
	private String name;
	private Date date;
	private Date createDate;
	private String time;
	private String content;
	private String status;
	private MyMembership myMembership;
	private Trainer trainer;
	private User user;

}
