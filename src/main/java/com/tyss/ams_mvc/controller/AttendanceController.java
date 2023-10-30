package com.tyss.ams_mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tyss.ams_mvc.dto.AttendanceDto;
import com.tyss.ams_mvc.entity.Attendance;
import com.tyss.ams_mvc.serviceimp.AttendanceServiceImp;

@Controller
//@RequestMapping("/attendance")
public class AttendanceController {

	@Autowired
	private AttendanceServiceImp service;

	@RequestMapping(value = "/createattendance")
	public ModelAndView createAttendance(ModelAndView mav, AttendanceDto attendance) {
		mav.addObject("attendance", attendance);
		mav.setViewName("attendance");
		return mav;
	}

	@RequestMapping(value = "/saveattendance")
	public ModelAndView saveAttendance(ModelAndView mav, @ModelAttribute AttendanceDto attendance) {
//		System.out.println(attendance.getDate());
//		service.saveAttendance(attendance);
		mav.setViewName("attendance");
		return mav;
	}
	
	@RequestMapping(value = "/findAttendance")
	public ModelAndView findAttendance(ModelAndView mav ) {
		mav.setViewName("findAttendace") ;
		return mav ;
	}
	
	
	@RequestMapping(value = "/getattendance")
	public ModelAndView getAttendance(ModelAndView mav, HttpServletRequest req ) {
		mav.addObject("att", service.findById(Integer.parseInt(req.getParameter("id")))) ;
		mav.setViewName("showattendance") ;
		return mav ;
	}
	
	
}
