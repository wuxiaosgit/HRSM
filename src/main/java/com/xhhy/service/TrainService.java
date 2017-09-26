package com.xhhy.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.xhhy.domain.TrainBean;

public interface TrainService {

	public void insertTrain(TrainBean train);
	
	public List<TrainBean> listTrain(TrainBean train);
	
	public void saveTrainAndFilePath(TrainBean train,MultipartFile file) throws Exception;

	public TrainBean queryById(Integer trainId);
	
	public void deleteById(Integer trainId);
	
	public void updateById(TrainBean train);

	public Integer max(TrainBean train);

}
