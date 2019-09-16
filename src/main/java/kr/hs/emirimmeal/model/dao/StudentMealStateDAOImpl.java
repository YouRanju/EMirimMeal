package kr.hs.emirimmeal.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.hs.emirimmeal.model.vo.StudentMealStateVO;
import kr.hs.emirimmeal.model.vo.StudentVO;

@Repository
public class StudentMealStateDAOImpl implements StudentMealStateDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public StudentMealStateVO viewState(StudentVO vo) {
		return sqlsession.selectOne("studentMeal.state", vo);
	}

	@Override
	public StudentMealStateVO viewState(int no) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("studentMeal.statetoint", no);
	}

	@Override
	public void updateState(StudentMealStateVO vo) {
		sqlsession.update("studentMeal.updatestate", vo);
	}

	@Override
	public String checkSaved(int no) {
		return sqlsession.selectOne("studentMeal.checkSaved", no);
	}

	@Override
	public void updateSaved(int no) {
		sqlsession.update("studentMeal.updateSaved", no);
	}
	
	

}
