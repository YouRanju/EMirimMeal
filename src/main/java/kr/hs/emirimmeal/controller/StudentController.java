package kr.hs.emirimmeal.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.hs.emirimmeal.model.vo.StudentVO;
import kr.hs.emirimmeal.service.StudentService;

@Controller
public class StudentController {
	@Inject
	StudentService studentService;
	
	@RequestMapping("/index")
	public String index(Model m) {
		List<StudentVO> list = studentService.studentList();
		m.addAttribute("list", list);
		
		return "index";
	}
	
	@RequestMapping(value="/sLoginCheck")
	public ModelAndView loginCheck(@ModelAttribute StudentVO vo, HttpSession session) {
		boolean result = studentService.loginCheck(vo, session);
		
		ModelAndView mav = new ModelAndView();
		
		if(result) {
			mav.addObject("msg", "성공");
			mav.setViewName("/studentMeal");
		} else {
			mav.addObject("msg", "실패");
			mav.setViewName("/index");
		}
		
		return mav;
	}
}
