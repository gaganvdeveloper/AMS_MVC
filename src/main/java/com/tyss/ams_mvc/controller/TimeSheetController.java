package com.tyss.ams_mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.tyss.ams_mvc.entity.TimeSheet;
import com.tyss.ams_mvc.service.TimeSheetService;

@Controller
public class TimeSheetController {

	@Autowired
	TimeSheetService timeSheetService;

	@RequestMapping("/test")
	public ModelAndView test(ModelAndView mv) {
		mv.setViewName("timesheet");
		return mv;
	}

	@RequestMapping("/create")
	public ModelAndView saveTimeSheet(TimeSheet timeSheet, int userId, ModelAndView mv) {
		timeSheetService.saveTimeSheet(timeSheet, userId);
		mv.setViewName("timesheet");
		return mv;
	}

//	@RequestMapping("/save")
//	public ModelAndView saveTimeSheet(TimeSheet timeSheet, int userId, ModelAndView mv) {
//		timeSheetService.saveTimeSheet(timeSheet, userId);
//		mv.setViewName("timesheet");
//		return mv;
//	}

}
