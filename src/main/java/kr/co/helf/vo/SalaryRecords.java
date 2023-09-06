package kr.co.helf.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Alias("salaryRecords")
public class SalaryRecords {

	
	private int no;
	private Date date;
	private int totalClassPay;
	private int tax;
	private int monthlySalary;
	private String status;
	private User user;
	private MonthlyGclPayRecords monthlyGclPayRecords;
	private MonthlyPclPayRecords monthlyPclPayRecords;
}
