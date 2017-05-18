package com.myCRM.service.impl;

import java.util.List;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myCRM.mapper.ResourceMapper;
import com.myCRM.po.Resource;
import com.myCRM.service.ResourceService;
@Service
public class ResourceServiceImpl implements ResourceService {
	@Autowired
	private ResourceMapper resourceMapper;
	
	public List<Resource> list() {
		return null;
	}

	public void add(Resource t) {
		resourceMapper.add(t);

	}

	public void update(Resource t) {
		resourceMapper.update(t);

	}

	public void delete(int id) {
		resourceMapper.delete(id);

	}

	public List<Resource> listResourceByUid(int uid) {
		return resourceMapper.listResourceByUid(uid);
	}

	public JSONObject listResourceByRoleId(int rid) {
		return null;//resourceMapper.listResourceByRoleId(rid);
	}

	public void delete(String bid) {
		// TODO Auto-generated method stub
		
	}

}
