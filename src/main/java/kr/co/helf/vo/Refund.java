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
	
	public int periodAmount(LocalDate start, LocalDate end, int totalPrice, int surtax) {
		Period use = Period.between(start, LocalDate.now());
		int useDay = use.getDays();
		int useMonth = use.getMonths();
		int useYear = use.getYears();
		int useDays = useDay + (useMonth*30) + (useYear*365);
		System.out.println(useDays);
		if(useDays <= 7) {
			int amount = this.amount = totalPrice;
			return amount;
		}
		
		Period total = Period.between(start, end);
		int totalDay = total.getDays();
		int totalMonth = total.getMonths();
		int totalYear = total.getYears();
		int totalDays = totalDay + (totalMonth*30) + (totalYear*365);
		
		int amount = (totalPrice - surtax)*(useDays/totalDays);
		this.amount = amount;
		
		return amount;
	}
	
	public int timeAmount(int totalPrice, int surtax, int remainCnt, int totalCnt) {
		// (총 결제금액 - 위약금) * (이용횟수 / 총 이용횟수)
		double percentage = totalCnt/0.003;
		int cnt = totalCnt - remainCnt;
		
		if(percentage >= cnt) {
			int amount = this.amount = totalPrice;
			return amount;
		}
		
		int amount = (totalPrice - surtax)*(remainCnt/totalCnt);
		this.amount = amount;
		
		return amount;
	}
}
