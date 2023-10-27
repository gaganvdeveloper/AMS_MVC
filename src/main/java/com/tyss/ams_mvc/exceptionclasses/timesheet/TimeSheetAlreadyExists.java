package com.tyss.ams_mvc.exceptionclasses.timesheet;

public class TimeSheetAlreadyExists extends RuntimeException {
	@Override
	public String getMessage() {
		return "time sheet already presented for this month";
	}
}
