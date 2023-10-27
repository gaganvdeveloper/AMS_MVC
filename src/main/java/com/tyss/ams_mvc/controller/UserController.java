package com.tyss.ams_mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tyss.ams_mvc.entity.User;
import com.tyss.ams_mvc.service.UserService;
import com.tyss.ams_mvc.util.UserRole;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@RequestMapping(value = "/userlogin", method = RequestMethod.GET)
	public ModelAndView gotoSaveUser(ModelAndView mv) {
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping(value = "/userloginvalidate" , method = RequestMethod.GET)
	public ModelAndView userVerification(HttpServletRequest req, ModelAndView mv) {
		User user = userService.findUserByEmailAndPassword(req.getParameter("email"), req.getParameter("password"));
		if(user == null) {
			mv.setViewName("login");
			mv.addObject("msg","Login Failed");
			return mv;
		}
		if(user.getUserRole().equals(UserRole.valueOf("TRAINER")) ) {
			mv.setViewName("trainerhome");
			mv.addObject("msg","Mr."+user.getName()+" Login Successfull...");
			mv.addObject("user",user);
			return mv;
		}	
		if(user.getUserRole().equals(UserRole.valueOf("HR")) ) {
			mv.setViewName("hrhome");
			mv.addObject("msg","Mr."+user.getName()+" Login Successfull...");
			mv.addObject("user",user);
			return mv;
		}
		if(user.getUserRole().equals(UserRole.valueOf("ADMIN")) ) {
			mv.setViewName("adminhome");
			mv.addObject("msg","Mr."+user.getName()+" Login Successfull...");
			mv.addObject("user",user);
			return mv;
		}
		mv.setViewName("login");
		mv.addObject("user",user);
		return mv;
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView gotosaveUser(User user,ModelAndView mv) {
		mv.addObject(user);
		mv.setViewName("userregister");
		return mv;
	}
	
	@RequestMapping(value = "/saveuser",method =RequestMethod.POST)
	public ModelAndView saveUser(@ModelAttribute User user,ModelAndView mv) {
		userService.saveUser(user);
		mv.addObject("msg","User Created Successfully    User Name : "+user.getName());
		mv.setViewName("trainerhome");
		return mv;
	}
	
	
	
	

}
