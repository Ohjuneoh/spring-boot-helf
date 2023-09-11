package kr.co.helf.vo;

import java.time.LocalDate;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import kr.co.helf.utils.DateUtils;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Data
@Alias("monthlyPclPayRecords")
public class MonthlyPclPayRecords {

	private int no;
	private int cnt;
	private int pclPay;
	private Date pclRecordsDate;
	private User user;
	private String stauts;
	private Date pclMonth; // 정산월 
	
	public String getMonth() {
		return DateUtils.yyyyMM(pclMonth);
	}
}
