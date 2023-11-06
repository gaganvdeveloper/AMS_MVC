package com.tyss.ams_mvc.controller;

import static java.time.temporal.ChronoUnit.MINUTES;

import java.io.IOException;
import java.io.OutputStream;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
	public ModelAndView gotoCreateAttendance(ModelAndView mv, HttpServletRequest req) {
		User user = userService.findUserById(Integer.parseInt(req.getParameter("id")));

		TimeSheet timesheet = timeSheetService.fetchCurrentMonthTimeSheetofUser(user.getUserId());
		if (timesheet == null) {
			timesheet = timeSheetService.saveTimeSheet(new TimeSheet(), user.getUserId());
		}
		mv.addObject("userId", user.getUserId());
		mv.addObject("timeSheetId", timesheet.getTimesheetId());
		mv.setViewName("createattendance");
		return mv;
	}

	@RequestMapping(value = "/createattendancecreate")
	public ModelAndView createAttendance(HttpServletRequest req, ModelAndView mv) {
		System.out.println(Integer.parseInt(req.getParameter("userId")));
		System.out.println(Integer.parseInt(req.getParameter("timeSheetId")));
		User user = userService.findUserById(Integer.parseInt(req.getParameter("userId")));
		TimeSheet timeSheet = timeSheetService.findTimeSheetById(Integer.parseInt(req.getParameter("timeSheetId")));
		if (user == null) {
			mv.setViewName("login");
			return mv;
		}
		if (timeSheet == null) {
			timeSheet = timeSheetService.saveTimeSheet(new TimeSheet(), user.getUserId());
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
		List<Attendance> ats = null;
		try {
			ats = timeSheet.getAttendences();
			ats.add(attendance);
		} catch (Exception e) {
			ats = new ArrayList<Attendance>();
			ats.add(attendance);
		}

		timeSheet.setAttendences(ats);
		timeSheet = timeSheetService.updateTimeSheet(timeSheet);

		mv.setViewName("trainerhome");
		mv.addObject("msg", "Attendance Marked");
		mv.addObject("user", (User) req.getSession().getAttribute("user"));
		return mv;
	}

	private LocalTime getHourandMin(long min) {
		return LocalTime.of((int) min / 60, (int) min % 60);
	}

	@RequestMapping(value = "/findAttendance")
	public ModelAndView findAttendance(ModelAndView mav) {
		mav.setViewName("findAttendace");
		return mav;
	}

	@RequestMapping(value = "/getattendance")
	public ModelAndView getAttendance(ModelAndView mav, HttpServletRequest req) {
		mav.addObject("att", attendanceService.findById(Integer.parseInt(req.getParameter("id"))));
		mav.setViewName("showattendance");
		return mav;
	}

	@RequestMapping(value = "/deleteAttendance")
	public ModelAndView deleteAttendance(ModelAndView mav) {
		mav.setViewName("deleteAttendance");
		return mav;
	}

	@RequestMapping(value = "/delAttendance")
	public ModelAndView delAttendance(ModelAndView mav, HttpServletRequest request) {
		attendanceService.deleteAttendance(Integer.parseInt(request.getParameter("id")));
		mav.setViewName("findAttendace");
		return mav;
	}

	@RequestMapping(value = "/findstatus")
	public ModelAndView findByStatus(ModelAndView mav) {
		mav.setViewName("find");
		return mav;
	}

	@RequestMapping(value = "/found")
	public ModelAndView attendanceByStatus(ModelAndView mav, HttpServletRequest request) {

		mav.addObject("list", attendanceService
				.findAllAttendanceByAttendanceStatus(AttendanceStatus.valueOf(request.getParameter("stat"))));
		mav.setViewName("showattendance");
		return mav;
	}

	@RequestMapping(value = "/findbydate")
	public ModelAndView attendanceByDate(ModelAndView mav) {
		mav.setViewName("findbydate");
		return mav;
	}

	@RequestMapping(value = "/foundbydate")
	public ModelAndView getAttendanceByDate(ModelAndView mav, HttpServletRequest req) {
		mav.addObject("list", attendanceService.findAllAttendenceByDate(LocalDate.parse(req.getParameter("date"))));
		mav.addObject("msg", "Based On the Date");
		mav.setViewName("displayattendance2");
		return mav;
	}

	@RequestMapping(value = "/findallattendancebystatusanddate")
	public ModelAndView findAllAttendace(ModelAndView mav) {
		mav.setViewName("findbystatusanddate");
		return mav;
	}

	@RequestMapping(value = "/getattendancebydateandstatus")
	public ModelAndView getattendancebydateandstatus(ModelAndView mav, HttpServletRequest request) {
		mav.addObject("msg", "Based On the status and Date");
		mav.addObject("list", attendanceService.findAllAttendanceByAttendanceStatusAndDate(
				AttendanceStatus.valueOf(request.getParameter("stat")), LocalDate.parse(request.getParameter("date"))));
		mav.setViewName("displayattendance2");
		return mav;
	}

	@RequestMapping(value = "saveattendancebydate")
	public Attendance saveAttendanceBydate(LocalDate date, int timesheetId) {
		TimeSheet timesheet = timeSheetService.findTimeSheetById(timesheetId);

		if (timesheet != null && (date.isAfter(timesheet.getStart_date()) && date.isBefore(timesheet.getEnd_date()))) {

			ModelAndView mav = new ModelAndView();
			mav.setViewName("crteateattendacefordate");
		}

		return null;
	}

	@RequestMapping(value = "/getupdate")
	public ModelAndView getUpdate(ModelAndView mav, HttpServletRequest request) {

		mav.addObject("attendance", attendanceService.findById(Integer.parseInt(request.getParameter("id"))));
		mav.setViewName("saveupdate");
		return mav;
	}

	@RequestMapping(value = "/saveupdate")
	public ModelAndView saveUpdate(ModelAndView mav, HttpServletRequest req) {

		Attendance attendance = attendanceService.findById(Integer.parseInt(req.getParameter("attendanceId")));

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
		System.out.println("After the updation" + getHourandMin(min));
		attendanceService.updateAttendance(attendance);
		mav.setViewName("trainerhome");
		return mav;
	}

	@RequestMapping(value = "/findAllattendance")

	public ModelAndView findAllAttendanceOfaTimeSheet(ModelAndView mav, HttpServletRequest request,

			@SessionAttribute(name = "user", required = false) User user) {
		TimeSheet ts = timeSheetService.findTimeSheetById(Integer.parseInt(request.getParameter("id")));
		List<Attendance> list;
		try {
			list = ts.getAttendences();
		} catch (Exception e) {
			list = new ArrayList<Attendance>();
		}

		if (user.getUserRole().toString().equals("TRAINER")) {
			mav.addObject("list", list);
			mav.addObject("msg", "All Attendance");
			mav.setViewName("displayattendance2");
			return mav;
		}
		mav.addObject("list", list);
		mav.addObject("msg", "All Attendance");
		mav.setViewName("displayattendance1");
		return mav;
	}

	@RequestMapping("/converttoxl")
	public void getXlSheet(HttpServletRequest request, HttpServletResponse response,

			@SessionAttribute(name = "user", required = false) User user) throws IOException {

		TimeSheet timesheet = timeSheetService.findTimeSheetById(Integer.valueOf(request.getParameter("id")));

		List<Attendance> infoList = timesheet.getAttendences();

		try (HSSFWorkbook workbook = new HSSFWorkbook()) {
			HSSFSheet sheet = workbook.createSheet("Attendance Data");
			HSSFRow headerRow = sheet.createRow(0);
			headerRow.createCell(0).setCellValue("Sl NO");
			headerRow.createCell(1).setCellValue("Date");
			headerRow.createCell(2).setCellValue("Login Time");
			headerRow.createCell(3).setCellValue("Logout Time");
			headerRow.createCell(4).setCellValue("Attendance Status");
			headerRow.createCell(5).setCellValue("Total Working Hours");
//				headerRow.createCell(6).setCellValue("batchs");
			int rowNum = 1, slno = 1;

			for (Attendance attendance : infoList) {
				HSSFRow dataRow = sheet.createRow(rowNum++);
				dataRow.createCell(0).setCellValue(slno++);
				dataRow.createCell(1).setCellValue(convertDate(attendance.getDate()));
				dataRow.createCell(2).setCellValue(String.valueOf(convertTime(attendance.getLoginTime())));
				dataRow.createCell(3).setCellValue(String.valueOf(convertTime(attendance.getLogoutTime())));
				dataRow.createCell(4).setCellValue(String.valueOf(attendance.getAttendanceStatus()));
				dataRow.createCell(5).setCellValue(String.valueOf(attendance.getTotalWorkingHours()));
//					dataRow.createCell(1).setCellValue(attendance.get);
			}
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition",
					"attachment; filename= " + user.getName() + "_" + user.getEmpId() + ".xls");
			try (OutputStream outputStream = response.getOutputStream()) {
				workbook.write(outputStream);
			}
		}
	}

	public static String convertTime(LocalTime of) {
		// To Get the Date in a format of dd-month-yyyy
		String time = "";
		int hour = of.getHour();
		// Logic to convert time in 12 hour format
		if (hour > 12) {
			time += (hour - 12) + ":" + of.getMinute() + " PM.";
		} else {
			time += hour + ":" + of.getMinute() + " AM.";
		}
		return time;
	}

	public static String convertDate(LocalDate localDate) {

		return " " + localDate.getDayOfMonth() + " - " + localDate.getMonth() + " - " + localDate.getYear() + " ";

	}

}
