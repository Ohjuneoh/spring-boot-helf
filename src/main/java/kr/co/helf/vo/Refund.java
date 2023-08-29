package kr.co.helf.vo;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("refund")
public class Refund {

	private int no;
	private String state;
	private Integer amount;
	private Order order;
	private LocalDate refundDate;
}
