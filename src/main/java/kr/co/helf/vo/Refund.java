package kr.co.helf.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Refund {

	private int no;
	private String state;
	private int amount;
	private Order order;
}
