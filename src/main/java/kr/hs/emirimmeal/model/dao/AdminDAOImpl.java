package kr.hs.emirimmeal.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.hs.emirimmeal.model.vo.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<AdminVO> AdminList() {
		return sqlsession.selectList("admin.adminList");
	}

	@Override
	public boolean loginCheck(AdminVO vo) {
		String name = sqlsession.selectOne("admin.loginCheck", vo);
		return (name==null) ? false : true;
	}

	@Override
	public AdminVO viewAdmin(AdminVO vo) {
		return sqlsession.selectOne("admin.viewAdmin", vo);
	}

}
