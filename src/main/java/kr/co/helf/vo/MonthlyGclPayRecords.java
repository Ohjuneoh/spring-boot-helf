package kr.co.helf.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

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
	private int unitPrice;
	private int gclPay;
	private Date gclRecordsDate;
	private User user;
}
