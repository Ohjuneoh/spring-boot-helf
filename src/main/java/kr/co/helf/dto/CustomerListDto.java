package kr.co.helf.dto;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerListDto {

	private Pagination pagination;
	private String userId;
	private String userName;
	private String userGender;
	private String userTel;
	private String userStatus;
	private Date firstOrderDate;
	private Date latestOrderDate;
	private String membershipName;
	private LocalDate myMembershipEndDate;
	private String myMembershipState;
	private int myMembershipRemainderCnt;
	
	
	public long getDaysRemaining() {
	     if (myMembershipEndDate == null) {
	         return 0;
	     }
	     LocalDate today = LocalDate.now();
        return ChronoUnit.DAYS.between(today, myMembershipEndDate);
	    }
}
