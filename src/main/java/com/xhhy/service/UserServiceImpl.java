package com.xhhy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xhhy.dao.UserDao;
import com.xhhy.domain.UserBean;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	public void insertUser(UserBean user) {
		userDao.insertUser(user);
		/*String str = null;
		System.out.println(str.length());*/
	}



	

	public UserBean login(UserBean userBean) {
		// TODO Auto-generated method stub
		return userDao.login(userBean);
	}





	public List<UserBean> listUser(UserBean userBean) {
		// TODO Auto-generated method stub
		if (userBean.getUserName()!=null&&!"".equals(userBean.getUserName())) {
			
			userBean.setUserName("%"+userBean.getUserName()+"%");
		}
		return userDao.listUser(userBean);
	}

}
