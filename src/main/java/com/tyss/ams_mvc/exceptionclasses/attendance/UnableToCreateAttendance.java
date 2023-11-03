package com.tyss.ams_mvc.exceptionclasses.attendance;

public class UnableToCreateAttendance extends RuntimeException {
	
	@Override
	public String getMessage() {
		return "Unable To create Attendance check the Deatils and Timesheet Id";
	}

}
