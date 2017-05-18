package com.myCRM.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myCRM.mapper.RoleMapper;
import com.myCRM.po.Role;
import com.myCRM.service.RoleService;
import com.myCRM.tools.DataTableParams;
import com.myCRM.tools.DateFormat;
@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private DataTableParams dataTableParams;
	
	public List<Role> list() {
		return roleMapper.list();
	}

	public void add(Role t) {
		roleMapper.add(t);
	}

	public void update(Role t) {
		roleMapper.update(t);
	}

	public void delete(int id) {
		roleMapper.delete(id);
	}

	public List<String> listUserRoleString(int id) {
		return roleMapper.listUserRoleString(id);
	}

	public JSONObject listRoleByPage(String aoData) {
		Map<String,Object> params = dataTableParams.getParams(aoData);
		
		JsonConfig jsonConfig = new JsonConfig();  
		jsonConfig.registerJsonValueProcessor(Date.class, new DateFormat());
		JSONObject getObj = new JSONObject();
		List<Role> roleList = roleMapper.listRoleByPage(params);
		long count = roleMapper.countRole(params);
		getObj.put("sEcho", params.get("sEcho"));
		getObj.put("iTotalRecords", count);//实际的行数
		getObj.put("iTotalDisplayRecords", count);//显示的行数,这个要和上面写的一样
		getObj.put("data",JSONArray.fromObject(roleList, jsonConfig));
		return getObj;
	}

	public List<Role> listRoleByPage(Map<String, Object> params) {
		return roleMapper.listRoleByPage(params);
	}

	public long countRole(Map<String, Object> params) {
		return roleMapper.countRole(params);
	}

	public List<Role> listUserRole(int uid) {
		return roleMapper.listUserRole(uid);
	}

	public JSONObject initRole() {
		return JSONObject.fromObject(roleMapper.list().toString());
	}

	public void addRoleResource(int roleId, int resId) {
		roleMapper.addRoleResource(roleId, resId);
		
	}

	public void deleteRoleResource(int roleId, int resId) {
		roleMapper.deleteRoleResource(roleId, resId);
		
	}

	public JSONObject crud(String data) {
		// TODO Auto-generated method stub
		return null;
	}

	public Role findRoleByRid(int rid) {
		return roleMapper.findRoleByRid(rid);
	}

	public Role findRoleByRoleName(String Rname) {
		return roleMapper.findRoleByRoleName(Rname);
	}

	public void addUserRole(int userId, int roleId) {
		roleMapper.addUserRole(userId, roleId);
	}

	public void deleteUserRole(int userId, int roleId) {
		roleMapper.deleteUserRole(userId, roleId);
	}

	public void delete(String bid) {
		// TODO Auto-generated method stub
		
	}


}
