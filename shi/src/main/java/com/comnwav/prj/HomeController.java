package com.comnwav.prj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comnwav.prj.board.service.BoardService;

@Controller
public class HomeController {
	
	@Autowired
	private BoardService boardDao;

	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("boards", boardDao.boardSelectList(1, "전체"));
		return "board/boardList";
	}
	
}
