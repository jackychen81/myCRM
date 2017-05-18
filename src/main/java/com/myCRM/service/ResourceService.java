package com.myCRM.service;

import java.util.List;

import net.sf.json.JSONObject;

import com.myCRM.po.Resource;
import com.myCRM.tools.BaseMapper;

public interface ResourceService extends BaseMapper<Resource>{
	public List<Resource> listResourceByUid(int uid);
	public JSONObject listResourceByRoleId(int rid);
}
