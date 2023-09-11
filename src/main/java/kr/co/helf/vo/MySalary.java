package kr.co.helf.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Data
@Alias("mySalary")
@Getter
@Setter
public class MySalary {
	
	private int no;
	private int regularPay;
	private double taxRate;
	private int annualSalary;
	private double pclPct;
	private double gclPct;
	private User user;
	private Trainer trainer; 
	private int unitPrice; 

}
