package kr.co.helf.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("myOptionJoin")
public class MyOptionJoinDto {

	private int no;
	private int myMembershipNo;
	private String name;
	private int price;
}
