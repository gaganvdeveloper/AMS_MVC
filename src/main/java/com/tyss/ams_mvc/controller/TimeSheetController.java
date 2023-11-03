package com.tyss.ams_mvc.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.tyss.ams_mvc.entity.TimeSheet;
import com.tyss.ams_mvc.entity.User;
import com.tyss.ams_mvc.service.TimeSheetService;
import com.tyss.ams_mvc.service.UserService;

@Controller
public class TimeSheetController {

	@Autowired
	TimeSheetService timeSheetService;
	@Autowired
	UserService userService;

	@GetMapping("/create")
	public ModelAndView createTimeSheet(TimeSheet timeSheet,
			@SessionAttribute(name = "user", required = false) User user, ModelAndView mv) {
		if (user != null) {
			try {
				timeSheet.setStart_date(LocalDate.now());
				TimeSheet sheet = timeSheetService.saveTimeSheet(timeSheet, user.getUserId());
				mv.addObject("msg", "timesheet saved successfully");
				mv.setViewName("trainerhome");
			} catch (Exception e) {
				e.printStackTrace();
				mv.addObject("msg", "timesheet already existed");
				mv.setViewName("trainerhome");
			}
		} else {
			mv.addObject("msg", "user not existed");
			mv.setViewName("login");
		}
		return mv;
	}

	@GetMapping("/display/user")
	public ModelAndView displayTimesheetByUserId(@SessionAttribute(name = "user", required = false) User user,
			ModelAndView mv, @RequestParam int id) {
		if (user != null) {
			mv.addObject("findAllTimeSheetOfUser", timeSheetService.findAllTimeSheetOfUser(id));
			mv.setViewName("displayTimeSheet");
		} else {
			mv.addObject("msg", "user not existed");
			mv.setViewName("login");
		}
		return mv;
	}

	@PostMapping("/update")
	public ModelAndView updateTimeSheet(@ModelAttribute TimeSheet timeSheet, ModelAndView mv) {
		TimeSheet sheet = timeSheetService.updateTimeSheet(timeSheet);
		if (sheet != null)
			mv.addObject("msg", "time sheet with id :'" + timeSheet.getTimesheetId() + "' has been updated ");
		else
			mv.addObject("msg", "time sheet with id :'" + timeSheet.getTimesheetId() + "' has not been updated ");
		mv.setViewName("displayTimeSheet");
		return mv;
	}

	@GetMapping("/ById")
	public ModelAndView findTimeSheetById(@RequestParam int id, ModelAndView mv) {
		TimeSheet timeSheet = timeSheetService.findTimeSheetById(id);
		mv.addObject("timeSheet", timeSheet);
		mv.setViewName("findTimeSheetbyId");
		return mv;
	}

	@RequestMapping("/delete")
	public ModelAndView deleteTimeSheetById(@RequestParam int id,
			@SessionAttribute(name = "user", required = false) User user, ModelAndView mv) {
		if (user != null) {
			try {
				timeSheetService.deleteTimeSheetById(id, user.getUserId());
				mv.addObject("msg", "time sheet with id :'" + id + "' deleted successfully");
			} catch (Exception e) {
				mv.addObject("msg", "time sheet with id :'" + id + "' got error while deleting ");
			}
			mv.setViewName("displayTimeSheet");
		} else {
			mv.addObject("msg", "user not existed");
			mv.setViewName("login");
		}
		return mv;
	}

	// not required
	@RequestMapping(value = "byYear/User", method = RequestMethod.GET)
	public ModelAndView findAllTimeSheetOfAYearOfUser(HttpServletRequest req, int year,
			@SessionAttribute(name = "user", required = false) User user, ModelAndView mv) {
		if (user != null) {
			mv.addObject("timeSheets", timeSheetService
					.findAllTimeSheetOfAYearOfUser(Integer.parseInt(req.getParameter("year")), user.getUserId()));
			mv.setViewName("findAllTimeSheetsOfAllUsers");
		} else {
			mv.addObject("msg", "user not existed");
			mv.setViewName("login");
		}
		return mv;
	}

	@RequestMapping(value = "byMonth/User", method = RequestMethod.GET)
	public ModelAndView findAllTimeSheetOfAMonthOfUser(HttpServletRequest req, String month, int year,
			@SessionAttribute(name = "user", required = false) User user, ModelAndView mv) {
		if (user != null) {
			mv.addObject("monthtimeSheet", timeSheetService.findTimeSheetByMonthNameOfUser(month,
					Integer.parseInt(req.getParameter("year")), Integer.parseInt(req.getParameter("id"))));
			mv.setViewName("user-ts-month");
			mv.addObject("month", month);
			mv.addObject("year", year);
			mv.addObject(mv);
		} else {
			mv.addObject("msg", "user not existed");
			mv.setViewName("login");
		}
		return mv;
	}

