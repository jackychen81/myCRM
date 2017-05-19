package com.myCRM.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myCRM.mapper.SetMapper;
import com.myCRM.po.CardScheme;
import com.myCRM.po.Set;
import com.myCRM.service.SetService;
import com.myCRM.tools.DataTableParams;
import com.myCRM.tools.DateFormat;
@Service
public class SetServiceImpl implements SetService {
	@Autowired
	private SetMapper setMapper;
	@Autowired
	private DataTableParams dataTableParams;
	
	public List<Set> list() {
		return setMapper.list();
	}

	public void add(Set t) {
		setMapper.add(t);
	}

	public void update(Set t) {
		setMapper.update(t);
	}

	public void delete(int id) {
		setMapper.delete(id);
	}

	public void delete(String bid) {
	}

	public void addMiddle(int setId, int itemId) {
		setMapper.addMiddle(setId, itemId);
	}

	public Set findSetById(int id) {
		return setMapper.findSetById(id);
	}

	public JSONObject listByPage(String aoData) {
		Map<String,Object> params = dataTableParams.getParams(aoData);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new DateFormat());
		JSONObject getObj = new JSONObject();
		List<Set> set = setMapper.listByPage(params);
		long count =setMapper.count(params);
		getObj.put("sEcho", params.get("sEcho"));
		getObj.put("iTotalRecords", count);//实际的行数
		getObj.put("iTotalDisplayRecords", count);//显示的行数,这个要和上面写的一样
		getObj.put("data",JSONArray.fromObject(set,jsonConfig));
		return getObj;
	}

}
