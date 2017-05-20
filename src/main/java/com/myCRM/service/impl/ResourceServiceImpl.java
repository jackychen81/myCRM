package com.myCRM.service.impl;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myCRM.mapper.ResourceMapper;
import com.myCRM.po.Resource;
import com.myCRM.po.RoleResource;
import com.myCRM.service.ResourceService;
@Service
public class ResourceServiceImpl implements ResourceService {
	@Autowired
	private ResourceMapper resourceMapper;
	
	public List<Resource> list() {
		return resourceMapper.list();
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
		JSONObject getObj = new JSONObject();
		List<Resource> resource = resourceMapper.list();
		List<RoleResource> roleResources = resourceMapper.listResourceByRoleId(rid);
		//System.out.println("resource共有："+resource.size());
		//System.out.println("用户有resource:"+roleResources.size());
		for(Resource res : resource){
			if(res.getResPid()<10){
				res.setNocheck(true);
			}
			for(RoleResource roleResource : roleResources){
				if(res.getResId()==roleResource.getResId()){
					res.setChecked(true);
				}
			}
		}
		//System.out.println(resource.size());
		getObj.put("data", JSONArray.fromObject(resource));
		return getObj;
	}

	public void delete(String bid) {
		// TODO Auto-generated method stub
		
	}

}
