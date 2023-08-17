package kr.co.helf.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("optionJoinDetail")
public class OptionJoinDetail {

	private int no;
	private String name;
	private int period;
	private int price;
	private Option option;
}
