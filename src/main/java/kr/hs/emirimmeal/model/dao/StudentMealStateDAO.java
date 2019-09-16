package kr.hs.emirimmeal.model.dao;

import kr.hs.emirimmeal.model.vo.StudentMealStateVO;
import kr.hs.emirimmeal.model.vo.StudentVO;

public interface StudentMealStateDAO {
	public StudentMealStateVO viewState(StudentVO vo);
	public StudentMealStateVO viewState(int no);
	public void updateState(StudentMealStateVO vo);
	public String checkSaved(int no);
	public void updateSaved(int no);
}
