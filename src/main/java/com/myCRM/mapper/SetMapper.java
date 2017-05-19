package com.myCRM.mapper;

import java.util.List;
import java.util.Map;

import com.myCRM.po.Set;
import com.myCRM.tools.BaseMapper;

public interface SetMapper extends BaseMapper<Set>{
	void addMiddle(int setId,int itemId);

	Set findSetById(int id);

	List<Set> listByPage(Map<String, Object> params);

	long count(Map<String, Object> params);
}
