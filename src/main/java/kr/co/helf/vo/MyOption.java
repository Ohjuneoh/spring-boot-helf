package kr.co.helf.vo;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Alias("myOption")
public class MyOption {

	private int no;
	private String state;
	private LocalDate startDate;		// 자동
	private LocalDate endDate;
	private int duration;
	private OptionDetail optionDetail;
	private MyMembership myMembership;
}
