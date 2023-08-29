package kr.co.helf.form;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("searchForm")
public class SearchForm {

	private String state;
	private String type;
	private String keyword;
	private Integer page;

}
