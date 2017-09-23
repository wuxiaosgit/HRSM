package com.xhhy.service;

import java.util.List;

import com.xhhy.domain.UserBean;

public interface UserService {
	public UserBean login(UserBean userBean);
	public UserBean getUserById(Integer userId);
	public void insertUser(UserBean userBean);
	public void updateUser(UserBean userBean);
	public void deleteUser(Integer userId);
	public List<UserBean> listUser(UserBean userBean);
	public Integer max(UserBean userBean);
}
