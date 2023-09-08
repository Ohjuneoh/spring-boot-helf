package kr.co.helf.vo;

import java.time.Period;
import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("refund")
public class Refund {

	private int no;
	private String state;
	private int amount;
	private Order order;
	private LocalDate refundDate;
	
	public void periodAmount(LocalDate start, LocalDate end, int totalPrice, int surtax) {
		System.out.println("시작일자 :" + start);
		System.out.println("종료일자 :" + end);
		System.out.println("결재금액 :" + totalPrice);
		System.out.println("부가세 :" + surtax);
		Period use = Period.between(start, LocalDate.now());
		int useDay = use.getDays();
		int useMonth = use.getMonths();
		int useYear = use.getYears();
		int useDays = useDay + (useMonth*30) + (useYear*365);
		System.out.println("경과일자: " + useDays);
		if(useDays <= 7) {
			this.amount = totalPrice;
			System.out.println("1-----환불금액 -------------------> " + amount);
			return;
		}
		
		Period total = Period.between(start, end);
		int totalDay = total.getDays();
		int totalMonth = total.getMonths();
		int totalYear = total.getYears();
		int totalDays = totalDay + (totalMonth*30) + (totalYear*365);
		System.out.println("전체일자: " + totalDays);
		int amount = (int) ((totalPrice - surtax)*((double)useDays/totalDays));
		System.out.println("2---- 환불금액 -------------------> " + amount);
		this.amount = amount;
	}
	
	public void timeAmount(int totalPrice, int surtax, int remainCnt, int totalCnt) {
		// (총 결제금액 - 위약금) * (이용횟수 / 총 이용횟수)
		double percentage = totalCnt/0.003;
		int cnt = totalCnt - remainCnt;
		
		if(percentage >= cnt) {
			this.amount = totalPrice;
			return;
		}
		
		this.amount = (totalPrice - surtax)*(remainCnt/totalCnt);
	}
}
