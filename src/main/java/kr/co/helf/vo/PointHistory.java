package kr.co.helf.vo;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

import kr.co.helf.enums.PointHistorySateEnum;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
@Alias("pointHistory")
public class PointHistory {

	private int no;
	private int usePoint;		// 자동
	private LocalDate useDate;
	private User user;
	private String type;
	private Order order;
	
	public void setPaymentPoint() {
		PointHistorySateEnum en = PointHistorySateEnum.PAYMENTPOINT;
		this.type = en.getValue();
	}
	
	public void setSavePoint() {
		PointHistorySateEnum en = PointHistorySateEnum.SAVEPOINT;
		this.type = en.getValue();
	}
}
