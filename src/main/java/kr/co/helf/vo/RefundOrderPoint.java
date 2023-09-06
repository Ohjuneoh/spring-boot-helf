package kr.co.helf.vo;

import org.apache.ibatis.type.Alias;

import kr.co.helf.enums.PointHistorySateEnum;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("refundOrderPoint")
public class RefundOrderPoint {

	private int orderId;
	private int refundNo;
	private int pointNo;
	private String pointType;
	private int pointUse;
	private int userPoint;
	private String userId;
	
	public boolean isPaymentPoint() {
		PointHistorySateEnum pse = PointHistorySateEnum.PAYMENTPOINT;
		return this.pointType.equals(pse.getValue());
	}
	
	public boolean isSavePoint() {
		PointHistorySateEnum pse = PointHistorySateEnum.SAVEPOINT;
		return this.pointType.equals(pse.getValue());
	}
}
