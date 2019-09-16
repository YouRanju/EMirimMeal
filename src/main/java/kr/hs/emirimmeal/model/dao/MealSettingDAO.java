package kr.hs.emirimmeal.model.dao;

import kr.hs.emirimmeal.model.vo.MealSettingVO;

public interface MealSettingDAO {
	public MealSettingVO viewMealSetting();
	public void settingModify(MealSettingVO vo);
}
