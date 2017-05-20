package com.myCRM.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myCRM.mapper.ResourceMapper;
import com.myCRM.mapper.RoleMapper;
import com.myCRM.mapper.UserMapper;
import com.myCRM.po.Resource;
import com.myCRM.po.User;
import com.myCRM.service.UserService;
import com.myCRM.shiro.ShiroKit;
import com.myCRM.tools.DataTableParams;
import com.myCRM.tools.DateFormat;
@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private DataTableParams dataTableParams;
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private ResourceMapper resourceMapper;
	
	public List<User> list() {
		return userMapper.list();
	}

	public void add(User t) {
		t.setPassword(ShiroKit.md5(t.getPassword(), t.getUsername()));
		userMapper.add(t);
	}

	public void update(User t) {
		if(t.getPassword()!=null && t.getPassword().trim()!=""){
			t.setPassword(ShiroKit.md5(t.getPassword(), t.getUsername()));
		}
		userMapper.update(t);
	}

	public void delete(int id) {
		userMapper.delete(id);
	}

	public JSONObject listUserByPage(String aoData) {
		Map<String,Object> params = dataTableParams.getParams(aoData);
		JsonConfig jsonConfig = new JsonConfig();  
		jsonConfig.registerJsonValueProcessor(Date.class, new DateFormat());
		JSONObject getObj = new JSONObject();
		long count = userMapper.countUser(params);
		List<User> userList = userMapper.listUserByPage(params);
		getObj.put("sEcho", params.get("sEcho"));
		getObj.put("iTotalRecords", count);//实际的行数
		getObj.put("iTotalDisplayRecords", count);//显示的行数,这个要和上面写的一样
		getObj.put("data",JSONArray.fromObject(userList, jsonConfig));
		return getObj;
	}


	public User findUserByUsername(String username) {
		return userMapper.findUserByUsername(username);
	}

	public List<Resource> listResourceByUid(int id) {
		return resourceMapper.listResourceByUid(id);
	}

	public User findUserByUserId(int id) {
		return userMapper.findUserByUserId(id);
	}

	public void delete(String bid) {
		// TODO Auto-generated method stub
		
	}

}
