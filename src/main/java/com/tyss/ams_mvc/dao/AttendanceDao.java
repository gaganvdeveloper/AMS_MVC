package com.tyss.ams_mvc.dao;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import com.tyss.ams_mvc.entity.Attendance;
import com.tyss.ams_mvc.util.AttendanceStatus;

public interface AttendanceDao {
	
	public Attendance saveAttendance(Attendance attendance);

	public Attendance findById(int id);

	public Attendance updateAttendance(Attendance attendance);

	public boolean deleteAttendance(int id);
	
	public List<Attendance> findAllAttendace();

	public List<Attendance> findAllAttendanceByAttendanceStatus(AttendanceStatus status);

	public List<Attendance> findAllAttendenceByDate(LocalDate date);

	public List<Attendance> findAllAttendanceByAttendanceStatusAndDate(AttendanceStatus status, LocalDate date);
	
	public List<Attendance> findAttendanceByTimeSheetId(int attendanceStatus) ;
}
