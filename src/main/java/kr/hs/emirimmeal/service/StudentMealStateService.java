package kr.hs.emirimmeal.service;

import java.util.List;

import kr.hs.emirimmeal.model.vo.StudentMealStateVO;
import kr.hs.emirimmeal.model.vo.StudentMealStateVO2;
import kr.hs.emirimmeal.model.vo.StudentMealStateVO3;
import kr.hs.emirimmeal.model.vo.StudentVO;

public interface StudentMealStateService {
	public StudentMealStateVO viewState(StudentVO vo);
	public StudentMealStateVO viewState(int no);
	public void updateState(StudentMealStateVO vo);
	public boolean checkSaved(int no);
	public void updateSaved(StudentMealStateVO vo);
	
	public List<StudentMealStateVO2> checkDailyStudent();
	public List<StudentMealStateVO3> checkDailyCnt();
}
