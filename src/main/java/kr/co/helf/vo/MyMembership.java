package kr.co.helf.vo;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Alias("myMembership")
public class MyMembership {

	private int no;
	private LocalDate startDate;		// 자동
	private LocalDate endDate;			// 자동
	private Integer remainderCnt;		// 자동
	private String state;
	private User user;					// 넣어야됨
	private Period period;				// 넣어야됨
	private Membership membership;		// 넣어야됨

	public int remainPeriod() {
		return (int) ChronoUnit.DAYS.between(LocalDate.now(), this.endDate);
	}
}
