package com.myCRM.mapper;

import java.util.List;

import net.sf.json.JSONArray;

import com.myCRM.po.Resource;
import com.myCRM.po.RoleResource;
import com.myCRM.tools.BaseMapper;


public interface ResourceMapper extends BaseMapper<Resource>{
	public List<Resource> listResourceByUid(int uid);
	public List<RoleResource> listResourceByRoleId(int rid);
	public List<Resource> listResourceByResPid(int id);
	public void deleteSubResourceByResPid(List<Integer> ids);
	public Resource findResourceByResId(int id);
	public void deleteByBatch(List<Integer> ids);
}
