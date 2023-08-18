package kr.co.helf.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.vo.Board;

@Mapper
public interface BoardMapper {

	void insertBoard(Board board);
}
