package com.tyss.ams_mvc.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
			mv.addObject("users", userService.findAllActiveUsers());
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
	
	public ModelAndView userVerification(ModelAndView mv, User user1) {
		User user = userService.findUserByEmailAndPassword(user1.getEmail(), user1.getPassword());
		if (user == null) {
			mv.setViewName("login");
			mv.addObject("msg", "Login Failed");
			return mv;
		}
		if (user.getUserRole().equals(UserRole.valueOf("TRAINER"))) {
			mv.setViewName("trainerhome");
//			mv.addObject("msg", " Login Successfull...");
			mv.addObject("user", user);
			return mv;
		}
		if (user.getUserRole().equals(UserRole.valueOf("HR"))) {
			mv.addObject("users", userService.findAllActiveUsers());
			mv.setViewName("hrhome");
//			mv.addObject("msg", " Login Successfull...");
			mv.addObject("user", user);
			return mv;
		}
		if (user.getUserRole().equals(UserRole.valueOf("ADMIN"))) {
			mv.setViewName("adminhome");
//			mv.addObject("msg", " Login Successfull...");
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
			mv.addObject("user", req.getSession().getAttribute("user"));
			mv.addObject("user1", user);
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
		mv.addObject("user1",user);
		mv.addObject("user", req.getSession().getAttribute("user"));
		mv.addObject("msg", user.getUserRole() + " Updated Successfully...");
		mv.setViewName("userdetails");
		return findAllActiveUsers(mv);
	}

	@RequestMapping(value = "/deleteuser")
	public ModelAndView deleteUser(ModelAndView mv, HttpServletRequest req) {
		if (userService.setUserStatusToInActive(Integer.parseInt(req.getParameter("id")))!=null) {
			mv.addObject("msg", "User Deleted Successfully...");
			mv.setViewName("hrhome");
			return findAllActiveUsers(mv);
		}
		mv.addObject("msg", "Unable to Delete User...");
		mv.setViewName("hrhome");
		return findAllActiveUsers(mv);
	}
	
	public ModelAndView findAllUsers(ModelAndView mv) {
		mv.addObject("users", userService.findAllUsers());
		return mv;
	}
	
	
	
	@RequestMapping(value = "/allemployee")
	public ModelAndView findAllUsers(ModelAndView mv,HttpServletRequest req) {
		mv.setViewName("hrhome");
		mv.addObject("users", userService.findAllUsers());
		mv.addObject("msg", "All Employees Found Successfully...");
		return mv;
	}
	
	@RequestMapping(value = "/activeemployee")
	public ModelAndView findAllActiveUsers(ModelAndView mv,HttpServletRequest req) {
		mv.setViewName("hrhome");
		mv.addObject("users", userService.findAllActiveUsers());
		mv.addObject("msg", "All ACTIVE Employees Found Successfully...");
		return mv;
	}
	public ModelAndView findAllActiveUsers(ModelAndView mv) {
//		mv.setViewName("hrhome");
		mv.addObject("users", userService.findAllActiveUsers());
		mv.addObject("msg", "All ACTIVE Employees Found Successfully...");
		return mv;
	}
	
	@RequestMapping(value = "/inactivemployee")
	public ModelAndView findAllInActiveUsers(ModelAndView mv,HttpServletRequest req) {
		mv.addObject("user",req.getSession().getAttribute("user"));
		mv.setViewName("hrhome");
		mv.addObject("users", userService.findAllInActiveUsers());
		mv.addObject("msg", "All IN_ACTIVE Employees Found Successfully...");
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
			mv.addObject("user",(User)req.getSession().getAttribute("user"));
			mv.addObject("user1",user);
			mv.setViewName("userdetails");
			return mv;
		}
		mv.addObject("msg","Unable to View User Details");
		mv.setViewName("hrhome");
		return findAllActiveUsers(mv);
	}
	
	@RequestMapping(value = "/updateprofilepic")
	public ModelAndView updateProfilePic(ModelAndView mv,HttpServletRequest req) {
		mv.addObject("user1", userService.findUserById(Integer.parseInt(req.getParameter("id"))));
		mv.setViewName("uploadprofilepic");
		return mv;
	}
	

	@RequestMapping(value = "/uploadprofilepic", method = RequestMethod.POST)
	public ModelAndView uploadProfilePic(HttpServletRequest req,ModelAndView mv, @RequestParam("file") MultipartFile file) throws IOException, ServletException {
		User user = userService.findUserById(Integer.parseInt(req.getParameter("id")));
		user.setImg(Base64.getEncoder().encodeToString(file.getBytes()));
		userService.updateUser(user);
		mv.addObject("msg","Profile Picture Added Successfully...");
		mv.setViewName("userdetails");
		return userVerification(mv, (User)req.getSession().getAttribute("user"));
//		return mv;
	}
}
