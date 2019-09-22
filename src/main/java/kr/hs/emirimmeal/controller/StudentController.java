package kr.hs.emirimmeal.controller;

import java.util.Calendar;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.hs.emirimmeal.model.vo.MealSettingVO;
import kr.hs.emirimmeal.model.vo.StudentMealStateVO;
import kr.hs.emirimmeal.model.vo.StudentVO;
import kr.hs.emirimmeal.service.MealSettingService;
import kr.hs.emirimmeal.service.StudentMealStateService;
import kr.hs.emirimmeal.service.StudentService;

@Controller
public class StudentController {
	@Inject
	StudentService studentService;
	
	@Inject
	StudentMealStateService stateService;
	
	@Inject
	MealSettingService settingSevice;
	
	@RequestMapping("/index")
	public String index(HttpSession session) {
		session.invalidate();
		return "index";
	}

	@RequestMapping(value = "/studentMeal", method= RequestMethod.GET)
	public String notLogin(Model m, HttpSession session) {
		if(session.getAttribute("isLoginS") != "true") {
			return "redirect:/index";
		}
		
		StudentMealStateVO state = stateService.viewState(Integer.parseInt(session.getAttribute("no").toString()));
		MealSettingVO setting = settingSevice.viewMealSetting();
		
		m.addAttribute("state", state);
		m.addAttribute("setting", setting);
		
		
		return "studentMeal";
	}
	
	@RequestMapping(value = "/studentMeal", method = RequestMethod.POST)
	public ModelAndView loginCheck(@ModelAttribute StudentVO vo, HttpSession session) {
		boolean result = studentService.loginCheck(vo, session);
		StudentMealStateVO state = stateService.viewState(vo);
		MealSettingVO setting = settingSevice.viewMealSetting();

		session.setAttribute("isLoginS", "true");
		session.setAttribute("applydate", setting.getApplydate());
		
		Date d = new Date();

		if(setting.getStarttime().compareTo(d) > 0
			|| setting.getEndtime().compareTo(d) < 0) {
			state.setIssave("y");
		}
		
		ModelAndView mav = new ModelAndView();
		
		if(result) {
			mav.addObject("msg", "성공");
			mav.addObject("state", state);
			mav.addObject("setting", setting);
			mav.setViewName("/studentMeal");
		} else {
			mav.addObject("msg", "실패");
			mav.setViewName("/index");
		}
		
		return mav;
	}
	
	@RequestMapping("/studentMealApply")
	public String studentMealApply(Model m, HttpSession session) {
		StudentMealStateVO state = stateService.viewState(Integer.parseInt(session.getAttribute("no").toString()));
		StudentVO student = studentService.modifyStudent(Integer.parseInt(session.getAttribute("no").toString()));
		
		m.addAttribute("state", state);
		m.addAttribute("student", student);

		return "studentMealapply";
	}
	
	@RequestMapping("/studentMealApply/{no}/{checkMeal}")
	public String ModifyMealState(@PathVariable("no") int no, @PathVariable("checkMeal") String checkMeal) {
		StudentMealStateVO state = stateService.viewState(no);
		state.setCheckmeal(checkMeal);
		
		stateService.updateState(state);

		return "redirect:/studentMeal";
	}
	
	@RequestMapping("/save")
	public String saveState(@ModelAttribute StudentMealStateVO vo, HttpSession session) {
		stateService.updateSaved(vo);

		return "redirect:/studentMeal";
	}
}
