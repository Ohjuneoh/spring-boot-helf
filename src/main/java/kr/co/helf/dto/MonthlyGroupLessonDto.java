package kr.co.helf.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import kr.co.helf.vo.Membership;
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
@Alias("GroupLessonDto")
public class MonthlyGroupLessonDto {

	public int lessonNo;
	public String lessonName;
	public Date lessonDate;
	public String lessonTime;
	public int reqCnt;
	public int quota;
	public User user;
	public MySalary mySalary;
	public int attendanceCnt;
	public int lessonFee;
	
}
