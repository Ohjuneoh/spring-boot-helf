package kr.co.helf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.helf.dto.BoardPrevNextDto;
import kr.co.helf.dto.Pagination;
import kr.co.helf.form.AddBoardForm;
import kr.co.helf.form.BoardModifyForm;
import kr.co.helf.mapper.BoardMapper;
import kr.co.helf.vo.Board;
import kr.co.helf.vo.User;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	// 공지사항 등록
	   public void addNotice(AddBoardForm form, User user) {
	      Board board = new Board();
	      BeanUtils.copyProperties(form, board);
	      
	      board.setUser(user);
	      board.setType("notice");
	      
	      if(form.getMain().equals("0")) {
	         board.setMain(0);
	      } else {
	         board.setMain(1);
	      }
	      
	      boardMapper.insertNotice(board);
	   }
	
	// 공지사항 전체조회(페이징처리)
	public Map<String, Object> getAllNotice(Map<String, Object> param) {
		Map<String, Object> result = new HashMap<>();

		int totalRows = boardMapper.getTotalRows(param);
		int page = (int) param.get("page");
		
		Pagination pagination = new Pagination(page, totalRows);
		int begin = pagination.getBegin();
		int end = pagination.getEnd();
		param.put("begin", begin);
		param.put("end", end);
		
		List<Board> notices = boardMapper.getAllNotice(param);
		
		result.put("notices", notices);
		result.put("pagination", pagination);

		return result;
	}
	
	// 공지사항 상세정보 조회
	public Board getBoardByNo(int boardNo) {
		Board board = boardMapper.getBoardByNo(boardNo);
		return board;
	}
	
	// 공지사항 상세정보 이전글/다음글
	public BoardPrevNextDto getPrevNext(int boardNo) {
		BoardPrevNextDto prevNext = boardMapper.getPrevNextBoardByNo(boardNo);
		return prevNext;
	}
	
  // 공지사항 수정
	public void updateBoard(BoardModifyForm form) {
		 Board board = boardMapper.getBoardByNo(form.getNo());
		 BeanUtils.copyProperties(form, board);
		 
		 // board_type, user_id 담기
		 board.setType("notice");
		 
		 User user = new User();
		 user.setId("man");
		 board.setUser(user);
		 
		 boardMapper.updateBoard(board);
	}
	
	// 공지사항 삭제
	public void deleteBoard(int boardNo) {
		Board board = boardMapper.getBoardByNo(boardNo);
		board.setDeleted("Y");
		
		boardMapper.deleteBoard(board);
	}
	
	// faq 조회
	public List<Board> getfaq() {

		List<Board> faqs = boardMapper.getFaq();
		
		return faqs;
	}
	
}
