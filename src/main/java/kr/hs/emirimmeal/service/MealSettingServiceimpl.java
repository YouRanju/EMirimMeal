package kr.hs.emirimmeal.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.hs.emirimmeal.model.dao.MealSettingDAO;
import kr.hs.emirimmeal.model.vo.MealSettingVO;

@Service
public class MealSettingServiceimpl implements MealSettingService {

	@Inject
	MealSettingDAO mealSettingdao;
	
	@Override
	public MealSettingVO viewMealSetting() {
		return mealSettingdao.viewMealSetting();
	}

	@Override
	public void settingModify(MealSettingVO vo) {
		mealSettingdao.settingModify(vo);
	}
}
