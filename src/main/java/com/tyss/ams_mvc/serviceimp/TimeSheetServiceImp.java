package com.tyss.ams_mvc.serviceimp;

import java.time.LocalDate;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Arrays;
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
import com.tyss.ams_mvc.util.UserRole;

@Service
public class TimeSheetServiceImp implements TimeSheetService {

	@Autowired
	TimeSheetDao timeSheetDao;
	@Autowired
	UserDao userDao;

	public TimeSheet saveAdminTimeSheet(int startDate, int endDate, User user) {
		List<TimeSheet> sheets = user.getTimeSheets();
		if (sheets == null || sheets.isEmpty()) {
			ArrayList<TimeSheet> new_sheets = new ArrayList<TimeSheet>();
			TimeSheet timesheet = new TimeSheet();
			timesheet.setStart_date(LocalDate.of(LocalDate.now().getYear(), LocalDate.now().getMonth(), startDate));
			timesheet.setEnd_date(LocalDate.of(LocalDate.now().getYear(), LocalDate.now().getMonth(), endDate));
			timeSheetDao.saveTimeSheet(timesheet);
			new_sheets.add(timesheet);
			user.setTimeSheets(new_sheets);
			userDao.updateUser(user);
			return timesheet;
		} else {
			TimeSheet sheet = sheets.stream().findAny().get();
			sheet.setStart_date(LocalDate.of(LocalDate.now().getYear(), LocalDate.now().getMonth(), startDate));
			sheet.setEnd_date(LocalDate.of(LocalDate.now().getYear(), LocalDate.now().getMonth(), endDate));
			timeSheetDao.updateTimeSheet(sheet);
			return sheet;
		}
	}

	@Override
	public TimeSheet saveTimeSheet(TimeSheet timeSheet, int userId) {
		List<User> users = userDao.findUserByRole(UserRole.ADMIN);
		Optional<User> admin = users.stream().findAny();
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
					timeSheet.setStart_date(LocalDate.of(LocalDate.now().getYear(), LocalDate.now().getMonth(),
							admin.get().getTimeSheets().stream().findAny().get().getStart_date().getDayOfMonth()));
					timeSheet.setEnd_date(endDate(timeSheet, admin.get()));
					timeSheetDao.saveTimeSheet(timeSheet);
					user.getTimeSheets().add(timeSheet);
					userDao.saveUser(user);
					return timeSheet;
				}
			} else {
				timeSheet.setStart_date(LocalDate.of(LocalDate.now().getYear(), LocalDate.now().getMonth(),
						admin.get().getTimeSheets().stream().findAny().get().getStart_date().getDayOfMonth()));
				timeSheet.setEnd_date(endDate(timeSheet, admin.get()));
				timeSheetDao.saveTimeSheet(timeSheet);
				List<TimeSheet> sheets = new ArrayList<TimeSheet>();
				sheets.add(timeSheet);
				user.setTimeSheets(sheets);
				userDao.updateUser(user);
				return timeSheet;
			}
		} else {
			return null;
		}
	}

	public LocalDate endDate(TimeSheet timeSheet, User admin) {
		Optional<TimeSheet> adminTimeSheet = admin.getTimeSheets().stream().findAny();
		int month = timeSheet.getStart_date().getMonthValue();
		System.out.println(month + "month value");
		int year = timeSheet.getStart_date().getYear();
		System.out.println(year + "year value");
		int endDate = adminTimeSheet.get().getEnd_date().getDayOfMonth();
		DateTimeFormatter inputFormatter = null;
		if (month <= 9 && month >= 1 && endDate <= 9 && endDate >= 1) {
			month += 1;
			inputFormatter = DateTimeFormatter.ofPattern("yyyy-M-d");
		}

		else if (month <= 9 && month >= 1 && endDate >= 10 && endDate <= 31) {
			month += 1;
			inputFormatter = DateTimeFormatter.ofPattern("yyyy-M-dd");
		}

		else if (month == 10 || month == 11 && endDate >= 10 && endDate <= 31) {
			month += 1;
			inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		} else if (month == 10 || month == 11 && endDate <= 9 && endDate >= 1) {
			month += 1;
			System.out.println("four " + 3);
			inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-d");
		} else if (month == 12 && endDate <= 9 && endDate >= 1) {
			month = 1;
			year += 1;
			inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-d");
		} else if (month == 12 && endDate >= 10 && endDate <= 31) {
			month = 1;
			year += 1;
			inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		}
		return LocalDate.parse(year + "-" + month + "-" + endDate, inputFormatter);
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
