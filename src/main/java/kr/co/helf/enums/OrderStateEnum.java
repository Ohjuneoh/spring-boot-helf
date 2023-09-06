package kr.co.helf.enums;

public enum OrderStateEnum {

	PAYMENT("결제완료"),
	WAITREFUND("환불대기"),
	REFUNDCOMPLETED("환불완료");
	
	private final String orderStateEnum;
	
	OrderStateEnum(String orderStateEnum) {
		this.orderStateEnum = orderStateEnum;
	}

	public String getValue() {
	    return orderStateEnum;
	}
}
