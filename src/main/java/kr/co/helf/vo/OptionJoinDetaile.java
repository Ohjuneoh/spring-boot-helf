package kr.co.helf.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Alias("optionJoinDetaile")
public class OptionJoinDetaile {

	private int no;
	private String name;
	private int period;
	private int price;
	private Option option;
}
