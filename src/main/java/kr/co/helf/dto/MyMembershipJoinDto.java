package kr.co.helf.dto;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.type.Alias;

import kr.co.helf.vo.User;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("myMembershipJoin")
public class MyMembershipJoinDto {

	private int no;
	private int membershipNo;
	private String name;
	private LocalDate startDate;		
	private LocalDate endDate;			
	private Integer remainderCnt;	
	private String state;
	private User user;				
	private String type;
	List<MyOptionJoinDto> myOptionJoins;
	
}
