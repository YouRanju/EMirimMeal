package kr.hs.emirimmeal.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.hs.emirimmeal.model.vo.StudentMealStateVO;
import kr.hs.emirimmeal.model.vo.StudentMealStateVO2;
import kr.hs.emirimmeal.model.vo.StudentMealStateVO3;
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
	public void updateSaved(StudentMealStateVO vo) {
		sqlsession.update("studentMeal.updateSaved", vo);
	}

	@Override
	public List<StudentMealStateVO2> checkDailyStudent() {
		return sqlsession.selectList("studentMeal.daily");
	}
	
	@Override
	public List<StudentMealStateVO3> checkDailyCnt() {
		return sqlsession.selectList("studentMeal.cnt");
	}

}
