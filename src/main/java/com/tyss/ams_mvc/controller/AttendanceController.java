package com.tyss.ams_mvc.controller;

import java.time.LocalDate;
import java.time.LocalTime;
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
import com.tyss.ams_mvc.entity.TimeSheet;
import com.tyss.ams_mvc.serviceimp.AttendanceServiceImp;
import com.tyss.ams_mvc.serviceimp.TimeSheetServiceImp;
import com.tyss.ams_mvc.util.AttendanceStatus;

@Controller
//@RequestMapping("/attendance")
public class AttendanceController {

	@Autowired
	private AttendanceServiceImp service;
	
	@Autowired
	private TimeSheetServiceImp timeService ;

	@RequestMapping(value = "/createattendance")
	public ModelAndView createAttendance(ModelAndView mav, AttendanceDto attendance) {
		mav.addObject("attendance", attendance);
		mav.setViewName("attendance");
		return mav;
	}

	@RequestMapping(value = "/saveAttendance")
	public ModelAndView saveAttendance(ModelAndView mav, HttpServletRequest request, Attendance attendance) {
		attendance.setDate(LocalDate.parse(request.getParameter("date")));
		attendance.setLoginTime(LocalTime.parse(request.getParameter("loginTime"))) ;
		attendance.setLogoutTime(LocalTime.parse(request.getParameter("logoutTime"))) ;
		attendance.setAttendanceStatus(AttendanceStatus.valueOf(request.getParameter("attendanceStatus")));
		attendance.setTotalWorkingHours(Integer.valueOf(request.getParameter("totalWorkingHours"))) ;
		service.saveAttendance(attendance) ;
//		attendance.setBatchs(List<Batch> list) ;
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
	

	
	@RequestMapping(value = "/found")
	public ModelAndView attendanceByStatus(ModelAndView mav, HttpServletRequest request) {
		
		mav.addObject("list", service.findAllAttendanceByAttendanceStatus(AttendanceStatus.valueOf(request.getParameter("stat")))) ;
		mav.setViewName("showattendance");
		
//		mav.addObject("list", service.findAllAttendace().stream().filter(
//				a->a.getAttendanceStatus()
//				.equals(AttendanceStatus.valueOf(request.getParameter("status")))).collect(Collectors.toList()));
//				mav.setViewName("displayAttedance1");
		return mav ;
	}
	
	@RequestMapping(value = "/findbydate")
	public ModelAndView attendanceByDate(ModelAndView mav) {
		mav.setViewName("findbydate") ;
		return mav ;
	}
	
	@RequestMapping(value = "/foundbydate")
	public ModelAndView getAttendanceByDate(ModelAndView mav, HttpServletRequest req) {
		mav.addObject("list", service.findAllAttendenceByDate(LocalDate.parse(req.getParameter("date")))) ;
		mav.addObject("msg", "Based On the Date") ;
		mav.setViewName("displayattendance2") ;
		return mav ;
	}
	
	@RequestMapping(value = "/findallattendancebystatusanddate")
	public ModelAndView findAllAttendace(ModelAndView mav) {
		mav.setViewName("findbystatusanddate");
		return mav ;
	}
	
	@RequestMapping(value = "/getattendancebydateandstatus")
	public ModelAndView getattendancebydateandstatus(ModelAndView mav, HttpServletRequest request) {
		mav.addObject("msg", "Based On the status and Date") ;
		mav.addObject("list", service.findAllAttendanceByAttendanceStatusAndDate(AttendanceStatus.valueOf(request.getParameter("stat")), LocalDate.parse(request.getParameter("date")))) ;
		mav.setViewName("displayattendance2") ;
		return mav ;
	}
	
	@RequestMapping(value = "saveattendancebydate")
	public Attendance saveAttendanceBydate(LocalDate date, int timesheetId) {
		TimeSheet timesheet = timeService.findTimeSheetById(timesheetId) ;
		
		if (timesheet != null && (date.isAfter(timesheet.getStart_date())&& date.isBefore(timesheet.getEnd_date()))) {
			
			ModelAndView mav = new ModelAndView() ;
			mav.setViewName("crteateattendacefordate");
		}
		
		return null;
	}
}
