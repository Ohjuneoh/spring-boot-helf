package kr.co.helf.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.helf.dto.Pagination;
import kr.co.helf.form.AddBoardForm;
import kr.co.helf.mapper.BoardMapper;
import kr.co.helf.vo.Board;
import kr.co.helf.vo.User;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	// 공지사항 등록
	public void addNotice(AddBoardForm form) {
		Board board = new Board();
		
		BeanUtils.copyProperties(form, board);
		
		User user = new User();
		user.setId("man");
		board.setUser(user);
		
		board.setType("notice");
		
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
	
	// 상세정보 조회
	public Board getBoardByNo(int boardNo) {
		Board board = boardMapper.getBoardByNo(boardNo);
		return board;
	}
}
