package kr.co.helf.vo;

import kr.co.helf.enums.MembershipEnum;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class Period {

	private int no;
	private String type;
	private int property;
	private int duration;
	private int addPrice;
	
	public boolean isPeriod(MembershipEnum e) {
		return e.PERIOD.equals(this.type);
	}
	
	public boolean isTime(MembershipEnum e) {
		return e.TIME.getValue().equals(this.type);
	}
}
