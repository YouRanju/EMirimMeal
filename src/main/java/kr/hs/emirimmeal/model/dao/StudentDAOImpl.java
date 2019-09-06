package kr.hs.emirimmeal.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.hs.emirimmeal.model.vo.StudentVO;

@Repository
public class StudentDAOImpl implements StudentDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<StudentVO> studentList() {
		return sqlsession.selectList("student.studentList");
	}

	@Override
	public boolean loginCheck(StudentVO vo) {
		String name = sqlsession.selectOne("student.loginCheck", vo);
		return (name==null) ? false : true;
	}

	@Override
	public StudentVO viewStudent(StudentVO vo) {
		return sqlsession.selectOne("student.viewStudent", vo);
	}
}
