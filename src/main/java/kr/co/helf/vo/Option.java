package kr.co.helf.vo;


import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@Alias("option")
public class Option {

	private int no;
	private String name;
}
