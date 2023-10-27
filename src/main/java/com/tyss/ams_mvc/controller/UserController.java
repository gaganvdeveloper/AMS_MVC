package com.tyss.ams_mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tyss.ams_mvc.entity.User;
import com.tyss.ams_mvc.serviceimp.UserServiceImp;
import com.tyss.ams_mvc.util.UserRole;

@Controller
public class UserController {

	@Autowired
	private UserServiceImp userServiceImp;

	@RequestMapping(value = "/userlogin", method = RequestMethod.GET)
	public ModelAndView gotoSaveUser(ModelAndView mv) {
		mv.setViewName("userlogin");
		return mv;
	}

	@RequestMapping(value = "/userloginvalidate")
	public ModelAndView userVerification(HttpServletRequest req, ModelAndView mv) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		User user = (User) req;
		if (user != null && user.getUserRole() == UserRole.valueOf("TRAINER")) {
			mv.setViewName("trainerhome");
			mv.addObject("user", user);
			return mv;
		}
		if (user != null && user.getUserRole() == UserRole.valueOf("HR")) {
			mv.setViewName("hrhome");
			mv.addObject("user", user);
			return mv;
		}
		if (user != null && user.getUserRole() == UserRole.valueOf("ADMIN")) {
			mv.setViewName("adminhome");
			mv.addObject("user", user);
			return mv;
		}
		mv.setViewName("login");
		mv.addObject("user", user);
		return mv;
	}

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView gotosaveUser(User user, ModelAndView mv) {
		mv.addObject(user);
		mv.setViewName("userregister");
		return mv;
	}

	@RequestMapping(value = "/saveuser", method = RequestMethod.POST)
	public ModelAndView saveUser(@ModelAttribute User user, ModelAndView mv) {
		userServiceImp.saveUser(user);
		mv.addObject("msg", "User Created Successfully    User Name : " + user.getName());
		mv.setViewName("trainerhome");
		return mv;
	}

	@RequestMapping(value = "/updatetrainer")
	public ModelAndView updateUser(ModelAndView mv, HttpServletRequest req) {
		User user = userServiceImp.findUserById(Integer.parseInt(req.getParameter("id")));
		if (user != null) {
			mv.addObject(user);
			mv.setViewName("trainerupdate");
			return mv;
		}
		mv.addObject("msg", "Invalid User Id Can't Update...");
		mv.setViewName("trainerhome");
		return mv;
	}

}
