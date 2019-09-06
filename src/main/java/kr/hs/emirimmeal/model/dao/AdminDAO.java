package kr.hs.emirimmeal.model.dao;

import java.util.List;

import kr.hs.emirimmeal.model.vo.AdminVO;

public interface AdminDAO {
	public List<AdminVO> AdminList();
	public boolean loginCheck(AdminVO vo);
	public AdminVO viewAdmin(AdminVO vo);
}
