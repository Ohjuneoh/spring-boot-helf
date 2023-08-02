package kr.co.helf.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("Rank")
public class Rank {

	private int no;
	private String name;
	private int criteria;
	private String benefit;
}
