package com.xhhy.dao;

import java.util.List;

import com.xhhy.domain.UserBean;

public interface UserDao {
	public UserBean getUserById(Integer userId);
	public UserBean login(UserBean userBean);
	public void insertUser(UserBean userBean);
	public void updateUser(UserBean userBean);
	public void deleteUser(Integer userId);
	public List<UserBean> listUser(UserBean userBean);
	
}
