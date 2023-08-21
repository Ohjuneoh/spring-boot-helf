package kr.co.helf.dto;

import lombok.Data;

@Data
public class OrderSearchDto {

	private String state;
	private String type;
	private String keyword;
	private int page;
}
