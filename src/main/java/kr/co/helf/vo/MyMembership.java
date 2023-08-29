package kr.co.helf.vo;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Data
@Alias("myMembership")
@Getter
@Setter
public class MyMembership {

	private int no;
	private LocalDate startDate;			// 자동
	private LocalDate endDate;			// 자동
	private Integer remainderCnt;		// 자동
	private String state;
	private User user;				// 넣어야됨
	private Period period;			// 넣어야됨
	private Membership membership;	// 넣어야됨
	private MyOption myOption; // 채경 추가(0825) - MyMembership에서 MyOption을 가져와야 option name 가져올 수 있음.  
}
