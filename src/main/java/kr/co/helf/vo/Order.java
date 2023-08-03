package kr.co.helf.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Order {

	private int no;
	private int totalPrice;
	private Date paymentDate;
	private String state;
	private User user;
	private int optionPrice;
	private int membershipPrice;
	private MyMembership myMembership;
	private  PointHistory pointHistory;
}
