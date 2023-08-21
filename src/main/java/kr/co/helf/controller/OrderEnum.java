package kr.co.helf.controller;

public enum OrderEnum {

	ONE_DAY("하루운동"),
	TIME("횟수"),
	POSSIBILITY("사용중"),
	IMPOSSIBILITY("사용불가"),
	WAITING("사용대기"),
	WAITREFOUND("환불대기"),
	REFOUNDCOMPLETED("환불완료");

	private final String orderEnum;
	
	OrderEnum(String orderEnum) {
		this.orderEnum = orderEnum;
	}

	public String getOrderEnum() {
	    return orderEnum;
	}
}
