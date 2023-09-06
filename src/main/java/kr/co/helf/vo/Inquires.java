package kr.co.helf.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Data
@NoArgsConstructor
@ToString
@Alias("Inquiry")
public class Inquires {

	private int no;
	private String type;
	private String title;
	private Date createDate;
	private Date updateDate;
	private String isAnswer;
	private String answer;
	private User user;
	private String secret;
	private String filename;
	private String content;
}
