package com.myCRM.service;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.myCRM.po.Role;
import com.myCRM.tools.BaseMapper;

public interface RoleService extends BaseMapper<Role> {
	public JSONObject listRoleByPage(String aoData);
	public List<Role> listRoleByPage(Map<String,Object> params);
	public long countRole(Map<String,Object> params);
	public List<Role> listUserRole(int uid);
	public List<String> listUserRoleString(int uid);
	public JSONObject initRole();
	public void addRoleResource(int roleId,int resId);
	public void deleteRoleResource(int roleId,int resId);
	public JSONObject crud(String data);
	public Role findRoleByRid(int rid);
	public Role findRoleByRoleName(String Rname);
	public void addUserRole(int userId,int roleId);
	public void deleteUserRole(int userId,int roleId);
}
