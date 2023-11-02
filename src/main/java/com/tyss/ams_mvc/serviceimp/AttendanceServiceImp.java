package com.tyss.ams_mvc.serviceimp;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyss.ams_mvc.daoimp.AttendanceDaoImp;
import com.tyss.ams_mvc.daoimp.TimeSheetDaoImp;
import com.tyss.ams_mvc.dto.AttendanceDto;
import com.tyss.ams_mvc.entity.Attendance;
import com.tyss.ams_mvc.entity.TimeSheet;
import com.tyss.ams_mvc.service.AttendanceService;
import com.tyss.ams_mvc.util.AttendanceStatus;

@Service
public class AttendanceServiceImp implements AttendanceService {
	
	@Autowired
	private AttendanceDaoImp dao ;
	
	@Autowired
	private TimeSheetDaoImp sheetDao ;

	@Override
	public Attendance saveAttendance(Attendance attendance) {
		
		
		if (attendance != null) {
			dao.saveAttendance(attendance) ;
			return null ;
		}
		
		return null;
	}

	@Override
	public Attendance findById(int id) {
		
		if (dao.findById(id) != null) 
			return dao.findById(id) ;
		
		return null ;
	}

	@Override
	public Attendance updateAttendance(Attendance attendance) {
		
		if (attendance != null) 
			return dao.updateAttendance(attendance) ;
		
		return null;
	}

	@Override
	public boolean deleteAttendance(int id) {
		
		
		if (findById(id) != null) {
			dao.deleteAttendance(id) ;
			return true ;
		}
		return false;
	}

	@Override
	public List<Attendance> findAllAttendace() {
		
		return dao.findAllAttendace() ;
	}

	@Override
	public List<Attendance> findAllAttendanceByAttendanceStatus(AttendanceStatus status) {
		
		return dao.findAllAttendanceByAttendanceStatus(status) ;
	}

	@Override
	public List<Attendance> findAllAttendenceByDate(LocalDate date) {
		
		return dao.findAllAttendenceByDate(date) ;
	}

	@Override
	public List<Attendance> findAllAttendanceByAttendanceStatusAndDate(AttendanceStatus status, LocalDate date) {
		
		return dao.findAllAttendanceByAttendanceStatusAndDate(status, date) ;
	}

	@Override
	public List<Attendance> findAttendanceByTimeSheetId(int attendanceStatus) {
		
		return sheetDao.findBytimesheet_id(attendanceStatus).getAttendences() ;
	}

	@Override
	public Attendance saveAttendanceBydate(LocalDate date, int timesheetId) {
		TimeSheet timesheet = sheetDao.findBytimesheet_id(timesheetId) ;
		
		if ((date.isAfter(timesheet.getStart_date())&& date.isBefore(timesheet.getEnd_date()))) {
			
			
		}
		
		return null;
	}

}
