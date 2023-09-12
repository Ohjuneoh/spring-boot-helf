package kr.co.helf.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.helf.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.helf.dto.BoardPrevNextDto;
import kr.co.helf.form.AddBoardForm;
import kr.co.helf.form.BoardModifyForm;
import kr.co.helf.service.BoardService;
import kr.co.helf.vo.Board;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {

	@Autowired
	BoardService boardService;
	
	// 공지사항 전체조회(페이징처리 포함)
	@GetMapping(value="/notice")
	public String noticeList(@RequestParam(name="page", required=false, defaultValue="1")int page, Model model) {
		Map<String, Object> param = new HashMap<>();
		param.put("page",page);
		
		Map<String, Object> result = boardService.getAllNotice(param);
		
		model.addAttribute("result", result);
		return "/board/notice";
	}
	
	// 공지사항 등록폼화면
	@GetMapping(value="/noticeform")
	public String noticeform(@AuthenticationPrincipal User user,Model model) {
		model.addAttribute("user",user);
		return "board/noticeform";
	}
	
	// 공지사항 등록 

	   @PostMapping(value="/addNotice")
	   @PreAuthorize("hasRole('ROLE_MANAGER')")
	   public String addNotice(AddBoardForm form, @AuthenticationPrincipal User user) {
	      
	      boardService.addNotice(form, user);
	      
	      return "redirect:/board/notice";
	   }

	
	// 공지사항 상세정보 & 이전글/다음글
	@GetMapping(value="/detail")
	public String detailPrevNext(@RequestParam("no") int no, Model model) {
		Board board = boardService.getBoardByNo(no);
		BoardPrevNextDto dto = boardService.getPrevNext(no);
		
		model.addAttribute("board", board);
		model.addAttribute("dto", dto);
		
		return "board/noticeDetail";
	}
	
  
	// faq화면 
	@GetMapping(value="/faq")
	public String faqform(Model model) {
		List<Board> faqs = boardService.getfaq();
		model.addAttribute("faqs", faqs);
		
		return "board/faq";
	}
	
	// 공지사항 수정폼화면 (모달)
	@GetMapping("/modifyform")
	public String noticeModifyform(@RequestParam("no") int boardNo, Model model) {
		Board board = boardService.getBoardByNo(boardNo);
		model.addAttribute("board",board);
		
		return "board/modifyForm";
	}
	
	// 공지사항 수정
	@PostMapping("/modify")
	public String noticeModify(@RequestParam("no") int no,
							   @RequestParam("title") String title,
							   @RequestParam("content") String content,
							   @RequestParam("main") int main) {
		
		BoardModifyForm form = new BoardModifyForm();
		form.setNo(no);
		form.setTitle(title);
		form.setContent(content);
		form.setMain(main);
		
		boardService.updateBoard(form);
		
		return "redirect:/board/notice";
	}
	
	// 공지사항 삭제 
	@GetMapping("/delete")
	public String deleteBoard(@RequestParam("no") int boardNo) {
		boardService.deleteBoard(boardNo);
		
		return "redirect:/board/notice";
	}
	
		
	
	
	
	
}
