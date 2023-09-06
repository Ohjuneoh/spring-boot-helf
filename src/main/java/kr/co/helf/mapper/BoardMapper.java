package kr.co.helf.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.helf.dto.BoardPrevNextDto;
import kr.co.helf.vo.Board;


@Mapper
public interface BoardMapper {
	
	// 공지사항 등록
	void insertNotice(Board board);
	
	// 페이징처리
	int getTotalRows(Map<String,Object> param);
	
	// 공지사항 전체조회(페이징처리 포함)
	List<Board> getAllNotice(Map<String, Object> param);
	
	// 공지사항 상세정보 조회
	Board getBoardByNo(int boardNo);
	
	// 공지사항 수정
	void updateBoard(Board board);

	// 공지사항 삭제
	void deleteBoard(Board board);


	// 공지사항 상세 - 이전글/다음글
	BoardPrevNextDto getPrevNextBoardByNo(int boardNo);
	
	// faq 조회
	List<Board> getFaq();
}
