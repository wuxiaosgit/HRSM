package com.xhhy.domain;

import java.util.Date;

public class WageBean {
	private int wageId;
	private String wageBm;
	
	private String wageName;
	private String wageDate;
	private String zzrName;
	private String djrName;
	private float basePay;
	private float awarPay;
	private float travelPay;
	private float phonePay;
	private float mealPay;
	private float housePay;
	private float missionPay;
	private float overtimePay;
	private float all;
	public String getWageBm() {
		return wageBm;
	}
	public void setWageBm(String wageBm) {
		this.wageBm = wageBm;
	}
	public float getAll() {
		return all;
	}
	public void setAll(float all) {
		this.all = all;
	}
	private String remark;
	public int getWageId() {
		return wageId;
	}
	public void setWageId(int wageId) {
		this.wageId = wageId;
	}
	public String getWageName() {
		return wageName;
	}
	public void setWageName(String wageName) {
		this.wageName = wageName;
	}
	public String getWageDate() {
		return wageDate;
	}
	public void setWageDate(String wageDate) {
		this.wageDate = wageDate;
	}
	public String getZzrName() {
		return zzrName;
	}
	public void setZzrName(String zzrName) {
		this.zzrName = zzrName;
	}
	public String getDjrName() {
		return djrName;
	}
	public void setDjrName(String djrName) {
		this.djrName = djrName;
	}
	public float getBasePay() {
		return basePay;
	}
	public void setBasePay(float basePay) {
		this.basePay = basePay;
	}
	public float getAwarPay() {
		return awarPay;
	}
	public void setAwarPay(float awarPay) {
		this.awarPay = awarPay;
	}
	public float getTravelPay() {
		return travelPay;
	}
	public void setTravelPay(float travelPay) {
		this.travelPay = travelPay;
	}
	public float getPhonePay() {
		return phonePay;
	}
	public void setPhonePay(float phonePay) {
		this.phonePay = phonePay;
	}
	public float getMealPay() {
		return mealPay;
	}
	public void setMealPay(float mealPay) {
		this.mealPay = mealPay;
	}
	public float getHousePay() {
		return housePay;
	}
	public void setHousePay(float housePay) {
		this.housePay = housePay;
	}
	public float getMissionPay() {
		return missionPay;
	}
	public void setMissionPay(float missionPay) {
		this.missionPay = missionPay;
	}
	public float getOvertimePay() {
		return overtimePay;
	}
	public void setOvertimePay(float overtimePay) {
		this.overtimePay = overtimePay;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
}
