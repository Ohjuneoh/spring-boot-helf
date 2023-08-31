package kr.co.helf.dto;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.type.Alias;

import kr.co.helf.vo.Category;
import kr.co.helf.vo.Period;
import kr.co.helf.vo.PointHistory;
import kr.co.helf.vo.User;
import lombok.Data;

@Data
@Alias("orderJoin")
public class OrderJoin {

	private int no;
	private int membershipPrice;
	private int surtax;
	private int totalPrice;	
	private LocalDate paymentDate;
	private String orderState;
	
	private int myMembershipNo;
	private LocalDate startDate;			
	private LocalDate endDate;			
	private Integer remainderCnt;		
	private String myMembershipState;
	private Period period;			
	
	private int membershipNo;
	private String name;
	private String description;
	private String state;
	private Category category;
	private int price;
	private LocalDate createDate;
	private LocalDate deleteDate;
	
	private int refundNo;
	private int refundAmount;
	private String refundState;
	private LocalDate refundDate;
	
	private User user;					
	private List<PointHistory> points;
}
