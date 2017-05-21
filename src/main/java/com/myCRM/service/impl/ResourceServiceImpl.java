package com.myCRM.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
		Resource resource = resourceMapper.findResourceByResId(id);
		Set<Integer> deleteId = new HashSet<Integer>();
		Set<Integer> deletePid = new HashSet<Integer>();
		boolean flag = true;
		if(resource.isNocheck()==true){
			deleteId.add(resource.getResId());
			int tempRid = resource.getResId();
			while(flag){
				List<Resource> resList = resourceMapper.listResourceByResPid(tempRid);
				if(resList.size()==0) break;
				if(resList.size()==1 && resList.get(0).isNocheck()==false){
					flag = false;
				}
				int i=1;
				for(Resource res:resList){
					if(res.isNocheck()==false){
						
						if(i==resList.size()){
							flag=false;
						}
						deletePid.add(res.getResPid());
						i++;
					}else{
						tempRid =res.getResId();
						deleteId.add(tempRid);
					}
				}
			}
			System.out.println("删除id="+deleteId.toString()+"====删除Pid"+deletePid.toString());
			List<Integer> ids = new ArrayList<Integer>(deleteId);
			resourceMapper.deleteByBatch(ids);
			List<Integer> pids = new ArrayList<Integer>(deletePid);
			resourceMapper.deleteSubResourceByResPid(pids);
		}else{
			System.out.println("删除末级：id="+id);
			resourceMapper.delete(id);
		}
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
