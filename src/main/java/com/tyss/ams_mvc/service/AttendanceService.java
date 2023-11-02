package com.tyss.ams_mvc.service;

import org.springframework.stereotype.Service;

import com.tyss.ams_mvc.entity.Attendance;

@Service
public interface AttendanceService {
	
	Attendance saveAttendance(Attendance attendance);
	
}
