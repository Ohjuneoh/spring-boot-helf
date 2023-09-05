package kr.co.helf.form;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Alias("addOrderForm")
public class AddOrderForm {
	
	private int membershipNo;					// 멤버십 번호 (내 이용권)
	private String membershipName;
	private int membershipDefaltPrice;			// 멤버십 기본 가격
	private int membershipPrice;				// 멤버십 기본 가격 + 기간가격 (결제)
	private int periodNo;						// 이용권 기간번호 (내 이용권)
	private int periodDuration;
	private Integer remainderCnt;				// 횟수권이라면 이용권 횟수 (내 이용권)
	
	private int lockerNo;						// 락커 번호 (내 옵션)
	private String lockerName;	
	private int lockerPrice;					// 락커 가격 (결제)
	private int wearNo;							// 운동복 번호 (내 옵션)
	private String wearName;	
	private int wearPrice;						// 운동복 가격 (결제)
	
	private int membershipOptionPrice;
	private int surtax;							// 부가세
	private int usePoint;						// 사용 포인트 (포인트 내역)
	private int totalPrice;						// 총 가격 (결제)
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate startDate;				// 시작일 (내 이용권)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate endDate;					// 만기일 (내 이용권)
	private int savePoint;						// 적립 포인트 (회원)
	
	public void membershipOptionPrice() {
		this.membershipOptionPrice = this.membershipPrice + this.lockerPrice + this.wearPrice;
	}
	
	public void surtax() {
		this.surtax = (this.membershipPrice + this.lockerPrice + this.wearPrice) / 10;
	}
	
	public void totalPrice() {
		this.totalPrice = this.membershipOptionPrice + this.surtax;
	}
}
