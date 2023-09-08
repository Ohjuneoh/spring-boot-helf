package kr.co.helf.dto;

import java.util.Date;
import java.util.List;

import kr.co.helf.vo.CustomerAttendance;
import kr.co.helf.vo.LessonApply;
import kr.co.helf.vo.MyMembership;
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
