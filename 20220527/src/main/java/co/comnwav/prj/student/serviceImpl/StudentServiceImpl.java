package co.comnwav.prj.student.serviceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.comnwav.prj.student.service.StudentService;
import co.comnwav.prj.vo.StudentVO;

@Repository("studentDao")
public class StudentServiceImpl implements StudentService {

	@Autowired
	private DataSource dataSource; // ioc 에 등록된 dbcp를 불러온다.

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	@Override
	public List<StudentVO> studentSelectList() {
	
		StudentVO vo;
		List<StudentVO> students = new ArrayList<StudentVO>();
		
		String sql = "SELECT * FROM STUDENT";
		// ctrl + shift + x => 대문자 변환
		
		try {
			conn = dataSource.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new StudentVO();
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setAddress(rs.getString("address"));
				vo.setTel(rs.getString("tel"));
				vo.setBirthday(rs.getDate("birthday"));
				vo.setAge(rs.getInt("age"));
				students.add(vo);
				System.out.println(vo.getId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return students;
	}

	@Override
	public StudentVO studentSelect(StudentVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int studentInsert(StudentVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int studentUpdate(StudentVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int studentDelete(StudentVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean studentIdCheck(String id) {
		// TODO Auto-generated method stub
		return false;
	}

}
