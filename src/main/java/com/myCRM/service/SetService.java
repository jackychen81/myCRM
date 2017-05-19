package com.myCRM.service;

import net.sf.json.JSONObject;

import com.myCRM.po.Set;
import com.myCRM.tools.BaseMapper;

public interface SetService extends BaseMapper<Set>{
	void addMiddle(int setId,int itemId);

	Set findSetById(int id);

	JSONObject listByPage(String aoData);
}
