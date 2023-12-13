package com.tyss.ams_mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;

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

import com.tyss.ams_mvc.entity.Batch;
import com.tyss.ams_mvc.entity.User;
import com.tyss.ams_mvc.service.BatchService;
import com.tyss.ams_mvc.service.UserService;
import com.tyss.ams_mvc.util.BatchStatus;
import com.tyss.ams_mvc.util.UserRole;

@Controller
//@SessionAttributes("user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private BatchService batchService;

	public boolean isSessionPresent(HttpServletRequest req) {
		User user = (User) req.getSession().getAttribute("user");
		System.out.println(user);
		if (user == null)
			return false;
		return true;
	}

	@RequestMapping(value = "/adminhome")
	public ModelAndView gotoAdminHome(HttpServletRequest req, ModelAndView mv) {
		mv.setViewName("createtimesheet");
		mv.addObject("user", (User) req.getSession().getAttribute("user"));
		return mv;
	}

	@RequestMapping(value = "/userlogin")
	public ModelAndView gotoUserLogin(ModelAndView mv) {
		mv.setViewName("login");
		return mv;
	}

	@RequestMapping(value = "/userloginvalidate", method = RequestMethod.POST)
	public ModelAndView userVerification(HttpServletRequest req, ModelAndView mv) {
		User user = userService.findUserByEmailAndPassword(req.getParameter("email"), req.getParameter("password"));
		if (user == null) {
			mv.setViewName("login");
			mv.addObject("msg", "Invalid Credentials");
			return mv;
		}
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		if (user.getUserRole().equals(UserRole.valueOf("TRAINER"))) {
			mv.setViewName("trainerhome");
			mv.addObject("msg", " Login Successfull..." + user.getName());
			mv.addObject("user", user);
			return mv;
		}
		if (user.getUserRole().equals(UserRole.valueOf("HR"))) {
			mv.setViewName("hrhome");
			mv.addObject("msg", " Login Successfull..." + user.getName());
			mv.addObject("user", user);
			return mv;
		}
		if (user.getUserRole().equals(UserRole.valueOf("ADMIN"))) {
			mv.setViewName("adminhome");
			mv.addObject("msg", " Login Successfull..." + user.getName());
			mv.addObject("user", user);
			return mv;
		}
		mv.setViewName("login");
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
			mv.addObject("user", user);
			return mv;
		}
		if (user.getUserRole().equals(UserRole.valueOf("HR"))) {
			mv.addObject("users", userService.findAllActiveUsers());
			mv.setViewName("hrhome");
			mv.addObject("user", user);
			return mv;
		}
		if (user.getUserRole().equals(UserRole.valueOf("ADMIN"))) {
			mv.setViewName("adminhome");
			mv.addObject("user", user);
			return mv;
		}
		mv.setViewName("login");
		mv.addObject("user", user);
		return mv;
	}

	@RequestMapping(value = "/hrhome")
	public ModelAndView gotoHrHomePage(ModelAndView mv, HttpServletRequest req) {
		System.out.println(req.getSession().getAttribute("user"));
		if (!isSessionPresent(req)) {
			System.out.println("Hiiiiiiiiiiii");
			mv.addObject("msg", "Session Time Out...");
			mv.setViewName("login");
			return mv;
		}
		User user = (User) req.getSession().getAttribute("user");
		mv.addObject("user", user);
		mv.addObject("msg", "Welcome Back " + user.getName());
		mv.setViewName("hrhome");
		return mv;
	}

	@RequestMapping(value = "/trainerhome")
	public ModelAndView gotoTrainerHomePage(ModelAndView mv, HttpServletRequest req) {
		System.out.println(req.getSession().getAttribute("user"));
		if (!isSessionPresent(req)) {
			System.out.println("Hiiiiiiiiiiii");
			mv.addObject("msg", "Session Time Out...");
			mv.setViewName("login");
			return mv;
		}
		User user = (User) req.getSession().getAttribute("user");
		mv.addObject("user", user);
		mv.addObject("msg", "Welcome Back " + user.getName());
		mv.setViewName("trainerhome");
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
		mv.setViewName("allemployees");
		return findAllUsers(mv);
	}

	@RequestMapping(value = "/updateuser")
	public ModelAndView gotoUpdateUser(ModelAndView mv, HttpServletRequest req) {
		User user = userService.findUserById(Integer.parseInt(req.getParameter("id")));
		if (user != null) {
			mv.addObject("user", (User) req.getSession().getAttribute("user"));
			mv.addObject("user1", user);
			mv.setViewName("updateuser");
			return mv;
		}
		mv.addObject("msg", "Unable To Update User with Invalid User ID");
		mv.setViewName("allemployees");
		return findAllUsers(mv);
	}

	@RequestMapping(value = "/updateuserupdate")
	public ModelAndView updateUser(@ModelAttribute User user, ModelAndView mv, HttpServletRequest req) {
		User exestingUser = userService.findUserById(user.getUserId());
		user.setBatchs(exestingUser.getBatchs());
		user.setTimeSheets(exestingUser.getTimeSheets());
		user = userService.updateUser(user);
		mv.addObject("user1", user);
		mv.addObject("user", req.getSession().getAttribute("user"));
		mv.addObject("msg", user.getUserRole() + " Updated Successfully...");
		mv.setViewName("userdetails");
		return userDetails(mv, user);
	}

	@RequestMapping(value = "/deleteuser")
	public ModelAndView deleteUser(ModelAndView mv, HttpServletRequest req) {
		if (userService.setUserStatusToInActive(Integer.parseInt(req.getParameter("id"))) != null) {
			mv.addObject("msg", "User Deleted Successfully...");
			mv.setViewName("allemployees");
			return findAllActiveUsers(mv);
		}
		mv.addObject("msg", "Unable to Delete User...");
		mv.setViewName("allemployees");
		return findAllActiveUsers(mv);
	}

	public ModelAndView findAllUsers(ModelAndView mv) {
		mv.addObject("users", userService.findAllUsers());
		return mv;
	}

	@RequestMapping(value = "/allemployees")
	public ModelAndView findAllEmployees(ModelAndView mv, HttpServletRequest req) {
		if (!isSessionPresent(req)) {
			mv.addObject("msg", "Session Time Out...");
			mv.setViewName("login");
			return mv;
		}
		mv.addObject("user", (User) req.getSession().getAttribute("user"));
		mv.addObject("users", userService.findAllUsers());
		mv.addObject("msg", "All Employees Found Successfully...");
		mv.setViewName("allemployees");
		return mv;
	}

	@RequestMapping(value = "/allemployee")
	public ModelAndView findAllUsers(ModelAndView mv, HttpServletRequest req) {
		mv.setViewName("allemployees");
		mv.addObject("users", userService.findAllUsers());
		mv.addObject("msg", "All Employees Found Successfully...");
		return mv;
	}

	@RequestMapping(value = "/activeemployee")
	public ModelAndView findAllActiveUsers(ModelAndView mv, HttpServletRequest req) {
		mv.setViewName("allemployees");
		mv.addObject("users", userService.findAllActiveUsers());
		mv.addObject("msg", "All ACTIVE Employees Found Successfully...");
		return mv;
	}

	public ModelAndView findAllActiveUsers(ModelAndView mv) {
		mv.addObject("users", userService.findAllActiveUsers());
		mv.addObject("msg", "All ACTIVE Employees Found Successfully...");
		return mv;
	}

	@RequestMapping(value = "/inactivemployee")
	public ModelAndView findAllInActiveUsers(ModelAndView mv, HttpServletRequest req) {
		mv.addObject("user", req.getSession().getAttribute("user"));
		mv.setViewName("allemployees");
		mv.addObject("users", userService.findAllInActiveUsers());
		mv.addObject("msg", "All IN_ACTIVE Employees Found Successfully...");
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
			mv.addObject("user", (User) req.getSession().getAttribute("user"));
			mv.addObject("user1", user);
			try {
				mv.addObject("completedbatchs", user.getBatchs().stream()
						.filter(b -> b.getBatchStatus().toString().equals("COMPLETED")).collect(Collectors.toList()));
				mv.addObject("ongoingbatchs", user.getBatchs().stream()
						.filter(b -> b.getBatchStatus().toString().equals("ON_GOING")).collect(Collectors.toList()));
			} catch (Exception e) {
				mv.setViewName("userdetails");
				return mv;
			}
			mv.setViewName("userdetails");
			return mv;
		}
		mv.addObject("msg", "Unable to View User Details");
		mv.setViewName("allemployees");
		return findAllActiveUsers(mv);
	}
	

	public ModelAndView userDetails(ModelAndView mv, User user) {
		List<Batch> batchs1 = batchService.findAllBatchsOfAUserById(user.getUserId());
		try {
			mv.addObject("completedbatchs", batchs1.stream()
					.filter(b -> b.getBatchStatus().toString().equals("COMPLETED")).collect(Collectors.toList()));
			mv.addObject("ongoingbatchs", batchs1.stream()
					.filter(b -> b.getBatchStatus().toString().equals("ON_GOING")).collect(Collectors.toList()));
		} catch (Exception e) {
			mv.addObject("msg", "Session Time Out");
			mv.setViewName("login");
			return mv;
		}
		mv.setViewName("userdetails");
		return mv;
	}

	@RequestMapping(value = "/updateprofilepic")
	public ModelAndView updateProfilePic(ModelAndView mv, HttpServletRequest req) {
		mv.addObject("user1", userService.findUserById(Integer.parseInt(req.getParameter("id"))));
		mv.setViewName("uploadprofilepic");
		return mv;
	}

	@RequestMapping(value = "/uploadprofilepic", method = RequestMethod.POST)
	public ModelAndView uploadProfilePic(HttpServletRequest req, ModelAndView mv,
			@RequestParam("file") MultipartFile file) throws IOException, ServletException {
		
		User user = userService.findUserById(Integer.parseInt(req.getParameter("id")));
		
		user.setImg(Base64.getEncoder().encodeToString(file.getBytes()));
		userService.updateUser(user);
		mv.addObject("msg", "Profile Picture Added Successfully...");
		mv.setViewName("userdetails");
		return userVerification(mv, (User) req.getSession().getAttribute("user"));
	}

	@RequestMapping(value = "/assignbatchtouser")
	public ModelAndView gotoAssignBatchUser(ModelAndView mv, HttpServletRequest req) {
		User user1 = userService.findUserById(Integer.parseInt(req.getParameter("id")));
		mv.addObject("batchs", batchService.findAllNotAssignedBatches());
		mv.addObject("user1", user1);
		mv.addObject("user", (User) req.getSession().getAttribute("user"));
		mv.addObject("msg", "Assing a Batch To " + user1.getName());
		mv.setViewName("assignbatchtouser");
		return mv;
	}

	@RequestMapping(value = "/assignbatch")
	public ModelAndView assignBatchToUser(ModelAndView mv, HttpServletRequest req) {
		Batch batch = batchService.findBatchById(Integer.parseInt(req.getParameter("id")));
		User user1 = userService.findUserById(Integer.parseInt(req.getParameter("user1id")));
		batch.setUser(user1);
		batch.setBatchStatus(BatchStatus.valueOf("ON_GOING"));
		List<Batch> batchs = user1.getBatchs();
		try{
			batchs.add(batch);
		} catch(Exception e) {
			batchs = new ArrayList<>();
			batchs.add(batch);
		}
		user1.setBatchs(batchs);
		batch = batchService.updateBatch(batch);
		user1 = userService.updateUser(user1);
		mv.addObject("msg", batch.getSubjectName() + " Batch Assigned to " + user1.getName());
		mv.addObject("user1", user1);
		mv.addObject("batchs", batchs);
		mv.addObject("user", (User) req.getSession().getAttribute("user"));
		mv.setViewName("userdetails");
		return userDetails(mv, user1);
	}
	
	@RequestMapping(value = "/markbatchcompleted")
	public ModelAndView markBarchCompleted(HttpServletRequest req, ModelAndView mv) {
		Batch batch = batchService.findBatchById(Integer.parseInt(req.getParameter("id")));
		batch.setBatchStatus(BatchStatus.valueOf("COMPLETED"));
		batchService.updateBatch(batch);
		User user1 = batch.getUser();
		mv.addObject("msg", batch.getSubjectName() + " Batch Status Updated to COMPLETED");
		mv.addObject("user1", user1);
		mv.addObject("batchs", batch.getUser().getBatchs());
		mv.addObject("user", (User) req.getSession().getAttribute("user"));
		mv.setViewName("userdetails");
		return userDetails(mv, user1);
	}
	
	
}
