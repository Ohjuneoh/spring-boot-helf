package kr.co.helf.controller;

public enum MembershipEnum {

	ONE_DAY("하루운동"),
	TIME("횟수"),
	WAITING("사용대기"),
	POSSIBILITY("사용가능"),
	IMPOSSIBILITY("사용불가"),
	PAYMENT("결제완료"),
	WAITREFUND("환불대기"),
	REFUNDCOMPLETED("환불완료"),
	YES("Y"),
	NO("N");

	private final String membershiEnum;
	
	MembershipEnum(String orderEnum) {
		this.membershiEnum = orderEnum;
	}

	public String getMembershiEnum() {
	    return membershiEnum;
	}
}
