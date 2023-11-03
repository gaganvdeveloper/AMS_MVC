package com.tyss.ams_mvc.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;

import com.tyss.ams_mvc.dto.AttendanceDto;
import com.tyss.ams_mvc.entity.Attendance;
import com.tyss.ams_mvc.util.AttendanceStatus;

@Service
public interface AttendanceService {
	
	public Attendance saveAttendance(Attendance attendance);

	public Attendance findById(int id);

	public Attendance updateAttendance(Attendance attendance);

	public boolean deleteAttendance(int id);
	
	public List<Attendance> findAllAttendace();

	public List<Attendance> findAllAttendanceByAttendanceStatus(AttendanceStatus status);

	public List<Attendance> findAllAttendenceByDate(LocalDate date);

	public List<Attendance> findAllAttendanceByAttendanceStatusAndDate(AttendanceStatus status, LocalDate date);
	
	public List<Attendance> findAttendanceByTimeSheetId(int attendanceStatus) ;
	
	public Attendance saveAttendanceBydate(LocalDate date, int timesheetId) ;
}

