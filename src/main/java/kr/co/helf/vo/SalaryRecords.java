package kr.co.helf.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import kr.co.helf.utils.DateUtils;
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
	private Date insertedDate;	// 급여 확정한 날 
	private int actualMonthlysalary;
	private int tax;
	private int monthlySalary; // 수당내역(개인레슨 + 그룹레슨 수당내역) 
	private String status;
	private User user;
	private MonthlyPclPayRecords monthlyPclPayRecords;
	private MonthlyGclPayRecords monthlyGclPayRecords;
	private Date salaryDate;	// 급여 명세서 해당 달(무조건 매월 1일로 저장함) 
	private MySalary mySalary; // 테이블에는 없지만 담기 위해 작성하였음. 
	
	public String getMonth() {
		return DateUtils.yyyyMM(salaryDate);
	}
}
