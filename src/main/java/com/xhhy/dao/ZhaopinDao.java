package com.xhhy.dao;

import java.util.List;

import com.xhhy.domain.ZhaopinBean;

public interface ZhaopinDao {
    int deleteByPrimaryKey(Integer zhaopinId);

    int insert(ZhaopinBean record);

    int insertSelective(ZhaopinBean record);

    ZhaopinBean selectByPrimaryKey(Integer zhaopinId);

    int updateByPrimaryKeySelective(ZhaopinBean record);

    int updateByPrimaryKey(ZhaopinBean record);

	List<ZhaopinBean> selectAll();
}