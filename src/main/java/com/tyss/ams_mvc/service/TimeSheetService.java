package com.tyss.ams_mvc.service;

import java.util.List;

import com.tyss.ams_mvc.entity.TimeSheet;
import com.tyss.ams_mvc.entity.User;

public interface TimeSheetService {
	public TimeSheet saveAdminTimeSheet(int startDate, int endDate, User user);

	public TimeSheet saveTimeSheet(TimeSheet timeSheet, int userId);

	public TimeSheet updateTimeSheet(TimeSheet timeSheet);

	public TimeSheet findTimeSheetById(int id);

	public boolean deleteTimeSheetById(int id, int userId);

	public List<TimeSheet> findAllTimeSheetOfUser(int userId);

	public List<TimeSheet> findAllTimeSheetOfAYearOfUser(int year, int userId);

	public TimeSheet findTimeSheetByMonthNameOfUser(String month, int year, int userId);

	public List<TimeSheet> findTimeSheetByMonthNameOfAllEmployees(String month, int year);

	public List<TimeSheet> findTimeSheetOfUserOnCustomDates(String startMonth, int start_year, String endMonth,
			int end_year, int user_id);

	public List<TimeSheet> findTimeSheetOnCustomDates(String startMonth, int start_year, String endMonth, int end_year);

	public List<TimeSheet> fetchCurrentMonthTimeSheet();

	TimeSheet fetchCurrentMonthTimeSheetofUser(int userId);
}
