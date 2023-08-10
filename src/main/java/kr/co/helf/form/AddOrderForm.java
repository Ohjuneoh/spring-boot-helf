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
	
	private int firstOptionDetaileNo;	// 옵션1 번호 (내 옵션)
	private String firstOptionDetaileName;	
	private int firstOptionPeriod;		// 옵션1 기간 (내 옵션)
	private int firstOptionPrice;		// 옵션1 가격 (결제)
	private int secondOptionDetaileNo;	// 옵션2 번호 (내 옵션)
	private String secondOptionDetaileName;	
	private int secondOptionPeriod;		// 옵션2 기간 (내 옵션)
	private int secondOptionPrice;		// 옵션2 가격 (결제)
	
	private int membershipAndOptionPrice;
	private int surtax;						// 부가세
	private int totalPrice;					// 총 가격 (결제)
	
	private Date startDate;					// 시작일 (내 이용권)
	private Date endDate;					// 만기일 (내 이용권)
	private Date firstOptionEndDate;		// 옵션1 만기일 (내 옵션)
	private Date secondOptionEndDate;		// 옵션1 만기일 (내 옵션)
	private int usePoint;					// 사용 포인트 (포인트 내역)
	
	public int membershipAndOptionPrice(int membershipPrice, int firstOptionPrice, int secondOptionPrice) {
		this.membershipAndOptionPrice = membershipPrice;
		
		this.membershipAndOptionPrice += firstOptionPrice;
		this.membershipAndOptionPrice += secondOptionPrice;
		
		return membershipAndOptionPrice;
	}
	
	public int surtax(int firstOptionPrice, int secondOptionPrice) {
		this.surtax = (this.membershipPrice + firstOptionPrice + secondOptionPrice) / 10;
		return surtax;
	}
	
	public int totalPrice(int membershipAndOptionPrice, int surtax) {
		this.totalPrice = membershipAndOptionPrice + surtax;
		return totalPrice;
	}
}
