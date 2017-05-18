package com.myCRM.service;

import java.util.List;

import net.sf.json.JSONObject;

import com.myCRM.po.Resource;
import com.myCRM.po.User;
import com.myCRM.tools.BaseMapper;

public interface UserService extends BaseMapper<User>{

	JSONObject listUserByPage(String aoData);

	User findUserByUsername(String username);

	List<Resource> listResourceByUid(int id);

	User findUserByUserId(int id);
	
	

}
