package com.tyss.ams_mvc.controller;

import static java.time.temporal.ChronoUnit.MINUTES;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.tyss.ams_mvc.entity.Attendance;
import com.tyss.ams_mvc.entity.TimeSheet;
import com.tyss.ams_mvc.entity.User;
import com.tyss.ams_mvc.service.AttendanceService;
import com.tyss.ams_mvc.service.TimeSheetService;
import com.tyss.ams_mvc.util.AttendanceStatus;

@Controller
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService;
	@Autowired
	private TimeSheetService timeSheetService;

	@RequestMapping(value = "/createattendance")
	public ModelAndView gotoCreateAttendance(ModelAndView mv) {
		mv.setViewName("createattendance");
		return mv;
	}

	@RequestMapping(value = "/createattendancecreate")
	public ModelAndView createAttendance(HttpServletRequest req, ModelAndView mv,
			@SessionAttribute(name = "user") User user) {
		TimeSheet sheet = timeSheetService.fetchCurrentMonthTimeSheetofUser(user.getUserId());
		if (sheet == null) {
			TimeSheet timesheet = new TimeSheet();
			timeSheetService.saveTimeSheet(timesheet, user.getUserId());
			List<Attendance> attendances = new ArrayList<Attendance>();
			timesheet.setAttendences(null);
			Attendance attendance = new Attendance();
			attendance.setDate(LocalDate.parse(req.getParameter("date"), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			attendance
					.setLoginTime(LocalTime.parse(req.getParameter("logintime"), DateTimeFormatter.ofPattern("HH:mm")));
			attendance.setLogoutTime(
					LocalTime.parse(req.getParameter("logouttime"), DateTimeFormatter.ofPattern("HH:mm")));
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

			// here i have to set the timesheet for attendance object or else-->birectional

			// i have to do save attendance and set attendance to timesheet and update
			mv.setViewName("trainerhome");
			mv.addObject("msg", "Attendance Marked");
			mv.addObject("user", (User) req.getSession().getAttribute("user"));
		} else {

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
		mv.setViewName("trainerhome");
		mv.addObject("msg", "Attendance Marked");
		mv.addObject("user", (User) req.getSession().getAttribute("user"));
		return mv;
	}

	private LocalTime getHourandMin(long min) {
		return LocalTime.of((int) min / 60, (int) min % 60);
	}

}
