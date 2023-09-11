package kr.co.helf.vo;

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
@Alias("monthlyGclPayRecords")
public class MonthlyGclPayRecords {

	private int no;
	private int cnt;
	private int gclPay;
	private Date gclRecordsDate;
	private User user;
	private String status;
	private Date gclMonth; // 의미: 정산 월 
	
	public String getMonth() {
		return DateUtils.yyyyMM(gclMonth);
	}
}
