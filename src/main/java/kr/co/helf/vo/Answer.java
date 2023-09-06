package kr.co.helf.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("Answer")
public class Answer {

	private int no;
	private Inquires inquiry;
	private String content;
	private String deleted;
	private User user;
	private Date createDate;
	private Date deleteDate;
}
