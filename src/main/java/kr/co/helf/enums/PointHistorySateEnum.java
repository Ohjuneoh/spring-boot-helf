package kr.co.helf.enums;

public enum PointHistorySateEnum {

	PAYMENTPOINT("결제"),
	REFUNDPOINT("환불"),
	SAVEPOINT("적립"),
	GETBACKPOINT("회수");
	
	private final String pointHistoryStateEnum;
	
	PointHistorySateEnum(String pointHistoryStateEnum) {
		this.pointHistoryStateEnum = pointHistoryStateEnum;
	}

	public String getValue() {
	    return pointHistoryStateEnum;
	}
}
