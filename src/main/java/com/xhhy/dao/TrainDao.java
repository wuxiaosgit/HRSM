package com.xhhy.dao;

import java.util.List;

import com.xhhy.domain.TrainBean;

public interface TrainDao {

	public void insertTrain(TrainBean train);
	
	public List<TrainBean> listTrain();
	
	public List<TrainBean> queryLike(TrainBean train);
}
