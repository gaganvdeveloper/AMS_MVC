package com.tyss.ams_mvc.dao;

import java.util.List;

import com.tyss.ams_mvc.entity.TimeSheet;

public interface TimeSheetDao {
	TimeSheet saveTimeSheet(TimeSheet timeSheet);

	TimeSheet updateTimeSheet(TimeSheet timeSheet);

	void deleteTimeSheetById(int id);

	List<TimeSheet> findAllTimeSheetByUserId(int userId);

	List<TimeSheet> findAllTimeSheets();

	public TimeSheet findBytimesheet_id(int id);

}
