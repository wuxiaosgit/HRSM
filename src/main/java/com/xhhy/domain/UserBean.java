package com.xhhy.domain;

import java.io.Serializable;

public class UserBean implements Serializable{
	
	private Integer userId;
	private Integer roleId;

	private RoleBean roleBean;

	private Integer deptId;

	private String userName;
	private String userLogin;
	private String userAddress;
	private String userPassword;
	private int userState;
	private String userGender;
	private String userIdcard;
	private String userPhone;
	private String userTelephone;
	private String userEmail;
	private String userPicture;
	private String userRemark;


	public RoleBean getRoleBean() {
		return roleBean;
	}
	public void setRoleBean(RoleBean roleBean) {
		this.roleBean = roleBean;
	}
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserLogin() {
		return userLogin;
	}
	public void setUserLogin(String userLogin) {
		this.userLogin = userLogin;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public int getUserState() {
		return userState;
	}
	public void setUserState(int userState) {
		this.userState = userState;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserIdcard() {
		return userIdcard;
	}
	public void setUserIdcard(String userIdcard) {
		this.userIdcard = userIdcard;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserTelephone() {
		return userTelephone;
	}
	public void setUserTelephone(String userTelephone) {
		this.userTelephone = userTelephone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPicture() {
		return userPicture;
	}
	public void setUserPicture(String userPicture) {
		this.userPicture = userPicture;
	}
	public String getUserRemark() {
		return userRemark;
	}
	public void setUserRemark(String userRemark) {
		this.userRemark = userRemark;
	}
	@Override
	public String toString() {
		return "UserBean [userId=" + userId + ", roleId=" + roleId + ", roleBean=" + roleBean + ", deptId=" + deptId
				+ ", userName=" + userName + ", userLogin=" + userLogin + ", userAddress=" + userAddress
				+ ", userPassword=" + userPassword + ", userState=" + userState + ", userGender=" + userGender
				+ ", userIdcard=" + userIdcard + ", userPhone=" + userPhone + ", userTelephone=" + userTelephone
				+ ", userEmail=" + userEmail + ", userPicture=" + userPicture + ", userRemark=" + userRemark + "]";
	}
	
	
}
