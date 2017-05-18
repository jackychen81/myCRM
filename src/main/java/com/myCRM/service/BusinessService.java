package com.myCRM.service;

import java.util.Map;

import net.sf.json.JSONObject;

import com.myCRM.po.Business;
import com.myCRM.tools.BaseMapper;

public interface BusinessService extends BaseMapper<Business>{
	Business findBusinessById(String id);

	JSONObject listBusinessByPage(String aoData);

	JSONObject listBusinessItemByPage(Map<String,Object> param);
	
	void delete(String bid);
}
