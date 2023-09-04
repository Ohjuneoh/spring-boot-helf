package kr.co.helf.vo;


import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
@Alias("optionDetail")
public class OptionDetail {
	
	private int no;
	private String type;
	private int price;
	private Option option;
}
