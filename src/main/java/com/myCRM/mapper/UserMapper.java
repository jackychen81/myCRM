package com.myCRM.mapper;

import java.util.List;
import java.util.Map;

import com.myCRM.po.Resource;
import com.myCRM.po.User;
import com.myCRM.tools.BaseMapper;

public interface UserMapper extends BaseMapper<User>{

	User findUserByUsername(String username);

	List<User> listUserByPage(Map<String,Object> params);

	List<Resource> listResourceByUid(int id);
	
	long countUser(Map<String, Object> params);

	User findUserByUserId(int id);
}
