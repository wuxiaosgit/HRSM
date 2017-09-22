package com.xhhy.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xhhy.domain.TrainBean;
import com.xhhy.service.TrainService;
import com.xhhy.utils.DateUtil;

@Controller
@RequestMapping("train")
public class TrainController {
	
	@Resource
	private TrainService trainService;

	@RequestMapping("insert.do")
	public String insertTrain(){
		
		TrainBean train = new TrainBean();
		train.setTrainName("面试培训");
		train.setTrainTeacher("杨欣华");
		train.setTrainGoal("");
		
		Date dateStr = DateUtil.stringToDate("2017.09.20","yyyy-MM:dd");
		train.setTrainStarttime(dateStr);
		train.setTrainEndtime(dateStr);
		train.setTrainPeople("李连阳、王明");
		train.setTrainJianjie("面试技巧");
		train.setTrainZiliao("d://peixun/mianshipeixun");
		train.setTrainSumup("总结：好");
		train.setTrainState(2);//表示审核通过
		train.setTrainFeedBack(1);
		
		trainService.insertTrain(train);
		return "../peixun/add.jsp";
	}
	
	@RequestMapping("list.do")
	public ModelAndView listTrain(){
		List<TrainBean> trainList = trainService.listTrain();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("trainList", trainList);
		mav.setViewName("../html/peixun/peixunjihua/list.jsp");
		
		return mav;
	}
	
	@RequestMapping("queryLIike.do")
	public void queryLike(TrainBean train){
		
	}
}
