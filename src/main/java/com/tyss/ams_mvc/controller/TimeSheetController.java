package com.tyss.ams_mvc.controller;

import java.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tyss.ams_mvc.entity.TimeSheet;
import com.tyss.ams_mvc.service.TimeSheetService;

@Controller
public class TimeSheetController {

	@Autowired
	TimeSheetService timeSheetService;

	@RequestMapping("/timesheet")
	public ModelAndView test(ModelAndView mv) {
		mv.setViewName("timesheet");
		return mv;
	}

	@RequestMapping("/create")
	public ModelAndView createTimeSheet(TimeSheet timeSheet, @RequestParam(name = "id") int userId, ModelAndView mv) {
		timeSheet.setStart_date(LocalDate.now());
		TimeSheet sheet = timeSheetService.saveTimeSheet(timeSheet, userId);
		if (sheet != null)
			mv.addObject("msg", "timesheet saved successfully");
		else
			mv.addObject("msg", "timesheet not saved");
		mv.setViewName("timesheet");
		return mv;
	}

	@RequestMapping("/display")
	public ModelAndView displayTimesheetByUserId(@RequestParam(name = "id") int user_id, ModelAndView mv) {
		mv.addObject("findAllTimeSheetOfUser", timeSheetService.findAllTimeSheetOfUser(user_id));
		mv.setViewName("displayTimeSheet");
		return mv;
	}

	@RequestMapping("/update")
	public ModelAndView updateTimeSheet(@ModelAttribute TimeSheet timeSheet, ModelAndView mv) {
		TimeSheet sheet = timeSheetService.updateTimeSheet(timeSheet);
		if (sheet != null)
			mv.addObject("msg", "time sheet with id :'" + timeSheet.getTimesheetId() + "' has been updated ");
		else
			mv.addObject("msg", "time sheet with id :'" + timeSheet.getTimesheetId() + "' has not been updated ");
		mv.setViewName("displayTimeSheet");
		return mv;
	}

	@RequestMapping("/timesheetById")
	public ModelAndView findTimeSheetById(@RequestParam int id, ModelAndView mv) {
		TimeSheet timeSheet = timeSheetService.findTimeSheetById(id);
		mv.addObject("msg", "time sheet with id :'" + timeSheet.getTimesheetId() + "' has been updated ");
		mv.setViewName("displayTimeSheet");
		return mv;
	}

	@RequestMapping("/delete")
	public ModelAndView deleteTimeSheetById(@RequestParam int id, @RequestParam int user_id, ModelAndView mv) {
		try {
			timeSheetService.deleteTimeSheetById(id, user_id);
			mv.addObject("msg", "time sheet with id :'" + id + "' deleted successfully");
		} catch (Exception e) {
			mv.addObject("msg", "time sheet with id :'" + id + "' got error while deleting ");
		}
		mv.setViewName("displayTimeSheet");
		return mv;
	}

}
