package kr.co.helf.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Alias("optionDetail")
public class OptionDetail {
	
	private int no;
	private String type;
	private int price;
	private Option option;
}
