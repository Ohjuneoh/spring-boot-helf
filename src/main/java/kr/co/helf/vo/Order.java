package kr.co.helf.vo;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
@Alias("order")
public class Order {

	private int no;
	private int membershipPrice;			// 자동
	private int surtax;
	private int totalPrice;					// 자동
	private LocalDate paymentDate;
	private String state;
	private User user;						// 넣어야됨
	private MyMembership myMembership;		// 넣어야됨
}
