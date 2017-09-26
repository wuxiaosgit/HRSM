package com.xhhy.domain;

import java.util.Date;

public class TrainBean {

	private  Integer trainId;
	private  String  trainName;
	private  String  trainTeacher;//培训讲师
	private  String  trainGoal;//培训目的

	private  String    trainStarttime;//开始事件
	private  String    trainEndtime;//结束事件
	private  String  trainPeople;//参会人员
	private  String  trainJianjie;//简介
	private  String  trainZiliao;//资料

	private  String  trainSumup;//培训总结
	private  Integer trainState;//审核状态 0：起草 1：审核中 2审核通过 3 驳回
	private  Integer trainFeekBack; //审核(培训)反馈 1优 2 良 3差
	private  Integer isDelete;  //逻辑删除(0:正常 1:删除)
	private  String  trainIdea;//审核意见
	private  String  trainResult;//考核结果
	

	private Integer currentNum = 1;//当前数据，第几条，默认第一条，用作分页
	
	public Integer getCurrentNum() {
		return currentNum;
	}

	public void setCurrentNum(Integer currentNum) {
		this.currentNum = currentNum;
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

	public String getTrainStarttime() {
		return trainStarttime;
	}

	public void setTrainStarttime(String trainStarttime) {
		this.trainStarttime = trainStarttime;
	}

	public String getTrainEndtime() {
		return trainEndtime;
	}

	public void setTrainEndtime(String trainEndtime) {
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

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "TrainBean [trainId=" + trainId + ", trainName=" + trainName + ", trainTeacher=" + trainTeacher
				+ ", trainGoal=" + trainGoal + ", trainStarttime=" + trainStarttime + ", trainEndtime=" + trainEndtime
				+ ", trainPeople=" + trainPeople + ", trainJianjie=" + trainJianjie + ", trainZiliao=" + trainZiliao
				+ ", trainSumup=" + trainSumup + ", trainState=" + trainState + ", trainFeekBack=" + trainFeekBack
				+ ", isDelete=" + isDelete + ", trainIdea=" + trainIdea + ", trainResult=" + trainResult
				+ ", currentNum=" + currentNum + "]";
	}
	
	

}
