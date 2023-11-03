package com.tyss.ams_mvc.controller;

import static java.time.temporal.ChronoUnit.MINUTES;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tyss.ams_mvc.entity.Attendance;
import com.tyss.ams_mvc.entity.TimeSheet;
import com.tyss.ams_mvc.entity.User;
import com.tyss.ams_mvc.service.AttendanceService;
import com.tyss.ams_mvc.service.TimeSheetService;
import com.tyss.ams_mvc.service.UserService;
import com.tyss.ams_mvc.util.AttendanceStatus;

@Controller
//@RequestMapping("/attendance")
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService;
	
	@Autowired
	private TimeSheetService timeSheetService;
	
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/createattendance")
	public ModelAndView gotoCreateAttendance(ModelAndView mv,HttpServletRequest req) {
		
		User user = userService.findUserById(Integer.parseInt(req.getParameter("id")));
		
		List<TimeSheet> timesheets = user.getTimeSheets();
		
		List<TimeSheet> ts = timesheets.stream().filter(t-> t.getStart_date().getMonthValue()==LocalDate.now().getMonthValue() && t.getStart_date().getYear()==LocalDate.now().getYear()).collect(Collectors.toList());
		mv.addObject("userId",user.getUserId());
		mv.addObject("timeSheetId",ts.get(0).getTimesheetId());
		mv.setViewName("createattendance");
		return mv;
	}

	@RequestMapping(value = "/createattendancecreate")
	public ModelAndView createAttendance(HttpServletRequest req,ModelAndView mv) {
		System.out.println(Integer.parseInt(req.getParameter("userId")));
		System.out.println(Integer.parseInt(req.getParameter("timeSheetId")));
		User user = userService.findUserById(Integer.parseInt(req.getParameter("userId")));
		TimeSheet timeSheet = timeSheetService.findTimeSheetById(Integer.parseInt(req.getParameter("timeSheetId")));
		if(user == null && timeSheet == null) {
			mv.setViewName("login");
			return mv;
		}
		Attendance attendance = new Attendance();
		attendance.setDate(LocalDate.parse(req.getParameter("date"), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		attendance.setLoginTime(LocalTime.parse(req.getParameter("logintime"), DateTimeFormatter.ofPattern("HH:mm")));
		attendance.setLogoutTime(LocalTime.parse(req.getParameter("logouttime"), DateTimeFormatter.ofPattern("HH:mm")));
		attendance.setAttendanceStatus(AttendanceStatus.valueOf(req.getParameter("batchStatus")));
		LocalTime inTime = LocalTime.parse(req.getParameter("logintime"), DateTimeFormatter.ofPattern("HH:mm"));
		LocalTime outTime = LocalTime.parse(req.getParameter("logouttime"), DateTimeFormatter.ofPattern("HH:mm"));
		Duration duration = Duration.between(
				LocalTime.parse(req.getParameter("logintime"), DateTimeFormatter.ofPattern("HH:mm")),
				LocalTime.parse(req.getParameter("logouttime"), DateTimeFormatter.ofPattern("HH:mm")));
		int hours = (int) duration.toHours();
		int minutes = (int) duration.toMinutes();
		long min = MINUTES.between(inTime, outTime);
		attendance.setTotalWorkingHours(getHourandMin(min));
		attendanceService.saveAttendance(attendance);
		List<Attendance> ats = timeSheet.getAttendences();
		ats.add(attendance);
		timeSheet.setAttendences(ats);
		timeSheet = timeSheetService.updateTimeSheet(timeSheet);
		
		
		mv.setViewName("trainerhome");
		mv.addObject("msg","Attendance Marked");
		mv.addObject("user",(User)req.getSession().getAttribute("user"));
		return mv;
	}

	private LocalTime getHourandMin(long min) {
		return LocalTime.of((int) min / 60, (int) min % 60);
	}
	

	@RequestMapping(value = "/findAttendance")
	public ModelAndView findAttendance(ModelAndView mav ) {
		mav.setViewName("findAttendace") ;
		return mav ;
	}
	
	
	@RequestMapping(value = "/getattendance")
	public ModelAndView getAttendance(ModelAndView mav, HttpServletRequest req ) {
		mav.addObject("att", attendanceService.findById(Integer.parseInt(req.getParameter("id")))) ;
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
		attendanceService.deleteAttendance(Integer.parseInt(request.getParameter("id"))) ;
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
		
		mav.addObject("list", attendanceService.findAllAttendanceByAttendanceStatus(AttendanceStatus.valueOf(request.getParameter("stat")))) ;
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
		mav.addObject("list", attendanceService.findAllAttendenceByDate(LocalDate.parse(req.getParameter("date")))) ;
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
		mav.addObject("list", attendanceService.findAllAttendanceByAttendanceStatusAndDate(AttendanceStatus.valueOf(request.getParameter("stat")), LocalDate.parse(request.getParameter("date")))) ;
		mav.setViewName("displayattendance2") ;
		return mav ;
	}
	
	@RequestMapping(value = "saveattendancebydate")
	public Attendance saveAttendanceBydate(LocalDate date, int timesheetId) {
		TimeSheet timesheet = timeSheetService.findTimeSheetById(timesheetId) ;
		
		if (timesheet != null && (date.isAfter(timesheet.getStart_date())&& date.isBefore(timesheet.getEnd_date()))) {
			
			ModelAndView mav = new ModelAndView() ;
			mav.setViewName("crteateattendacefordate");
		}
		
		return null;
	}
	
	@RequestMapping(value = "/update")
	public ModelAndView updateAttendance(ModelAndView mav) {
		
		Attendance attendance = new Attendance() ;
		mav.addObject("attendance", attendance) ;
		mav.setViewName("updateAttendance");
		return mav ;
	}
	
	@RequestMapping(value = "/getupdate")
	public ModelAndView getUpdate(ModelAndView mav, HttpServletRequest request) {
		
		mav.addObject("attendance" , attendanceService.findById(Integer.parseInt(request.getParameter("id")))) ;
		mav.setViewName("saveupdate") ;
		return mav ;
	}

	@RequestMapping(value = "/saveupdate")
	public ModelAndView saveUpdate(ModelAndView mav, HttpServletRequest req) {
		
		Attendance attendance = attendanceService.findById(Integer.parseInt(req.getParameter("attendanceId"))) ;
		
		attendance.setLoginTime(LocalTime.parse(req.getParameter("logintime"), DateTimeFormatter.ofPattern("HH:mm")));
		attendance.setLogoutTime(LocalTime.parse(req.getParameter("logouttime"), DateTimeFormatter.ofPattern("HH:mm")));
		attendance.setAttendanceStatus(AttendanceStatus.valueOf(req.getParameter("batchStatus")));
		
		LocalTime inTime = LocalTime.parse(req.getParameter("logintime"), DateTimeFormatter.ofPattern("HH:mm"));
		LocalTime outTime = LocalTime.parse(req.getParameter("logouttime"), DateTimeFormatter.ofPattern("HH:mm"));
		Duration duration = Duration.between(
				LocalTime.parse(req.getParameter("logintime"), DateTimeFormatter.ofPattern("HH:mm")),
				LocalTime.parse(req.getParameter("logouttime"), DateTimeFormatter.ofPattern("HH:mm")));
//		int hours = (int) duration.toHours();
//		int minutes = (int) duration.toMinutes();
		long min = MINUTES.between(inTime, outTime);
		attendance.setTotalWorkingHours(getHourandMin(min));
		System.out.println("After the updation"+getHourandMin(min));
		attendanceService.updateAttendance(attendance) ;
		mav.setViewName("login") ;
		return mav ;
	}
	
	@RequestMapping(value = "/findAllattendance")
	public ModelAndView findAllAttendance(ModelAndView mav) {
		
		mav.addObject("list", attendanceService.findAllAttendace()) ;
		mav.addObject("msg", "All Attendance") ;
		mav.setViewName("displayattendance2") ;
		return mav ;
	}
}
