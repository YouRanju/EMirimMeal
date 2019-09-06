package kr.hs.emirimmeal.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.hs.emirimmeal.model.vo.StudentVO;

public interface StudentService {
	public List<StudentVO> studentList();
	public boolean loginCheck(StudentVO vo, HttpSession session);
	public StudentVO viewStudent(StudentVO vo);
}
