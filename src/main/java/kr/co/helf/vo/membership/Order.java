package kr.co.helf.vo.membership;

import java.util.Date;

import kr.co.helf.vo.User;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
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
