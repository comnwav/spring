package co.comnwav.proj.notice.service;

import java.util.List;

import co.comnwav.proj.notice.vo.NoticeVO;

public interface NoticeService {
	
	List<NoticeVO> noticeSelectList(int state, String key);
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
	
	int noticeHitUpdate(int id); // 조회수 변경
	
}
