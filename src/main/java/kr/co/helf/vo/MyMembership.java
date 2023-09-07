package kr.co.helf.vo;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.co.helf.enums.MembershipEnum;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
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
	
	@JsonIgnore
	public void setWaitState() {
		MembershipEnum en = MembershipEnum.WAITING;
		this.state = en.getValue();
	}
	
	@JsonIgnore
	public void setPossibility() {
		MembershipEnum en = MembershipEnum.POSSIBILITY;
		this.state = en.getValue();
	}
	
	@JsonIgnore
	public void setImpossibility() {
		MembershipEnum en = MembershipEnum.IMPOSSIBILITY;
		this.state = en.getValue();
	}
	
	@JsonIgnore
	public boolean isImpossibility() {
		MembershipEnum en = MembershipEnum.IMPOSSIBILITY;
		return this.state.equals(en.getValue());
	}

	@JsonIgnore
	public int remainPeriod() {
		return (int) ChronoUnit.DAYS.between(LocalDate.now(), this.endDate);
	}
	
	@JsonIgnore
	public boolean isUserId(String userId) {
		return this.user.getId().equals(userId);
	}
}
