package com.tyss.ams_mvc.exceptionclasses.attendance;

public class AttendanceNotFoundException extends RuntimeException{
	
	@Override
	public String getMessage() {
		return "The Attendance You are looking for is not found";
	}

}
