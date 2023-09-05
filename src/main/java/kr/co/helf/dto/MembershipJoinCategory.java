package kr.co.helf.dto;

import java.time.LocalDate;

import org.apache.ibatis.type.Alias;

import kr.co.helf.enums.MembershipEnum;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Alias("membershipJoinCat")
public class MembershipJoinCategory {

	private int no;
	private String name;
	private int price;
	private String description;
	private String deleted;
	private LocalDate createDate;
	private LocalDate deleteDate;
	private int catNo;
	private String catName;
	private String catProperty;
	private String useOption;
	
	public boolean isOneDay() {
		return MembershipEnum.ONE_DAY.getValue().equals(this.catName);
	}
}
