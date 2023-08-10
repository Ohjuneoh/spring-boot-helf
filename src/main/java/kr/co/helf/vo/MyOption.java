package kr.co.helf.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Alias("myOption")
public class MyOption {

	private int no;
	private String state;
	private Date startDate;
	private Date endDate;
	private int duration;
	private MyMembership myMembership;
	private OptionJoinDetaile optionDetaile;
}
