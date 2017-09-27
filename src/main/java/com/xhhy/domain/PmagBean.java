package com.xhhy.domain;

import java.io.File;
import java.io.Serializable;
import java.sql.Date;

import org.springframework.util.FileCopyUtils;

public class PmagBean implements Serializable{

	private int pmagId;//编码ID
	private String pmagCode;	//档案编码
	private String pmagDept;//部门
	private String pmagDoom;//职位
	private String pmagDoomCode;//职位编码
	private String pmagCheng;//职称
	private String pmagName;//姓名
	private String pmagSex;//性别
	private String pmagEmai;//Email
	private String pmagPhone;//联系电话
	private String pmagAddress;//住址
	private String pmagShen;//身份
	private String pmagHuKou;//户口所在地
	private String pmagMiao;//政治面貌
	private String pmagXiao;//毕业学校
	private String pmagYe;//专业
	private String pmagLi;//学历
	private String pmagJing;//经历
	private String pmagState;//审核状态
	private String pmagVerifyState;//档案状态
	private String pmagMoney;//薪酬标准
	private String pmagBank;//开户行
	private String pmagBankId;//银行卡号
	private String pmagInsuranceId;//社保卡号
	private String pmagPeg;//登记人
	private Date pmagTime;//建党时间
	private String pmagFamily;//家庭关系
	private String pmagRemark;//备注
	public int getPmagId() {
		return pmagId;
	}
	public void setPmagId(int pmagId) {
		this.pmagId = pmagId;
	}
	public String getPmagCode() {
		return pmagCode;
	}
	public void setPmagCode(String pmagCode) {
		this.pmagCode = pmagCode;
	}
	public String getPmagDept() {
		return pmagDept;
	}
	public void setPmagDept(String pmagDept) {
		this.pmagDept = pmagDept;
	}
	public String getPmagDoom() {
		return pmagDoom;
	}
	public void setPmagDoom(String pmagDoom) {
		this.pmagDoom = pmagDoom;
	}
	public String getPmagDoomCode() {
		return pmagDoomCode;
	}
	public void setPmagDoomCode(String pmagDoomCode) {
		this.pmagDoomCode = pmagDoomCode;
	}
	public String getPmagCheng() {
		return pmagCheng;
	}
	public void setPmagCheng(String pmagCheng) {
		this.pmagCheng = pmagCheng;
	}
	public String getPmagName() {
		return pmagName;
	}
	public void setPmagName(String pmagName) {
		this.pmagName = pmagName;
	}
	public String getPmagSex() {
		return pmagSex;
	}
	public void setPmagSex(String pmagSex) {
		this.pmagSex = pmagSex;
	}
	public String getPmagEmai() {
		return pmagEmai;
	}
	public void setPmagEmai(String pmagEmai) {
		this.pmagEmai = pmagEmai;
	}
	public String getPmagPhone() {
		return pmagPhone;
	}
	public void setPmagPhone(String pmagPhone) {
		this.pmagPhone = pmagPhone;
	}
	public String getPmagAddress() {
		return pmagAddress;
	}
	public void setPmagAddress(String pmagAddress) {
		this.pmagAddress = pmagAddress;
	}
	public String getPmagShen() {
		return pmagShen;
	}
	public void setPmagShen(String pmagShen) {
		this.pmagShen = pmagShen;
	}
	public String getPmagHuKou() {
		return pmagHuKou;
	}
	public void setPmagHuKou(String pmagHuKou) {
		this.pmagHuKou = pmagHuKou;
	}
	public String getPmagMiao() {
		return pmagMiao;
	}
	public void setPmagMiao(String pmagMiao) {
		this.pmagMiao = pmagMiao;
	}
	public String getPmagXiao() {
		return pmagXiao;
	}
	public void setPmagXiao(String pmagXiao) {
		this.pmagXiao = pmagXiao;
	}
	public String getPmagYe() {
		return pmagYe;
	}
	public void setPmagYe(String pmagYe) {
		this.pmagYe = pmagYe;
	}
	public String getPmagLi() {
		return pmagLi;
	}
	public void setPmagLi(String pmagLi) {
		this.pmagLi = pmagLi;
	}
	public String getPmagJing() {
		return pmagJing;
	}
	public void setPmagJing(String pmagJing) {
		this.pmagJing = pmagJing;
	}
	public String getPmagState() {
		return pmagState;
	}
	public void setPmagState(String pmagState) {
		this.pmagState = pmagState;
	}
	public String getPmagVerifyState() {
		return pmagVerifyState;
	}
	public void setPmagVerifyState(String pmagVerifyState) {
		this.pmagVerifyState = pmagVerifyState;
	}
	public String getPmagMoney() {
		return pmagMoney;
	}
	public void setPmagMoney(String pmagMoney) {
		this.pmagMoney = pmagMoney;
	}
	public String getPmagBank() {
		return pmagBank;
	}
	public void setPmagBank(String pmagBank) {
		this.pmagBank = pmagBank;
	}
	public String getPmagBankId() {
		return pmagBankId;
	}
	public void setPmagBankId(String pmagBankId) {
		this.pmagBankId = pmagBankId;
	}
	public String getPmagInsuranceId() {
		return pmagInsuranceId;
	}
	public void setPmagInsuranceId(String pmagInsuranceId) {
		this.pmagInsuranceId = pmagInsuranceId;
	}
	public String getPmagPeg() {
		return pmagPeg;
	}
	public void setPmagPeg(String pmagPeg) {
		this.pmagPeg = pmagPeg;
	}
	public Date getPmagTime() {
		return pmagTime;
	}
	public void setPmagTime(Date pmagTime) {
		this.pmagTime = pmagTime;
	}
	public String getPmagFamily() {
		return pmagFamily;
	}
	public void setPmagFamily(String pmagFamily) {
		this.pmagFamily = pmagFamily;
	}
	public String getPmagRemark() {
		return pmagRemark;
	}
	public void setPmagRemark(String pmagRemark) {
		this.pmagRemark = pmagRemark;
	}
	
}
