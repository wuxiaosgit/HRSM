package com.xhhy.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xhhy.dao.TrainDao;
import com.xhhy.domain.TrainBean;

@Service
public class TrainServiceImpl implements TrainService {
	
	@Resource
	private TrainDao trainDao;

	public void insertTrain(TrainBean train) {
		trainDao.insertTrain(train);
	}

	public List<TrainBean> listTrain() {
		return trainDao.listTrain();
	}

}
