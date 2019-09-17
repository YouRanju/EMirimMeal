package kr.hs.emirimmeal.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.hs.emirimmeal.model.vo.AdminVO;
import kr.hs.emirimmeal.model.vo.MealSettingVO;
import kr.hs.emirimmeal.model.vo.StudentMealStateVO;
import kr.hs.emirimmeal.model.vo.StudentMealStateVO2;
import kr.hs.emirimmeal.model.vo.StudentMealStateVO3;
import kr.hs.emirimmeal.model.vo.StudentVO;
import kr.hs.emirimmeal.service.AdminService;
import kr.hs.emirimmeal.service.MealSettingService;
import kr.hs.emirimmeal.service.StudentMealStateService;
import kr.hs.emirimmeal.service.StudentService;

@Controller
public class AdminController {
	@Inject
	AdminService adminService;
	
	@Inject
	StudentService studentService;
	
	@Inject
	MealSettingService mealSettingService;
	
	@Inject
	StudentMealStateService stateService;
	
	@RequestMapping("/adminLogin")
	public String aLogin(HttpSession session) {
		session.invalidate();
		
		return "aLogin";
	}
	
	@RequestMapping("/adminMenu")
	public String notLogin(HttpSession session) {
		if(session.getAttribute("isLogin") != "true") {
			return "redirect:/adminLogin";
		}

		return "adminMenu";
		
	}
	
	@RequestMapping(value="/adminMenu", method = RequestMethod.POST)
	public ModelAndView loginCheck(@ModelAttribute AdminVO vo, HttpSession session) {
		boolean result = adminService.loginCheck(vo, session);
		
		ModelAndView mav = new ModelAndView();
		
		if(result) {
			mav.addObject("msg", "성공");
			session.setAttribute("isLogin", "true");
			mav.setViewName("/adminMenu");
		} else {
			mav.addObject("msg", "실패");
			mav.setViewName("/aLogin");
		}
		
		return mav;
	}
	
	@RequestMapping(value="/studentInfo")
	public String studentInfo(Model m, HttpSession session) {
		if(session.getAttribute("isLogin") != "true") {
			return "redirect:/adminLogin";
		}
	
		List<StudentVO> list = studentService.studentList();
		m.addAttribute("list", list);
		
		return "adminStudentInfo";
	}
	
	@RequestMapping("/studentModify")
	public String StudentModify(@ModelAttribute StudentVO vo) {
		studentService.updateStudent(vo);
		
		return "redirect:/studentInfo";
	}
	
	@RequestMapping("/studentModify/{no}")
	public String StudentModify(@PathVariable("no") int no, Model m, HttpSession session) {
		if(session.getAttribute("isLogin") != "true") {
			return "redirect:/adminLogin";
		}
		
		StudentVO student = studentService.modifyStudent(no);
		m.addAttribute("student", student);
		
		return "studentModify";
	}
	
	@RequestMapping(value="/mealSetting")
	public String mealSetting(Model m, HttpSession session) {
		if(session.getAttribute("isLogin") != "true") {
			return "redirect:/adminLogin";
		}
		
		MealSettingVO setting = mealSettingService.viewMealSetting();
		m.addAttribute("setting", setting);
		
		return "adminMealSetting";
	}
	
	@RequestMapping(value="/settingModify", method = RequestMethod.POST)
	public String settingModify(@ModelAttribute MealSettingVO vo) {
		mealSettingService.settingModify(vo);
		
		return "redirect:/mealSetting";
	}
	
	@RequestMapping(value="/checkDailyStudent")
	public String checkDailyStudent(Model m) {
		List<StudentMealStateVO2> list = stateService.checkDailyStudent();
		List<StudentMealStateVO3> cnt = stateService.checkDailyCnt();
		
		m.addAttribute("list", list);
		m.addAttribute("cnt", cnt);
		
		return "checkDailyStudent";
	}
}
