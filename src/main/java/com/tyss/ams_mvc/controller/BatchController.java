package com.tyss.ams_mvc.controller;

import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tyss.ams_mvc.dto.BatchDto;
import com.tyss.ams_mvc.entity.Batch;
import com.tyss.ams_mvc.entity.User;
import com.tyss.ams_mvc.service.BatchService;
import com.tyss.ams_mvc.service.UserService;
import com.tyss.ams_mvc.util.BatchConversion;
import com.tyss.ams_mvc.util.BatchMode;
import com.tyss.ams_mvc.util.BatchStatus;

@Controller
public class BatchController {

	@Autowired
	BatchService batchService;

	@Autowired
	UserService userService;
	
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
		batch.setBatchEndDate(LocalDate.of(Integer.parseInt(req.getParameter("startyear")),
				Integer.parseInt(req.getParameter("startmonth")), Integer.parseInt(req.getParameter("startday"))));
		batch.setLoginTime(LocalTime.of(Integer.parseInt(req.getParameter("logintime")), 00));
		batch.setLogoutTime(LocalTime.of(Integer.parseInt(req.getParameter("logouttime")), 00));
		batch.setBatchMode(BatchMode.valueOf(req.getParameter("batchmode")));
		batch.setInstituteName(req.getParameter("institutename"));
		batch.setLocation(req.getParameter("institutelocation"));
		batchService.saveBatch(batch);
		mv.addObject("user",req.getSession().getAttribute("user"));
		mv.setViewName("allbatchs");
		mv.addObject("msg", "Batch Created");
		return findAllbatchs(mv);
	}
	
	@RequestMapping(value = "/allbatchs")
	public ModelAndView findAllbatchs(ModelAndView mv,HttpServletRequest req) {
		mv.addObject("user",(User)req.getSession().getAttribute("user"));
		mv.addObject("batchs", batchService.findAllBatchs());
		mv.addObject("msg","All Batchs");
		return mv;
	}
	
	public ModelAndView findAllbatchs(ModelAndView mv) {
		mv.addObject("batchs", batchService.findAllBatchs());
		return mv;
	}
	
	@RequestMapping("/allnonassignedbatchs")
	public ModelAndView displayAllNotAssignedBatches(ModelAndView mv,HttpServletRequest req) {
		mv.addObject("user",req.getSession().getAttribute("user"));
		mv.addObject("batchs",batchService.findAllNotAssignedBatches());
		mv.addObject("msg","All NON_ASSIGNED Batchs");
		mv.setViewName("allbatchs");
		return mv;
	}
	
	@RequestMapping(value = "/allongoingbatchs")
	public ModelAndView allOnGoingBatchs(ModelAndView mv,HttpServletRequest req) {
		mv.addObject("batchs",batchService.findAllOnGoingBatchs());
		mv.addObject("user",req.getSession().getAttribute("user"));
		mv.addObject("msg","All ON_GOING Batchs");
		mv.setViewName("allbatchs");
		return mv;
	}
	
	@RequestMapping(value = "/allcompletedbatchs")
	public ModelAndView allCompletedBatchs(ModelAndView mv,HttpServletRequest req) {
		mv.addObject("batchs",batchService.findAllCompletedBatchs());
		mv.addObject("user",req.getSession().getAttribute("user"));
		mv.addObject("msg","All COMPLETED Batchs");
		mv.setViewName("allbatchs");
		return mv;
	}
	
	@RequestMapping("/deletebatch")
	public ModelAndView deleteBatch(ModelAndView mv, HttpServletRequest request) {
		if (batchService.deleteBatch(Integer.parseInt(request.getParameter("id")))) {
			mv.addObject("msg", "Batch Deleted");
			mv.setViewName("allbatchs");
			return findAllbatchs(mv);
		}
		mv.addObject("msg", "Batch deleted Successfully...");
		mv.setViewName("allbatchs");
		return findAllbatchs(mv);
	}

	@RequestMapping("/updatebatch")
	public ModelAndView updateBatch(ModelAndView mv, HttpServletRequest req) {
		Batch batch = batchService.findBatchById(Integer.parseInt(req.getParameter("id")));
		try {
			mv.addObject("bat", BatchConversion.convert(batch));
			mv.setViewName("updatebatchpage");
		}catch(Exception e) {
			mv.addObject("bat", BatchConversion.convert1(batch));
			mv.setViewName("updatebatchpage");
			return mv;
		}
		return mv;
	}

	@RequestMapping("/updatebatchlogic")
	public ModelAndView updateBatchLogic(HttpServletRequest req, ModelAndView mv, @ModelAttribute BatchDto batchDto) {
		Batch batch = null;
		try {
			batch = BatchConversion.convert(batchDto);
			batch.setUser(userService.findUserById(batchDto.getUserId()));
			System.out.println("User : "+userService.findUserById(batchDto.getUserId()));
			System.out.println("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb"+batch.getBatchId());
		}catch(Exception e) {
			batch = BatchConversion.convert1(batchDto);
			System.out.println("cccccccccccccccccccccccccccccccccccccccccccccccccccccccc");
		}
		batchService.updateBatch(batch);
		mv.addObject("user",req.getSession().getAttribute("user"));
		mv.addObject("msg", "Batch Updated");
		mv.setViewName("allbatchs");
		return findAllbatchs(mv);
	}

}
