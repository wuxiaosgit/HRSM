package com.xhhy.dao;

import java.util.List;

import com.xhhy.domain.JianliBean;
import com.xhhy.domain.ZhaopinBean;

public interface JianliDao {
    int deleteByPrimaryKey(Integer jianliId);

    int insert(JianliBean record);

    int insertSelective(JianliBean record);

    JianliBean selectByPrimaryKey(Integer jianliId);

    int updateByPrimaryKeySelective(JianliBean record);

    int updateByPrimaryKey(JianliBean record);

	List<JianliBean> selectAll();

	List<JianliBean> selectJianliRoleDept();

	List<JianliBean> selectJianliRoleDeptPages();
}