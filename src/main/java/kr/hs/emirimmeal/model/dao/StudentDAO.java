package kr.hs.emirimmeal.model.dao;

import java.util.List;

import kr.hs.emirimmeal.model.vo.StudentVO;

public interface StudentDAO {
	public List<StudentVO> studentList();
	public boolean loginCheck(StudentVO vo);
	public StudentVO viewStudent(StudentVO vo);
}
