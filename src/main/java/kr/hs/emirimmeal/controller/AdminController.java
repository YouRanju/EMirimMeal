package kr.hs.emirimmeal.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.hs.emirimmeal.model.vo.AdminVO;
import kr.hs.emirimmeal.model.vo.StudentVO;
import kr.hs.emirimmeal.service.AdminService;
import kr.hs.emirimmeal.service.StudentService;

@Controller
public class AdminController {
	@Inject
	AdminService adminService;
	
	@RequestMapping("/aLogin")
	public String aLogin() {
		return "aLogin";
	}
	
	@RequestMapping(value="/aLoginCheck")
	public ModelAndView loginCheck(@ModelAttribute AdminVO vo, HttpSession session) {
		boolean result = adminService.loginCheck(vo, session);
		
		ModelAndView mav = new ModelAndView();
		
		if(result) {
			mav.addObject("msg", "성공");
			mav.setViewName("/aLogin");
		} else {
			mav.addObject("msg", "실패");
			mav.setViewName("/aLogin");
		}
		
		return mav;
	}
}
