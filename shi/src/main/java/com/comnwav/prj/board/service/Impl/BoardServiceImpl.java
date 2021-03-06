package com.comnwav.prj.board.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.comnwav.prj.board.service.BoardMapper;
import com.comnwav.prj.board.service.BoardService;
import com.comnwav.prj.board.vo.BoardVO;

@Repository("boardDao")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper map;
	
	@Override
	public List<BoardVO> boardSelectList(int state, String key) {
		return map.boardSelectList(state, key);
	}

	@Override
	public BoardVO boardSelect(BoardVO vo) {
		return map.boardSelect(vo);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		return map.boardInsert(vo);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		return map.boardUpdate(vo);
	}

	@Override
	public int boardDelete(BoardVO vo) {
		return map.boardDelete(vo);
	}

	@Override
	public int boardHitUpdate(int id) {
		return map.boardHitUpdate(id);
	}
	
}
