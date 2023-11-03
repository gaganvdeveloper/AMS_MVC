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

}
