package com.myCRM.mapper;

import java.util.List;
import java.util.Map;
import com.myCRM.po.Resource;
import com.myCRM.po.Role;
import com.myCRM.po.RoleResource;
import com.myCRM.po.UserRole;
import com.myCRM.tools.BaseMapper;


public interface RoleMapper extends BaseMapper<Role> {
	public long countRole(Map<String,Object> params);
	public List<Role> listUserRole(int uid);
	public List<String> listUserRoleString(int uid);
	public UserRole loadUserRole(int uid,int roleId);
	public void addUserRole(int userId,int roleId);
	public void deleteUserRole(int userId,int roleId);
	public void deleteUserRole(int userId);
	
	public List<Resource> listRoleResource(int roleId);
	public void addRoleResource(int roleId,int resId);
	public void deleteRoleResource(int roleId,int resId);
	public RoleResource loadRoleResource(int roleId,int resId);
	public List<Role> listRoleByPage(Map<String, Object> params);
	
	public Role findRoleByRid(int rid);
	public Role findRoleByRoleName(String Rname);
	public List<Role> findRoleByUserId(int uid);
	
}
