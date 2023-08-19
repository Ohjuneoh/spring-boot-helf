package kr.co.helf.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Alias("myOption")
public class MyOption {

	private int no;
	private String state;
	private OptionDetail optionDetail;
	private MyMembership myMembership;
}
