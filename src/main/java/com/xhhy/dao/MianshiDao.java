package com.xhhy.dao;

import java.util.List;

import com.xhhy.domain.MianshiBean;

public interface MianshiDao {
    int deleteByPrimaryKey(Integer mianshiid);

    int insert(MianshiBean record);

    int insertSelective(MianshiBean record);

    MianshiBean selectByPrimaryKey(Integer mianshiid);

    int updateByPrimaryKeySelective(MianshiBean record);

    int updateByPrimaryKeyWithBLOBs(MianshiBean record);

    int updateByPrimaryKey(MianshiBean record);

	List<MianshiBean> selectAll();
}