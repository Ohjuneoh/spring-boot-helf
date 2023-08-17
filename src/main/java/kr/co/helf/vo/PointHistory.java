package kr.co.helf.vo;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Alias("pointHistory")
public class PointHistory {

	private int no;
	private int usePoint;		// 자동
	private LocalDate useDate;
	private User user;
	private String type;
}
