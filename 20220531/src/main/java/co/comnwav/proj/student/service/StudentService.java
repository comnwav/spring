package co.comnwav.proj.student.service;

import java.util.List;

import co.comnwav.proj.student.vo.StudentVO;

// dao에서 사용하는 interface
public interface StudentService {
	
	List<StudentVO> studentSelectList(); // 전체회원
	StudentVO studentSelect(StudentVO vo); //한명조회 or 로그인처리
	int studentInsert(StudentVO vo); // 회원추가
	int studentUpdate(StudentVO vo); // 회원정보 수정
	int studentDelete(StudentVO vo); // 회원삭제
	
	boolean idCheck(String id); // 아이디 중복 체크
	
}
