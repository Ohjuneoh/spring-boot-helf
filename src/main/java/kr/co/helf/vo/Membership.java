package kr.co.helf.vo;

import java.time.LocalDate;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Membership {

	private int no;
	private String name;
	private String description;
	private String state;
	private Category category;
	private int price;
	private LocalDate createDate;
	private LocalDate deleteDate;
}
