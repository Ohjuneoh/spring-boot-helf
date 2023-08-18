package kr.co.helf.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.helf.form.AddBoardForm;
import kr.co.helf.mapper.BoardMapper;
import kr.co.helf.vo.Board;
import kr.co.helf.vo.User;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	// 공지사항
	public void addNotice(AddBoardForm form) {
		Board board = new Board();
		
		BeanUtils.copyProperties(form, board);
		
		User user = new User();
		user.setId("man");
		board.setUser(user);
		
		board.setType("notice");
		
		boardMapper.insertBoard(board);
	}
}
