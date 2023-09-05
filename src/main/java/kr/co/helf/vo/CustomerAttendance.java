package kr.co.helf.vo;

import java.time.LocalDate;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Data
@Alias("customerAttendance")
@Getter
@Setter
public class CustomerAttendance {
	private int no;
	private Date date;
	private User user;
	private MyMembership myMembership;
	private String lessonName; // 관리자가 고객 조회 시 필요하여 추가함 (테이블에는 존재하지 않음) 
	
}
