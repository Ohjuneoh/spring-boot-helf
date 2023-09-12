package kr.co.helf.dto;

import java.util.Date;
import kr.co.helf.vo.User;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class CustomerDetailDto {

	private User user;
	private Date recentVisitDate;
	private int accumulatedOrderTotalPrice;
	
	
}
