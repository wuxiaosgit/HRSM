package com.xhhy.service;

import java.util.List;

import com.xhhy.domain.TrainBean;

public interface TrainService {

	public void insertTrain(TrainBean train);
	
	public List<TrainBean> listTrain();
}
