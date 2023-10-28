package com.tyss.ams_mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
//@SessionAttributes("user")
public class UserController {

	@Autowired

	private UserService userService;

	@RequestMapping(value = "/userlogin")
	public ModelAndView gotoUserLogin(ModelAndView mv) {
		mv.setViewName("login");
		return mv;
	}

	@RequestMapping(value = "/userloginvalidate", method = RequestMethod.GET)
	public ModelAndView userVerification(HttpServletRequest req, ModelAndView mv) {
		User user = userService.findUserByEmailAndPassword(req.getParameter("email"), req.getParameter("password"));
		if (user == null) {
			mv.setViewName("login");
			mv.addObject("msg", "Login Failed");
			return mv;
		}
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		if (user.getUserRole().equals(UserRole.valueOf("TRAINER"))) {
			mv.setViewName("trainerhome");
			mv.addObject("msg", " Login Successfull...");
			mv.addObject("user", user);
			return mv;
		}
		if (user.getUserRole().equals(UserRole.valueOf("HR"))) {
			List<User> users = userService.findAllUsers();
			mv.addObject("users", users);
			mv.setViewName("hrhome");
			mv.addObject("msg", " Login Successfull...");
			mv.addObject("user", user);
			return mv;
		}
		if (user.getUserRole().equals(UserRole.valueOf("ADMIN"))) {
			mv.setViewName("adminhome");
			mv.addObject("msg", " Login Successfull...");
			mv.addObject("user", user);
			return mv;
		}
		mv.setViewName("login");
		mv.addObject("user", user);
		return mv;
	}

	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView gotosaveUser(User user, ModelAndView mv) {
		mv.addObject("user", user);
		mv.setViewName("userregister");
		return mv;
	}

	@RequestMapping(value = "/saveuser", method = RequestMethod.POST)
	public ModelAndView saveUser(@ModelAttribute User user, ModelAndView mv, HttpServletRequest req) {
		mv.addObject("user", req.getSession().getAttribute("user"));
		userService.saveUser(user);
		mv.setViewName("hrhome");
		return findAllUsers(mv);
	}

	@RequestMapping(value = "/updateuser")
	public ModelAndView gotoUpdateUser(ModelAndView mv, HttpServletRequest req) {
		User user = userService.findUserById(Integer.parseInt(req.getParameter("id")));
		if (user != null) {
			mv.addObject("user", user);
			mv.setViewName("updateuser");
			return mv;
		}
		mv.addObject("msg", "Unable To Update User with Invalid User ID");
		mv.setViewName("hrhome");
		return findAllUsers(mv);
	}

	@RequestMapping(value = "/updateuserupdate")
	public ModelAndView updateUser(@ModelAttribute User user, ModelAndView mv, HttpServletRequest req) {
		userService.updateUser(user);
		mv.addObject("user", req.getSession().getAttribute("user"));
		mv.addObject("msg", user.getUserRole() + " Updated Successfully...");
		mv.setViewName("hrhome");
		return findAllUsers(mv);
	}

	@RequestMapping(value = "/deleteuser")
	public ModelAndView deleteUser(ModelAndView mv, HttpServletRequest req) {
		if (userService.deleteUserById(Integer.parseInt(req.getParameter("id")))) {
			mv.addObject("msg", "User Deleted Successfully...");
			mv.setViewName("hrhome");
			return findAllUsers(mv);
		}
		mv.addObject("msg", "Unable to Delete User...");
		mv.setViewName("hrhome");
		return findAllUsers(mv);
	}

	public ModelAndView findAllUsers(ModelAndView mv) {
		mv.addObject("users", userService.findAllUsers());
		return mv;
	}

	@RequestMapping(value = "/logout")
	public ModelAndView userLogout(ModelAndView mv, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		mv.addObject("msg", "Logout Successfull...");
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping(value = "/login")
	public ModelAndView userLogin(ModelAndView mv, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping(value = "/userdetails")
	public ModelAndView userDetails(ModelAndView mv, HttpServletRequest req) {
		User user = userService.findUserById(Integer.parseInt(req.getParameter("id")));
		if (user != null) {
			mv.addObject("msg", "User details Found");
			mv.addObject("user",user);
			mv.setViewName("userdetails");
			return mv;
		}
		mv.addObject("msg","Unable to find User Details");
		mv.setViewName("hrhome");
		return mv;
	}

}
