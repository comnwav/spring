package co.comnwav.proj.notice.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

//@Data getter, setter 다 포함
@Setter
@Getter
public class NoticeVO {
	
	private int noticeId; // 순번
	private String noticeName; // 작성자
	private String noticeTitle; // 제목
	private String noticeContents; // 내용
	
	private Date noticeDate; // 작성일자
	private int noticeHit; // 조회수
	private String noticeAttach; // 첨부파일명
	private String noticeDir; // 첨부파일 저장폴더명
	
}
