package kr.co.helf.enums;

public enum MembershipEnum {

	ONE_DAY("하루운동"),
	TIME("횟수"),
	PERIOD("기간"),
	
	WAITING("사용대기"),
	POSSIBILITY("사용가능"),
	IMPOSSIBILITY("사용불가");
	
	private final String membershipEnum;
	
	MembershipEnum(String membershipEnum) {
		this.membershipEnum = membershipEnum;
	}

	public String getValue() {
	    return membershipEnum;
	}
}
