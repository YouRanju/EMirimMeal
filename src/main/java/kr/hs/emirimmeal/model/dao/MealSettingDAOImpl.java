package kr.hs.emirimmeal.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.hs.emirimmeal.model.vo.MealSettingVO;

@Repository
public class MealSettingDAOImpl implements MealSettingDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public MealSettingVO viewMealSetting() {
		return sqlsession.selectOne("mealset.setlist");
	}

	@Override
	public void settingModify(MealSettingVO vo) {
		sqlsession.update("mealset.updatesetting", vo);
	}
}