package kr.hs.emirimmeal.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.hs.emirimmeal.model.vo.AdminVO;

public interface AdminService {
	public List<AdminVO> AdminList();
	public boolean loginCheck(AdminVO vo, HttpSession session);
	public AdminVO viewAdmin(AdminVO vo);
}
