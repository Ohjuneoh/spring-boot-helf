package kr.co.helf.form;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class AddOrderForm {

	private int no;							// 멤버십 번호 (내 이용권)
	private String membershipName;
	private int membershipPrice;			// 멤버십 가격 (결제)
	private int periodNo;					// 이용권 기간번호 (내 이용권)
	private int periodDuration;
	private Integer periodTime;				// 횟수권이라면 이용권 횟수 (내 이용권)
	
	private Integer firstOptionDetaileNo;	// 옵션1 번호 (내 옵션)
	private String firstOptionDetaileName;	
	private Integer firstOptionPeriod;		// 옵션1 기간 (내 옵션)
	private Integer firstOptionPrice;		// 옵션1 가격 (결제)
	private Integer secondOptionDetaileNo;	// 옵션2 번호 (내 옵션)
	private String secondOptionDetaileName;	
	private Integer secondOptionPeriod;		// 옵션2 기간 (내 옵션)
	private Integer secondOptionPrice;		// 옵션2 가격 (결제)
	
	private int surtax;						// 부가세
	private int totalPrice;					// 총 가격 (결제)
	
	private Date startDate;					// 시작일 (내 이용권)
	private Date endDate;					// 만기일 (내 이용권)
	private Date firstOptionEndDate;		// 옵션1 만기일 (내 옵션)
	private Date secondOptionEndDate;		// 옵션1 만기일 (내 옵션)
	private int usePoint;					// 사용 포인트 (포인트 내역)
	
	public int totalPrice() {
		this.totalPrice = this.membershipPrice;
		
		if(this.firstOptionPrice != null) {
			this.totalPrice = this.firstOptionPrice;
		}
		if(this.secondOptionPrice != null) {
			this.totalPrice = this.secondOptionPrice;
		}
		
		return totalPrice;
	}
	
	public int surtax(int firstOptionPrice, int secondOptionPrice) {
		this.surtax = (this.membershipPrice + firstOptionPrice + secondOptionPrice) / 10;
		return surtax;
	}
}
