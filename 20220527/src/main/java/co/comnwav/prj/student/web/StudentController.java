package co.comnwav.prj.student.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.comnwav.prj.student.service.StudentService;
import co.comnwav.prj.vo.StudentVO;

@Controller
public class StudentController {
	@Autowired
	StudentService studentDao; //DAO 객체를 자동 주입
	
	@RequestMapping("/studentList.do") // 전체리스트 조회
	public String studentList(Model model) {
		model.addAttribute("students", studentDao.studentSelectList());
		return "student/studentList";
	}
	
	// 항상 annotation, method, return naming 을 일치시킨다
	@RequestMapping("/studentSelect.do") // 한명의 데이터 조회
	public String studentSelect(StudentVO vo, Model model) {
		model.addAttribute("student", studentDao.studentSelect(vo));
		return "student/studentSelect";
	}
}
