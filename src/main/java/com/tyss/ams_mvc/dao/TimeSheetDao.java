package com.tyss.ams_mvc.dao;

import java.util.List;

import com.tyss.ams_mvc.entity.TimeSheet;

public interface TimeSheetDao {
	TimeSheet saveTimeSheet(TimeSheet timeSheet);

	TimeSheet updateTimeSheet(TimeSheet timeSheet);

	TimeSheet findTimeSheetById(int id);

	void deleteTimeSheetById(int id);

	List<TimeSheet> findAllTimeSheets();

	List<TimeSheet> findAllTimeSheetByUserId(int userId);

	public TimeSheet findBytimesheet_id(int id);
}
