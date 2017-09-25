package com.xhhy.dao;

import java.util.List;
import java.util.Map;

import com.xhhy.domain.JianliBean;

public interface JianliDao {
    int deleteByPrimaryKey(Integer jianliId);

    int insert(JianliBean record);

    int insertSelective(JianliBean record);

    JianliBean selectByPrimaryKey(Integer jianliId);

    int updateByPrimaryKeySelective(JianliBean record);

    int updateByPrimaryKey(JianliBean record);

	List<JianliBean> selectAll();

	List<JianliBean> selectJianliRoleDept();

	List<JianliBean> selectJianliRoleDeptPages(Map<String, Object> map);

	void updateByPrimaryKeyAndState( int state,int roleId);
}