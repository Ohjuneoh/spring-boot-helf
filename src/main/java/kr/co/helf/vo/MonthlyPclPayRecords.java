package kr.co.helf.vo;

import java.time.LocalDate;
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
@Alias("monthlyPclPayRecords")
public class MonthlyPclPayRecords {

	private int no;
	private int cnt;
	private int unitPrice;
	private int pclPay;
	private Date pclRecordsDate;
	private User user;
}
