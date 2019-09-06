package kr.hs.emirimmeal.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.hs.emirimmeal.model.dao.StudentDAO;
import kr.hs.emirimmeal.model.vo.StudentVO;

@Service
public class StudentServiceImpl implements StudentService {

	@Inject
	StudentDAO studentdao;
	
	@Override
	public List<StudentVO> studentList() {
		return studentdao.studentList();
	}

	@Override
	public boolean loginCheck(StudentVO vo, HttpSession session) {
		boolean result = studentdao.loginCheck(vo);
		if(result) {
			StudentVO vo2 = viewStudent(vo);
			session.setAttribute("no", vo2.getNo());
			session.setAttribute("name", vo2.getName());
		}
		
		return result;
	}
	
	@Override
	public StudentVO viewStudent(StudentVO vo) {
		return studentdao.viewStudent(vo);
	}

}
