package kr.hs.emirimmeal.service;

import kr.hs.emirimmeal.model.vo.StudentMealStateVO;
import kr.hs.emirimmeal.model.vo.StudentVO;

public interface StudentMealStateService {
	public StudentMealStateVO viewState(StudentVO vo);
	public StudentMealStateVO viewState(int no);
	public void updateState(StudentMealStateVO vo);
	public boolean checkSaved(int no);
	public void updateSaved(int no);
}
