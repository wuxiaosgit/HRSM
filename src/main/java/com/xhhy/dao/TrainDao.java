package com.xhhy.dao;

import java.util.List;

import com.xhhy.domain.TrainBean;

public interface TrainDao {

	public void insertTrain(TrainBean train);
	
	public List<TrainBean> listTrain(TrainBean train);
	
	public TrainBean queryById(Integer trainId);
	
	public void deleteById(Integer trainId);

	public void updateById(TrainBean train);

	public Integer max(TrainBean train);

	public TrainBean queryByName(String trainName);

}
