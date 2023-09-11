package kr.co.helf.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import kr.co.helf.vo.MonthlyGclPayRecords;
import kr.co.helf.vo.MonthlyPclPayRecords;
import kr.co.helf.vo.MySalary;
import kr.co.helf.vo.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
@Alias("MonthlyTotalSalaryDto")
public class MonthlyTotalSalaryDto {

	private MySalary mySalary;
	private MonthlyPclPayRecords pcl;
	private MonthlyGclPayRecords gcl;
	private int totalLessonFee;
	private int totalTax;
	private int totalPayment;
}
