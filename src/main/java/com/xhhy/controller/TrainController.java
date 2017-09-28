package com.xhhy.controller;

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
		
		train.setIsDelete(0);
		//文件上传 
		trainService.saveTrainAndFilePath(train,file);
		
		return listTrain(null);
	}
	
	@RequestMapping("list.do")
	public ModelAndView listTrain(TrainBean train){
		if(train==null){
			train = new TrainBean();
		}
		List<TrainBean> trainList = trainService.listTrain(train);
		ModelAndView mav = new ModelAndView();
		mav.addObject("trainList", trainList);
		mav.addObject("train", train);
		Integer max = trainService.max(train);
		mav.addObject("maxSize",max);//总记录数
		mav.addObject("pageNum",(int)Math.ceil(max/10.0));//总页数
		mav.addObject("currentPage",train.getCurrentNum());//当前页码 第几页，默认第一页
		
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
	@RequestMapping("updateTrain.do")
	public ModelAndView updateTrain(TrainBean train) throws Exception{
		trainService.updateById(train);
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
	public ModelAndView queryByState(TrainBean train){
		if(train == null){
			train = new TrainBean();
		}
		ModelAndView mav = new ModelAndView();
		if(train.getTrainState()==null ||train.getTrainState() != 1){
			train.setTrainState(1);
		}
		List<TrainBean> trainList = trainService.listTrain(train);
		mav.addObject("trainList", trainList);
		mav.addObject("train", train);
		
		Integer max = trainService.max(train);
		mav.addObject("maxSize",max);//总记录数
		mav.addObject("pageNum",(int)Math.ceil(max/10.0));//总页数
		mav.addObject("currentPage",train.getCurrentNum());//当前页码 第几页，默认第一页
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
	
	//培训复核/
	@RequestMapping("updateFuheTrain.do")
	public ModelAndView updateFuheTrain(TrainBean train) throws Exception{
		trainService.updateById(train);
		return queryByState(null);
	}
	
	//培训反馈--首页
	@RequestMapping("fankuiList.do")
	public ModelAndView fankuiTrainList(TrainBean train){
		if(train == null){
			train = new TrainBean();
		}
		ModelAndView mav = new ModelAndView();
		if(train.getTrainState()==null ||train.getTrainState() != 2){
			train.setTrainState(2);
		}
		List<TrainBean> trainList = trainService.listTrain(train);
		mav.addObject("trainList", trainList);
		mav.addObject("train", train);
		
		Integer max = trainService.max(train);
		mav.addObject("maxSize",max);//总记录数
		mav.addObject("pageNum",(int)Math.ceil(max/10.0));//总页数
		mav.addObject("currentPage",train.getCurrentNum());//当前页码 第几页，默认第一页
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

		return fankuiTrainList(null);
	}
	
}
