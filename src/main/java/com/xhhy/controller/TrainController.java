package com.xhhy.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.xhhy.domain.TrainBean;
import com.xhhy.service.TrainService;

@Controller
@RequestMapping("train")
public class TrainController {
	
	@Autowired
	private TrainService trainService;

	//添加
	@RequestMapping("insert.do")
	public ModelAndView insertTrain(TrainBean train,@RequestParam("file")MultipartFile file) throws Exception{
		System.out.println("0");
		TrainBean newTrain = new TrainBean();
		newTrain.setTrainName(train.getTrainName());
		newTrain.setTrainTeacher(train.getTrainTeacher());
		newTrain.setTrainGoal(train.getTrainGoal());
		
		newTrain.setTrainStarttime(train.getTrainStarttime());
		newTrain.setTrainEndtime(train.getTrainEndtime());
		newTrain.setTrainPeople(train.getTrainPeople());
		newTrain.setTrainJianjie(train.getTrainJianjie());
		newTrain.setTrainState(train.getTrainState());
		newTrain.setTrainFeekBack(1);
		newTrain.setIsDelete(0);
		
		//文件上传 
		trainService.saveTrainAndFilePath(newTrain,file);
		
		return listTrain(null);
	}
	
	@RequestMapping("list.do")
	public ModelAndView listTrain(TrainBean train){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
		if(train != null){
			try {
				train.setTrainStarttime(sdf.parse(train.getTrainStart()));
				train.setTrainEndtime(sdf.parse(train.getTrainEnd()));
			} catch(ParseException e) {
				e.printStackTrace();
			}
		}else{
			train= new TrainBean();
			
		}
		List<TrainBean> trainList = trainService.listTrain(train);
		ModelAndView mav = new ModelAndView();
		mav.addObject("trainList", trainList);
		mav.setViewName("../html/peixun/peixunjihua/list.jsp");
		return mav;
	}
	
	//查询详情
	@RequestMapping("queryViewById.do")
	public ModelAndView queryViewById(Integer trainId){
		TrainBean train = trainService.queryById(trainId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("train", train);
		mav.setViewName("../html/peixun/peixunjihua/view.jsp");
		
		return mav;
	}
		
		
	//预修改
	@RequestMapping("toEdit.do")
	public ModelAndView toEdit(Integer trainId){
		TrainBean train = trainService.queryById(trainId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("train", train);
		mav.setViewName("../html/peixun/peixunjihua/edit.jsp");
		
		return mav;
	}
	
	//修改
	/**
	 * @param @RequestParam("file")MultipartFile file
	 */
	@RequestMapping("updateTrain.do")
	public ModelAndView updateTrain(TrainBean train) throws Exception{
		
		trainService.updateById(train);
		//trainService.saveTrainAndFilePath(train,file);
		
		return listTrain(null);
	}
	
	@RequestMapping("deleteById.do")
	public ModelAndView deleteById(Integer trainId){
		trainService.deleteById(trainId);
		return listTrain(null);
	}
	
	
	
	/*
	 * 培训复核
	 */
	//复核首页查询
	@RequestMapping("fuheList.do")
	public ModelAndView queryByState(){
		List<TrainBean> trainList = trainService.queryByState(1);
		ModelAndView mav = new ModelAndView();
		mav.addObject("trainList", trainList);
		mav.setViewName("../html/peixun/peixunfuhe/list.jsp");
		return mav;
	}
	
	//预修改--培训复核
	@RequestMapping("toFuheTrain.do")
	public ModelAndView toFuHeTrain(Integer trainId){
		TrainBean train = trainService.queryById(trainId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("train", train);
		mav.setViewName("../html/peixun/peixunfuhe/fuhe.jsp");
		
		return mav;
	}
	
	//培训复核-培训复核
	@RequestMapping("updateFuheTrain.do")
	public ModelAndView updateFuheTrain(TrainBean train) throws Exception{
		
		trainService.updateById(train);
		//trainService.saveTrainAndFilePath(train,file);
		
		return listTrain(null);
	}
	
	//培训反馈--首页
	@RequestMapping("fankuiList.do")
	public ModelAndView fankuiTrainList(){
		List<TrainBean> trainList = trainService.queryByState(2);
		ModelAndView mav = new ModelAndView();
		mav.addObject("trainList", trainList);
		mav.setViewName("../html/peixun/peixunfankui/list.jsp");
		return mav;
	}
	
	
	//培训反馈--预修改
	@RequestMapping("toFankuiTrain.do")
	public ModelAndView toFankuiTrain(Integer trainId){
		TrainBean train = trainService.queryById(trainId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("train", train);
		mav.setViewName("../html/peixun/peixunfankui/fankui.jsp");
		
		return mav;
	}
	
	//培训反馈--修改
	@RequestMapping("updateFankuiTrain.do")
	public ModelAndView updateFankuiTrain(TrainBean train) throws Exception{
		
		trainService.updateById(train);
		//trainService.saveTrainAndFilePath(train,file);
		
		return listTrain(null);
	}
	
	
	
	
	
}
