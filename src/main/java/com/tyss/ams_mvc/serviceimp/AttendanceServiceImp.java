package com.tyss.ams_mvc.serviceimp;

import java.time.LocalDate;
import java.util.List;

import com.tyss.ams_mvc.entity.Attendance;
import com.tyss.ams_mvc.service.AttendanceService;
import com.tyss.ams_mvc.util.AttendanceStatus;

public class AttendanceServiceImp implements AttendanceService {

	@Override
	public Attendance saveAttendance(Attendance attendance) {
		
		if (attendance != null) {
			
			
		}
		
		return null;
	}

	@Override
	public Attendance findById(int id) {
		
		return null;
	}

	@Override
	public Attendance updateAttendance(Attendance attendance) {
		
		return null;
	}

	@Override
	public boolean deleteAttendance(int id) {
		
		return false;
	}

	@Override
	public List<Attendance> findAllAttendace() {
		
		return null;
	}

	@Override
	public List<Attendance> findAllAttendanceByAttendanceStatus(AttendanceStatus status) {
		
		return null;
	}

	@Override
	public List<Attendance> findAllAttendenceByDate(LocalDate date) {
		
		return null;
	}

	@Override
	public List<Attendance> findAllAttendanceByAttendanceStatusAndDate(AttendanceStatus status, LocalDate date) {
		
		return null;
	}

	@Override
	public List<Attendance> findAttendanceByTimeSheetId(int attendanceStatus) {
		
		return null;
	}

}
