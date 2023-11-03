package com.tyss.ams_mvc.serviceimp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyss.ams_mvc.dao.AttendanceDao;
import com.tyss.ams_mvc.entity.Attendance;
import com.tyss.ams_mvc.service.AttendanceService;
@Service
public class AttendanceServiceImpl implements AttendanceService{

	@Autowired
	private AttendanceDao attendanceDao;
	
	@Override
	public Attendance saveAttendance(Attendance attendance) {
		return attendanceDao.saveAttendance(attendance);
	}

}
