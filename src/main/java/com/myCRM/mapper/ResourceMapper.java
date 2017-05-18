package com.myCRM.mapper;

import java.util.List;

import com.myCRM.po.Resource;
import com.myCRM.po.RoleResource;
import com.myCRM.tools.BaseMapper;


public interface ResourceMapper extends BaseMapper<Resource>{
	public List<Resource> listResourceByUid(int uid);
	public List<RoleResource> listResourceByRoleId(int rid);
}
