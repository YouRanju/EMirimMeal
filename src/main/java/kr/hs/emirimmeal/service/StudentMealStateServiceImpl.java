package kr.hs.emirimmeal.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.hs.emirimmeal.model.dao.StudentMealStateDAO;
import kr.hs.emirimmeal.model.vo.StudentMealStateVO;
import kr.hs.emirimmeal.model.vo.StudentVO;

@Service
public class StudentMealStateServiceImpl implements StudentMealStateService {

	@Inject
	StudentMealStateDAO statedao;
	
	@Override
	public StudentMealStateVO viewState(StudentVO vo) {
		// TODO Auto-generated method stub
		return statedao.viewState(vo);
	}

	@Override
	public StudentMealStateVO viewState(int no) {
		// TODO Auto-generated method stub
		return statedao.viewState(no);
	}

	@Override
	public void updateState(StudentMealStateVO vo) {
		statedao.updateState(vo);
		
	}

	@Override
	public boolean checkSaved(int no) {
		String result = statedao.checkSaved(no);
		
		if(result.equalsIgnoreCase("y")) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public void updateSaved(int no) {
		statedao.updateSaved(no);
	}

	
	
}
