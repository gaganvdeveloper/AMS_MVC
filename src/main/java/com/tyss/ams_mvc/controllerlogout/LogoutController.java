package com.tyss.ams_mvc.controllerlogout;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LogoutController {
	
	
	
	
	@RequestMapping(value = "/logout")
	public ModelAndView userLogout(ModelAndView mv, HttpServletRequest req) {
		HttpSession session = req.getSession();
		System.out.println("Logout Successfull...1");
		System.out.println("Logout Successfull...2");
		System.out.println("Logout Successfull...3");
		session.invalidate();
		mv.addObject("msg", "Logout Successfull...");
		mv.setViewName("login");
		return mv;
	}
	
	
	
}
