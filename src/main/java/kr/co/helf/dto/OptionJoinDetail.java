package kr.co.helf.dto;

import org.apache.ibatis.type.Alias;

import kr.co.helf.vo.Option;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("optionJoinDetail")
public class OptionJoinDetail {

	private int no;
	private String name;
	private String type;
	private int price;
	private Option option;
}
