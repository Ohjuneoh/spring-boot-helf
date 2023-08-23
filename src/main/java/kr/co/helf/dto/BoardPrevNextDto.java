package kr.co.helf.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("BoardPrevNextDto")
public class BoardPrevNextDto {

	private int prevBoardNo;
	private String prevBoardTitle;
	private int nextBoardNo;
	private String nextBoardTitle;
}
