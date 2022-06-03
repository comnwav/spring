package com.comnwav.prj.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comnwav.prj.board.service.BoardService;
import com.comnwav.prj.board.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardDao;

	@RequestMapping("/boardList.do")
	public String boardList(Model model) {	
		model.addAttribute("boards", boardDao.boardSelectList(1, "전체"));
		return "board/boardList";
	}

	//
	@RequestMapping("/boardInsertForm.do")
	public String boardInsertForm() {
		return "board/boardInsertForm";
	}

	@PostMapping("/boardInsert.do")
	public String boardInsert(BoardVO vo) {
		boardDao.boardInsert(vo);
		return "redirect:boardList.do";
	}
	
	@PostMapping("/getContent.do")
	public String getContent(BoardVO vo, Model model) {
		boardDao.boardHitUpdate(vo.getBoardId());
		model.addAttribute("content", boardDao.boardSelect(vo));
		return "board/boardContent";
	}
	
	@RequestMapping("/boardDelete.do")
	public String delete(BoardVO vo) {
		boardDao.boardDelete(vo);
		return "redirect:boardList.do";
	}
	
	@RequestMapping("/boardModifyForm.do")
	public String modify(BoardVO vo, Model model) {
		model.addAttribute("board", boardDao.boardSelect(vo));
		return "board/boardModifyForm";
	}
	
	@RequestMapping("/boardModify.do")
	public String modifyResult (BoardVO vo) {
		boardDao.boardUpdate(vo);
		return "redirect:boardList.do";
	}
	
	@PostMapping("/ajaxSearchList.do")
	@ResponseBody
	public List<BoardVO> ajaxSearchList(@RequestParam("state") int state, @RequestParam("key") String key) {
		return boardDao.boardSelectList(state, key);
	}

}
