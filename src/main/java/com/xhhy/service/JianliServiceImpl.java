package com.xhhy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xhhy.dao.JianliDao;
import com.xhhy.domain.JianliBean;
@Transactional
@Service
public class JianliServiceImpl implements JianliService{
	@Autowired
	private JianliDao jianliDao;
	public List<JianliBean> selectAll() {
		// TODO Auto-generated method stub
		return jianliDao.selectAll();
	}
	public void updateByPrimaryKeySelective(JianliBean jianliBean) {
		// TODO Auto-generated method stub
		jianliDao.updateByPrimaryKeySelective(jianliBean);
	}
	public JianliBean selectByPrimaryKey(int jianliId) {
		// TODO Auto-generated method stub
		return jianliDao.selectByPrimaryKey(jianliId);
	}
	public void insertSelective(JianliBean jianliBean) {
		// TODO Auto-generated method stub
		jianliDao.insertSelective(jianliBean);
	}
	public List<JianliBean> selectJianliRoleDept(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return jianliDao.selectJianliRoleDept(map);
	}
	public List<JianliBean> selectJianliRoleDeptPages(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return jianliDao.selectJianliRoleDeptPages(map);
	}
	public void updateByPrimaryKeyAndState(int state, int roleId) {
		// TODO Auto-generated method stub
		jianliDao.updateByPrimaryKeyAndState(state,roleId);
	}
	public List<JianliBean> selectJianliMianshiRoleDept() {
		// TODO Auto-generated method stub
		return jianliDao.selectJianliMianshiRoleDept();
	}
	public List<JianliBean> selectJianliMianshiRoleDeptPages(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return jianliDao.selectJianliMianshiRoleDeptPages(map);
	}
	public List<JianliBean> selectJianliLuyongRoleDept() {
		// TODO Auto-generated method stub
		return jianliDao.selectJianliLuyongRoleDept();
	}
	public List<JianliBean> selectJianliLuyongRoleDeptPages(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return jianliDao.selectJianliLuyongRoleDeptPages(map);
	}
	public List<JianliBean> selectJianliRoleDeptPagesBySelective(JianliBean jianliBean) {
		// TODO Auto-generated method stub
		return jianliDao.selectJianliRoleDeptPagesBySelective(jianliBean);
	}
	public List<JianliBean> selectJianliRoleDeptPagesBySelective2(JianliBean jianliBean) {
		// TODO Auto-generated method stub
		return jianliDao.selectJianliRoleDeptPagesBySelective2(jianliBean);
	}
	public List<JianliBean> selectJianliRoleDeptPagesBySelective3(JianliBean jianliBean) {
		// TODO Auto-generated method stub
		return jianliDao.selectJianliRoleDeptPagesBySelective3(jianliBean);
	}
	public List<JianliBean> SelectRoleDept() {
		// TODO Auto-generated method stub
		return jianliDao.SelectRoleDept();
	}

}
