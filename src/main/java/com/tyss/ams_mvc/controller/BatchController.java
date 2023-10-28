package com.tyss.ams_mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tyss.ams_mvc.entity.Batch;
import com.tyss.ams_mvc.service.BatchService;

@Controller
public class BatchController {

	@Autowired
	BatchService batchService;

	@RequestMapping("/batchcreatepage")
	public ModelAndView saveBatch() {
		ModelAndView modelAndView = new ModelAndView("createbatch");
		modelAndView.addObject("u", new Batch());
		return modelAndView;
	}

	@RequestMapping("/savebatch")
	public String saveBatch(@ModelAttribute Batch batch) {
		System.out.println(batch.getBatchEndDate());
//		batchService.saveBatch(batch);
		return "Batch saved";
	}
}
