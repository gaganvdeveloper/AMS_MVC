package com.tyss.ams_mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tyss.ams_mvc.entity.Attendance;
import com.tyss.ams_mvc.serviceimp.AttendanceServiceImp;

@Controller
//@RequestMapping("/attendance")
public class AttendanceController {

	@Autowired
	private AttendanceServiceImp service;

	@RequestMapping(value = "/createattendance", method = RequestMethod.GET)
	public ModelAndView createAttendance(ModelAndView mav, Attendance attendance) {
		mav.addObject("attendance", attendance);
		mav.setViewName("attendance");
		return mav;
	}

	@RequestMapping(value = "/saveattendance", method = RequestMethod.POST)
	public ModelAndView saveAttendance(ModelAndView mav, @ModelAttribute Attendance attendance) {
		service.saveAttendance(attendance);
		mav.setViewName("attendance");
		return mav;
	}

}
