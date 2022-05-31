package co.comnwav.proj.student.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.comnwav.proj.student.service.StudentMapper;
import co.comnwav.proj.student.service.StudentService;
import co.comnwav.proj.student.vo.StudentVO;

@Repository("studentDao")
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentMapper map;

	@Override
	public List<StudentVO> studentSelectList() {
		return map.studentSelectList();
	}

	@Override
	public StudentVO studentSelect(StudentVO vo) {
		return map.studentSelect(vo);
	}

	@Override
	public int studentInsert(StudentVO vo) {
		return map.studentInsert(vo);
	}

	@Override
	public int studentUpdate(StudentVO vo) {
		return map.studentUpdate(vo);
	}

	@Override
	public int studentDelete(StudentVO vo) {
		return map.studentDelete(vo);
	}

	@Override
	public boolean idCheck(String id) {
		return map.idCheck(id);
	}
}
