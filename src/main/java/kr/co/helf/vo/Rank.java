package kr.co.helf.vo;


import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("Rank")
public class Rank {

	private int no;
	private String name;
	private int minCriteria;
	private int maxCriteria;
	private int benefit;
	private double pointRate;
}
