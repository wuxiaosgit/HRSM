package com.xhhy.dao;

import java.util.List;

import com.xhhy.domain.UserBean;

public interface UserDao {
	
	public UserBean login(UserBean userBean);
	public void insertUser(UserBean user);
	
	public List<UserBean> listUser(UserBean userBean);
	
}
