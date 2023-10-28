package com.tyss.ams_mvc.controller;

import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tyss.ams_mvc.entity.Batch;
import com.tyss.ams_mvc.service.BatchService;
import com.tyss.ams_mvc.util.BatchMode;
import com.tyss.ams_mvc.util.BatchStatus;

@Controller
public class BatchController {

	@Autowired
	BatchService batchService;

	@RequestMapping("/createbatch")
	public ModelAndView saveBatch() {
		ModelAndView modelAndView = new ModelAndView("createbatch");
		return modelAndView;
	}

	@RequestMapping("/savebatch")
	public ModelAndView saveBatch(HttpServletRequest req, ModelAndView mv, Batch batch) {
		batch.setBatchCode(req.getParameter("batchcode"));
		batch.setSubjectName(req.getParameter("subname"));
		batch.setBatchStatus(BatchStatus.valueOf(req.getParameter("batchstatus")));
		batch.setBatchStartDate(LocalDate.of(Integer.parseInt(req.getParameter("startyear")),
				Integer.parseInt(req.getParameter("startmonth")), Integer.parseInt(req.getParameter("startday"))));
		batch.setLoginTime(LocalTime.of(Integer.parseInt(req.getParameter("logintime")), 00));
		batch.setLogoutTime(LocalTime.of(Integer.parseInt(req.getParameter("logouttime")), 00));
		batch.setBatchMode(BatchMode.valueOf(req.getParameter("batchmode")));
		batch.setInstituteName(req.getParameter("institutename"));
		batch.setLocation(req.getParameter("institutelocation"));
		batchService.saveBatch(batch);
		mv.setViewName("allbatchs");
		mv.addObject("msg", "Batch Created Successfully...");
		return findAllbatchs(mv);
	}

	public ModelAndView findAllbatchs(ModelAndView mv) {
		mv.addObject("batchs", batchService.findAllBatchs());
		return mv;
	}

	@RequestMapping("/deletebatch")
	public ModelAndView deleteBatch(ModelAndView mv, HttpServletRequest request) {
		if (batchService.deleteBatch(Integer.parseInt(request.getParameter("id")))) {
			mv.addObject("msg", "Batch deleted Successfully...");
			mv.setViewName("allbatchs");
			return findAllbatchs(mv);
		}
		mv.addObject("msg", "Batch deleted Successfully...");
		mv.setViewName("allbatchs");
		return findAllbatchs(mv);
	}

	@RequestMapping("/updatebatch")
	public ModelAndView updateBatch(ModelAndView mv, HttpServletRequest req) {
		Batch b = batchService.findBatchById(Integer.parseInt(req.getParameter("id")));
		mv.addObject("bat", b);
		mv.setViewName("updatebatchpage");
		return mv;
	}

	@RequestMapping("/updatebatchlogic")
	public ModelAndView updateBatchLogic(HttpServletRequest req, ModelAndView mv, Batch batch) {
		batch.setBatchId(Integer.parseInt(req.getParameter("batchid")));
		batch.setBatchCode(req.getParameter("batchcode"));
		batch.setSubjectName(req.getParameter("subname"));
		batch.setBatchStatus(BatchStatus.valueOf(req.getParameter("batchstatus")));
		batch.setBatchStartDate(LocalDate.of(Integer.parseInt(req.getParameter("startyear")),
				Integer.parseInt(req.getParameter("startmonth")), Integer.parseInt(req.getParameter("startday"))));
		batch.setLoginTime(LocalTime.of(Integer.parseInt(req.getParameter("logintime")), 00));
		batch.setLogoutTime(LocalTime.of(Integer.parseInt(req.getParameter("logouttime")), 00));
		batch.setBatchMode(BatchMode.valueOf(req.getParameter("batchmode")));
		batch.setInstituteName(req.getParameter("institutename"));
		batch.setLocation(req.getParameter("institutelocation"));
		batchService.updateBatch(batch);
		mv.setViewName("allbatchs");
		mv.addObject("msg", "Batch Updated Successfully...");
		return findAllbatchs(mv);
	}

}
