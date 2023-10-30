package com.tyss.ams_mvc.controller;

import java.util.List;
import java.util.stream.Collectors;

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
import com.tyss.ams_mvc.util.AttendanceStatus;

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
		service.saveAttendance(attendance);
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
	
	@RequestMapping(value = "/delete")
	public ModelAndView deleteAttendance(ModelAndView mav) {
		mav.setViewName("deleteAttendance") ;
		return mav ;
	}
	
	@RequestMapping(value = "/delAttendance")
	public ModelAndView delAttendance(ModelAndView mav, HttpServletRequest request) {
		service.deleteAttendance(Integer.parseInt(request.getParameter("id"))) ;
		mav.setViewName("findAttendace") ;
		return mav ;
	}
	
	@RequestMapping(value = "/findstatus")
	public ModelAndView findByStatus(ModelAndView mav) {
		mav.setViewName("find");
		return mav ;
	}
	
//	@RequestMapping(value = "/findattendancebyStatus")
//	public ModelAndView findattendancebyStatus(ModelAndView mav ,HttpServletRequest request) {
//		
//		System.out.println("Entering the findattendancebyStatus");
//		System.out.println(service.findAllAttendace());
//		
//		mav.addObject("list", service.findAllAttendace().stream().filter(
//				a->a.getAttendanceStatus()
//				.equals(AttendanceStatus.valueOf(request.getParameter("status")))).collect(Collectors.toList()));
//				mav.setViewName("displayAttedance1");
//		return mav ;
//	}
	
	@RequestMapping(value = "/found")
	public ModelAndView attendanceByStatus(ModelAndView mav, HttpServletRequest request) {
		
		mav.addObject("list", service.findAllAttendanceByAttendanceStatus(AttendanceStatus.valueOf(request.getParameter("stat")))) ;
		mav.setViewName("displayAttedance1");
		
		
//		mav.addObject("list", service.findAllAttendace().stream().filter(
//				a->a.getAttendanceStatus()
//				.equals(AttendanceStatus.valueOf(request.getParameter("status")))).collect(Collectors.toList()));
//				mav.setViewName("displayAttedance1");
		return mav ;
	}
}