	@RequestMapping(value = "ByMon/All", method = RequestMethod.GET)
	public ModelAndView findTimeSheetByMonthNameOfAllEmployees(
			@SessionAttribute(name = "user", required = false) User user, HttpServletRequest req, ModelAndView mv) {
		if (user != null) {
			mv.addObject("timeSheets", timeSheetService.findTimeSheetByMonthNameOfAllEmployees(
					req.getParameter("month"), Integer.parseInt(req.getParameter("year"))));
			mv.addObject("month", req.getParameter("month"));
			mv.addObject("year", req.getParameter("year"));
			mv.setViewName("ts-all-monName");
		} else {
			mv.addObject("msg", "user not existed");
			mv.setViewName("login");
		}

		return mv;
	}

	@RequestMapping(value = "/custom-user", method = RequestMethod.GET)
	public ModelAndView findTimeSheetOfUserOnCustomDates(HttpServletRequest req, ModelAndView mv,
			@SessionAttribute(name = "user", required = false) User user) {
		if (user != null) {
			mv.addObject("timeSheets",
					timeSheetService.findTimeSheetOfUserOnCustomDates(req.getParameter("fMonth"),
							Integer.parseInt(req.getParameter("fYear")), req.getParameter("tMonth"),
							Integer.parseInt(req.getParameter("tYear")), Integer.parseInt(req.getParameter("id"))));
			mv.addObject("fMonth", req.getParameter("fMonth"));
			mv.addObject("fYear", req.getParameter("fYear"));
			mv.addObject("tMonth", req.getParameter("tMonth"));
			mv.addObject("tYear", req.getParameter("tYear"));
			mv.setViewName("user-ty-custom-dates");
		} else {
			mv.addObject("msg", "user not existed");
			mv.setViewName("login");
		}
		return mv;
	}

	@RequestMapping(value = "custom-All", method = RequestMethod.GET)
	public ModelAndView findTimeSheetOnCustomDates(HttpServletRequest req, ModelAndView mv,
			@SessionAttribute(name = "user", required = false) User user) {
		if (user != null) {
			mv.addObject("timeSheets",
					timeSheetService.findTimeSheetOnCustomDates(req.getParameter("fMonth"),
							Integer.parseInt(req.getParameter("fYear")), req.getParameter("tMonth"),
							Integer.parseInt(req.getParameter("tYear"))));
			mv.addObject("fMonth", req.getParameter("fMonth"));
			mv.addObject("fYear", req.getParameter("fYear"));
			mv.addObject("tMonth", req.getParameter("tMonth"));
			mv.addObject("tYear", req.getParameter("tYear"));
			mv.setViewName("ts-all-custom");
		} else {
			mv.addObject("msg", "user not existed");
			mv.setViewName("login");
		}

		return mv;
	}

	@RequestMapping(value = "/current", method = RequestMethod.GET)
	public ModelAndView fetchCurrentMonthTimeSheet(ModelAndView mv,
			@SessionAttribute(name = "user", required = false) User user) {
		if (user != null) {
			mv.addObject("timeSheets", timeSheetService.fetchCurrentMonthTimeSheet());
			mv.setViewName("current-all");
		} else {
			mv.addObject("msg", "user not existed");
			mv.setViewName("login");
		}
		return mv;
	}

	@RequestMapping(value = "/current-user", method = RequestMethod.GET)
	public ModelAndView fetchCurrentMonthTimeSheetofUser(ModelAndView mv,
			@SessionAttribute(name = "user", required = false) User user, @RequestParam(name = "userId") int id) {
		if (user != null) {
			mv.addObject("timeSheet", timeSheetService.fetchCurrentMonthTimeSheetofUser(id));
			mv.addObject("userId", id);
			if (user.getUserRole().equals("TRAINER")) {
				mv.addObject("userName", user.getName());
			} else {
				mv.addObject("userName", userService.findUserById(id).getName());

			}
			mv.setViewName("currentTsOfUser");
		} else {
			mv.addObject("msg", "user not existed");
			mv.setViewName("login");
		}
		return mv;
	}

}
