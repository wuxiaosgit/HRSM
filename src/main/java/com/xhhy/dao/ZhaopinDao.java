package com.xhhy.dao;

import java.util.List;
import java.util.Map;

import com.xhhy.domain.ZhaopinBean;

public interface ZhaopinDao {
    int deleteByPrimaryKey(Integer zhaopinId);

    int insert(ZhaopinBean record);

    int insertSelective(ZhaopinBean record);

    ZhaopinBean selectByPrimaryKey(Integer zhaopinId);

    int updateByPrimaryKeySelective(ZhaopinBean record);

    int updateByPrimaryKey(ZhaopinBean record);

	List<ZhaopinBean> selectAll();

	List<ZhaopinBean> selectZhaoRoleDept();

	ZhaopinBean selectAZhaoRoleDept(Integer zhaopinId);

	List<ZhaopinBean> selectZhaoRoleDeptPages(Map<String, Object> map);
}