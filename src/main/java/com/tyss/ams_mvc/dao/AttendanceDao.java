package com.tyss.ams_mvc.dao;

import org.springframework.stereotype.Service;

import com.tyss.ams_mvc.entity.Attendance;

@Service
public interface AttendanceDao {
	
	Attendance saveAttendance(Attendance attendance);
	
}
