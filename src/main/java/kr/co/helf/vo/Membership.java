package kr.co.helf.vo;

import java.time.LocalDate;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class Membership {

	private int no;
	private String name;
	private String description;
	private String deleted;
	private Category category;
	private int price;
	private LocalDate createDate;
	private LocalDate deleteDate;
	
	public boolean yesDeleted() {
		return "Y".equals(this.deleted);
	}

	public boolean NoDeleted() {
		return "N".equals(this.deleted);
	}
}
