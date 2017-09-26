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

	public void insertUser(UserBean userBean) {
		userDao.insertUser(userBean);
	}



	

	public UserBean login(UserBean userBean) {
		// TODO Auto-generated method stub
		return userDao.login(userBean);
	}





	public List<UserBean> listUser(UserBean userBean) {
		// TODO Auto-generated method stub
		userBean.setCurrentNum((userBean.getCurrentNum()-1)*8);
		List<UserBean> listUser = userDao.listUser(userBean);
		userBean.setCurrentNum(userBean.getCurrentNum()/8+1);
		
		return listUser;
	}





	public void deleteUser(Integer userId) {
		// TODO Auto-generated method stub
		userDao.deleteUser(userId);
	}





	public UserBean getUserById(Integer userId) {
		// TODO Auto-generated method stub
		return userDao.getUserById(userId);
	}





	public void updateUser(UserBean userBean) {
		// TODO Auto-generated method stub
		userDao.updateUser(userBean);
	}





	public Integer max(UserBean userBean) {
		// TODO Auto-generated method stub
		return userDao.max(userBean);
	}





	public UserBean oldPasswrod(UserBean userBean) {
		// TODO Auto-generated method stub
		return userDao.oldPasswrod(userBean);
	}

}
