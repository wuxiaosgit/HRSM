package com.xhhy.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.xhhy.dao.TrainDao;
import com.xhhy.domain.TrainBean;

@Service
public class TrainServiceImpl implements TrainService {
	
	@Autowired
	private TrainDao trainDao;

	public void insertTrain(TrainBean train) {
		trainDao.insertTrain(train);
	}

	public List<TrainBean> listTrain(TrainBean train) {
		train.setCurrentNum((train.getCurrentNum()-1)*10);
		List<TrainBean> listTrain = trainDao.listTrain(train);
		train.setCurrentNum(train.getCurrentNum()/8+1);
		return listTrain;
	}

	public void  saveTrainAndFilePath(TrainBean train,MultipartFile file) throws Exception {
		String basePath = "d:/upload/";
		
		UUID ui = UUID.randomUUID();
		String realPath = basePath+ui.toString()+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
		InputStream  in=null;
		OutputStream out = null;
		try {
			in = file.getInputStream();
			out = new FileOutputStream(realPath);
			FileCopyUtils.copy(in, out);
			train.setTrainZiliao(realPath);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}finally{
			in.close();
			out.close();
		}
		trainDao.insertTrain(train);
	}

	public TrainBean queryById(Integer trainId) {
		return trainDao.queryById(trainId);
	}

	public void deleteById(Integer trainId) {
		trainDao.deleteById(trainId);
	}

	public void updateById(TrainBean train) {
		trainDao.updateById(train);
		
	}

	public Integer max(TrainBean train) {
		return trainDao.max(train);
	}

}
