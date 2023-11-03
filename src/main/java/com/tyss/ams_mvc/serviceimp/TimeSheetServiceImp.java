package com.tyss.ams_mvc.serviceimp;

import java.time.LocalDate;
import java.time.Month;
import java.time.format.TextStyle;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tyss.ams_mvc.dao.TimeSheetDao;
import com.tyss.ams_mvc.dao.UserDao;
import com.tyss.ams_mvc.entity.TimeSheet;
import com.tyss.ams_mvc.entity.User;
import com.tyss.ams_mvc.exceptionclasses.timesheet.TimeSheetAlreadyExists;
import com.tyss.ams_mvc.service.TimeSheetService;

@Service
public class TimeSheetServiceImp implements TimeSheetService {

	@Autowired
	TimeSheetDao timeSheetDao;
	@Autowired
	UserDao userDao;

	@Override
	public TimeSheet saveTimeSheet(TimeSheet timeSheet, int userId) {
		User user = userDao.findUserById(userId);
		if (user != null) {
			List<TimeSheet> listOfTimeSheets = user.getTimeSheets();
			if (listOfTimeSheets != null) {
				Optional<TimeSheet> timesheet = listOfTimeSheets.stream().filter(
						sheet -> (sheet.getStart_date().getMonthValue() == timeSheet.getStart_date().getMonthValue()
								&& sheet.getStart_date().getYear() == timeSheet.getStart_date().getYear()))
						.findAny();
				if (timesheet.isPresent()) {
					throw new TimeSheetAlreadyExists();
				} else {
					int month = timeSheet.getStart_date().getMonthValue();
					int year = timeSheet.getStart_date().getYear();
					if (month == 12) {
						month = 1;
						year += 1;
						timeSheet.setEnd_date(LocalDate.parse(year + "-0" + month + "-" + 25));
					} else if (month >= 1 && month <= 9) {
						month += 1;
						timeSheet.setEnd_date(LocalDate.parse(year + "-0" + month + "-" + 25));
					} else {
						month += 1;
						timeSheet.setEnd_date(LocalDate.parse(year + "-" + month + "-" + 25));
					}
					timeSheetDao.saveTimeSheet(timeSheet);
					user.getTimeSheets().add(timeSheet);
					userDao.saveUser(user);
					return timeSheet;
				}
			} else {
				timeSheetDao.saveTimeSheet(timeSheet);
				List<TimeSheet> sheets = user.getTimeSheets();
				sheets.add(timeSheet);
				userDao.saveUser(user);
				return timeSheet;
			}
		} else {
			return null;
		}

	}

	@Override
	public TimeSheet updateTimeSheet(TimeSheet timeSheet) {
		TimeSheet timesheet = timeSheetDao.findBytimesheet_id(timeSheet.getTimesheetId());
		if (timesheet != null) {
			timeSheetDao.updateTimeSheet(timesheet);
			return timesheet;
		} else
			return null;
	}

	@Override
	public TimeSheet findTimeSheetById(int id) {
		TimeSheet sheet = timeSheetDao.findBytimesheet_id(id);
		if (sheet != null)
			return sheet;
		else
			return null;
	}

	@Override
	public boolean deleteTimeSheetById(int id, int userId) {
		try {
			User user = userDao.findUserById(userId);
			user.getTimeSheets().remove(timeSheetDao.findBytimesheet_id(id));
			userDao.updateUser(user);
			timeSheetDao.deleteTimeSheetById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<TimeSheet> findAllTimeSheetOfUser(int userId) {
		try {
			return timeSheetDao.findAllTimeSheetByUserId(userId);
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<TimeSheet> findAllTimeSheetOfAYearOfUser(int year, int userId) {
		try {
			List<TimeSheet> listOfTimeSheets = timeSheetDao.findAllTimeSheetByUserId(userId);
			List<TimeSheet> timesheetOfYear = null;
			if (listOfTimeSheets != null) {
				timesheetOfYear = listOfTimeSheets.stream()
						.filter(timeSheet -> timeSheet.getStart_date().getYear() == year).collect(Collectors.toList());
			}
			return timesheetOfYear;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public TimeSheet findTimeSheetByMonthNameOfUser(String month, int year, int userId) {
		Optional<TimeSheet> optTimeSheet = null;
		try {
			User user = userDao.findUserById(userId);
			if (user != null) {
				List<TimeSheet> timeSheets = user.getTimeSheets();
				optTimeSheet = timeSheets.stream()
						.filter(timeSheet -> timeSheet.getStart_date().getMonth()
								.getDisplayName(TextStyle.FULL, Locale.getDefault()).equalsIgnoreCase(month)
								&& timeSheet.getStart_date().getYear() == year)
						.findAny();
			}

			return optTimeSheet.get();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<TimeSheet> findTimeSheetByMonthNameOfAllEmployees(String month, int year) {
		try {
			return timeSheetDao.findAllTimeSheets().stream()
					.filter(timeSheet -> timeSheet.getStart_date().getMonth().getValue() == Month
							.valueOf(month.toUpperCase()).getValue() && timeSheet.getStart_date().getYear() == year)
					.collect(Collectors.toList());
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<TimeSheet> findTimeSheetOfUserOnCustomDates(String startMonth, int start_year, String endMonth,
			int end_year, int user_id) {
		try {
			User user = userDao.findUserById(user_id);
			System.out.println("hi");
			return user.getTimeSheets().stream()
					.filter(timesheet -> timesheet.getStart_date().getMonth().getValue() >= Month
							.valueOf(startMonth.toUpperCase()).getValue()
							&& timesheet.getStart_date().getMonth().getValue() <= Month.valueOf(endMonth.toUpperCase())
									.getValue()
							&& timesheet.getStart_date().getYear() >= start_year
							&& timesheet.getStart_date().getYear() <= end_year)
					.collect(Collectors.toList());
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<TimeSheet> findTimeSheetOnCustomDates(String startMonth, int start_year, String endMonth,
			int end_year) {
		try {
			return timeSheetDao.findAllTimeSheets().stream()
					.filter(timesheet -> timesheet.getStart_date().getMonth().getValue() >= Month
							.valueOf(startMonth.toUpperCase()).getValue()
							&& timesheet.getStart_date().getMonth().getValue() <= Month.valueOf(endMonth.toUpperCase())
									.getValue()
							&& timesheet.getStart_date().getYear() >= start_year
							&& timesheet.getStart_date().getYear() <= end_year)
					.collect(Collectors.toList());
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<TimeSheet> fetchCurrentMonthTimeSheet() {
		LocalDate currentDate = LocalDate.now();
		return findTimeSheetByMonthNameOfAllEmployees(String.valueOf(currentDate.getMonth()), currentDate.getYear());
	}

	@Override
	public TimeSheet fetchCurrentMonthTimeSheetofUser(int userId) {
		LocalDate currentDate = LocalDate.now();
		return findTimeSheetByMonthNameOfUser(String.valueOf(currentDate.getMonth()), currentDate.getYear(), userId);
	}
}
