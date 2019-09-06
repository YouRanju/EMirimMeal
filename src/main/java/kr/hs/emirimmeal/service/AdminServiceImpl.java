package kr.hs.emirimmeal.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import kr.hs.emirimmeal.model.dao.AdminDAO;
import kr.hs.emirimmeal.model.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	AdminDAO admindao;
	
	@Override
	public List<AdminVO> AdminList() {
		return admindao.AdminList();
	}

	@Override
	public boolean loginCheck(AdminVO vo, HttpSession session) {
		boolean result = admindao.loginCheck(vo);
		if(result) {
			AdminVO vo2 = viewAdmin(vo);
			session.setAttribute("adminid", vo2.getAdminid());
			session.setAttribute("adminpw", vo2.getAdminpw());
		}
		
		return result;
	}
	
	@Override
	public AdminVO viewAdmin(AdminVO vo) {
		return admindao.viewAdmin(vo);
	}
}
