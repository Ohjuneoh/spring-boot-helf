package kr.co.helf.vo.membership;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Membership {

	private int no;
	private String name;
	private String description;
	private String delete;
	private Category category;
	private int price;
}
