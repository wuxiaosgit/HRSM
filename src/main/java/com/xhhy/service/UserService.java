package com.xhhy.service;

import java.util.List;

import com.xhhy.domain.UserBean;

public interface UserService {
	public UserBean login(UserBean userBean);
	public void insertUser(UserBean user);
	public List<UserBean> listUser(UserBean userBean);
}
