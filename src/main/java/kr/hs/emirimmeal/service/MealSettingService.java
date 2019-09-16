package kr.hs.emirimmeal.service;

import kr.hs.emirimmeal.model.vo.MealSettingVO;

public interface MealSettingService {
	public MealSettingVO viewMealSetting();
	public void settingModify(MealSettingVO vo);
	
	
}
