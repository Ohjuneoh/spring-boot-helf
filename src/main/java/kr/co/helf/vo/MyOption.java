package kr.co.helf.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
@Alias("myOption")
public class MyOption {

	private int no;
	private OptionDetail optionDetail;
	private MyMembership myMembership;
	private int price;
}
