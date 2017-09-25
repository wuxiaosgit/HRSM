package com.xhhy.domain;

import java.util.Date;

public class TrainBean {

	private  Integer trainId;
	private  String  trainName;
	private  String  trainTeacher;
	private  String  trainGoal;//培训目的
	private  String    trainStart;
	private  String    trainEnd;
	private  Date    trainStarttime;
	private  Date   trainEndtime;
	private  String  trainPeople;
	private  String  trainJianjie;
	private  String  trainZiliao;//培训资料
	private  String  trainSumup;//培训总结
	private  Integer trainState;//审核状态 0：起草 1：审核中 2审核通过 3 驳回
	private  Integer trainFeekBack; //审核(培训)反馈 1优 2 良 3差
	private  Integer isDelete;  //逻辑删除(0:正常 1:删除)
	private  String  trainIdea;//审核意见
	private  String  trainResult;//考核结果
	
	
	
	
	
	/**
	 * @return the trainStart
	 */
	public String getTrainStart() {
		return trainStart;
	}



	/**
	 * @param trainStart the trainStart to set
	 */
	public void setTrainStart(String trainStart) {
		this.trainStart = trainStart;
	}



	/**
	 * @return the trainEnd
	 */
	public String getTrainEnd() {
		return trainEnd;
	}



	/**
	 * @param trainEnd the trainEnd to set
	 */
	public void setTrainEnd(String trainEnd) {
		this.trainEnd = trainEnd;
	}



	public String getTrainResult() {
		return trainResult;
	}

	

	public void setTrainResult(String trainResult) {
		this.trainResult = trainResult;
	}

	public String getTrainIdea() {
		return trainIdea;
	}

	public void setTrainIdea(String trainIdea) {
		this.trainIdea = trainIdea;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public Integer getTrainFeekBack() {
		return trainFeekBack;
	}

	public void setTrainFeekBack(Integer trainFeekBack) {
		this.trainFeekBack = trainFeekBack;
	}

	public Integer getTrainState() {
		return trainState;
	}


	public void setTrainState(Integer trainState) {
		this.trainState = trainState;
	}

	public Integer getTrainId() {
		return trainId;
	}

	public void setTrainId(Integer trainId) {
		this.trainId = trainId;
	}

	public String getTrainName() {
		return trainName;
	}

	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}

	public String getTrainTeacher() {
		return trainTeacher;
	}

	public void setTrainTeacher(String trainTeacher) {
		this.trainTeacher = trainTeacher;
	}

	public String getTrainGoal() {
		return trainGoal;
	}

	public void setTrainGoal(String trainGoal) {
		this.trainGoal = trainGoal;
	}

	public Date getTrainStarttime() {
		return trainStarttime;
	}

	public void setTrainStarttime(Date trainStarttime) {
		this.trainStarttime = trainStarttime;
	}

	public Date getTrainEndtime() {
		return trainEndtime;
	}

	public void setTrainEndtime(Date trainEndtime) {
		this.trainEndtime = trainEndtime;
	}

	public String getTrainPeople() {
		return trainPeople;
	}

	public void setTrainPeople(String trainPeople) {
		this.trainPeople = trainPeople;
	}

	public String getTrainJianjie() {
		return trainJianjie;
	}
	
	public void setTrainJianjie(String trainJianjie) {
		this.trainJianjie = trainJianjie;
	}

	public String getTrainZiliao() {
		return trainZiliao;
	}

	public void setTrainZiliao(String trainZiliao) {
		this.trainZiliao = trainZiliao;
	}

	public String getTrainSumup() {
		return trainSumup;
	}

	public void setTrainSumup(String trainSumup) {
		this.trainSumup = trainSumup;
	}

}
