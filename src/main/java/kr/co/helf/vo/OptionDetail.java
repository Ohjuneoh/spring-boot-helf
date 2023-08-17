package kr.co.helf.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
@Alias("optionDetail")
public class OptionDetail {
	
	private int no;
	private int period;
	private int price;
	private Option option;
}
