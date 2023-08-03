package kr.co.helf.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Period {

	private int no;
	private String type;
	private String property;
	private int duration;
	private int addPrice;
}
