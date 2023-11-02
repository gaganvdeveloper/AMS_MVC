package com.tyss.ams_mvc.controller;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import static java.time.temporal.ChronoUnit.MINUTES;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tyss.ams_mvc.entity.Attendance;
import com.tyss.ams_mvc.entity.User;
import com.tyss.ams_mvc.service.AttendanceService;
import com.tyss.ams_mvc.util.AttendanceStatus;

@Controller
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService;

	@RequestMapping(value = "/createattendance")
	public ModelAndView gotoCreateAttendance(ModelAndView mv) {
		mv.setViewName("createattendance");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/createattendancecreate")
	public String createAttendance(HttpServletRequest req, Attendance attendance) {
//		Attendance attendance = new Attendance();
		// Printing Values
//		System.out.println(LocalDate.parse(req.getParameter("date"), DateTimeFormatter.ofPattern("yyyy-MM-dd")));
//		System.out.println(LocalTime.parse(req.getParameter("logintime"), DateTimeFormatter.ofPattern("HH:mm")));
//		System.out.println(LocalTime.parse(req.getParameter("logouttime"), DateTimeFormatter.ofPattern("HH:mm")));
//		System.out.println(AttendanceStatus.valueOf(req.getParameter("batchStatus")));
		// Checking Type
//		System.out.println(LocalDate.parse(req.getParameter("date"), DateTimeFormatter.ofPattern("yyyy-MM-dd"))
//				.getClass().getName());
//		System.out.println(LocalTime.parse(req.getParameter("logintime"), DateTimeFormatter.ofPattern("HH:mm"))
//				.getClass().getName());
//		System.out.println(LocalTime.parse(req.getParameter("logouttime"), DateTimeFormatter.ofPattern("HH:mm"))
//				.getClass().getName());
//		System.out.println(AttendanceStatus.valueOf(req.getParameter("batchStatus")).getClass().getName());

		attendance.setDate(LocalDate.parse(req.getParameter("date"), DateTimeFormatter.ofPattern("yyyy-MM-dd")));

		attendance.setLoginTime(LocalTime.parse(req.getParameter("logintime"), DateTimeFormatter.ofPattern("HH:mm")));
		attendance.setLogoutTime(LocalTime.parse(req.getParameter("logouttime"), DateTimeFormatter.ofPattern("HH:mm")));
		attendance.setAttendanceStatus(AttendanceStatus.valueOf(req.getParameter("batchStatus")));
		
		LocalTime inTime = LocalTime.parse(req.getParameter("logintime"), DateTimeFormatter.ofPattern("HH:mm"));
		LocalTime outTime = LocalTime.parse(req.getParameter("logouttime"), DateTimeFormatter.ofPattern("HH:mm"));
		Duration duration = Duration.between(
				LocalTime.parse(req.getParameter("logintime"), DateTimeFormatter.ofPattern("HH:mm")),
				LocalTime.parse(req.getParameter("logouttime"), DateTimeFormatter.ofPattern("HH:mm")));
//		System.out.println(duration);
		int hours = (int) duration.toHours();
		int minutes = (int) duration.toMinutes();
//		System.out.println(minutes);
//		System.out.println();
		long min = MINUTES.between(inTime, outTime);
//		System.out.println(getHourandMin(min));
		attendance.setTotalWorkingHours(getHourandMin(min));
		attendanceService.saveAttendance(attendance);
		return "Printed";
	}

	private LocalTime getHourandMin(long min) {
		return LocalTime.of((int) min / 60, (int) min % 60);
	}

}
