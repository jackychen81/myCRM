package com.myCRM.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myCRM.mapper.BusinessMapper;
import com.myCRM.mapper.ItemMapper;
import com.myCRM.po.Business;
import com.myCRM.po.Item;
import com.myCRM.service.BusinessService;
import com.myCRM.tools.DataTableParams;
import com.myCRM.tools.DateFormat;
@Service
public class BusinessServiceImpl implements BusinessService {
	@Autowired
	private BusinessMapper businessMapper;
	@Autowired
	private DataTableParams dataTableParams;
	@Autowired
	private ItemMapper itemMapper;
	
	public List<Business> list() {
		return businessMapper.list();
	}

	public void add(Business t) {
		businessMapper.add(t);
	}

	public void update(Business t) {
		businessMapper.update(t);
	}

	public void delete(String id) {
		businessMapper.delete(id);
	}

	public Business findBusinessById(String id) {
		return businessMapper.findBusinessById(id);
	}

	public JSONObject listBusinessByPage(String aoData) {
		Map<String,Object> params = dataTableParams.getParams(aoData);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new DateFormat());
		JSONObject getObj = new JSONObject();
		List<Business> businessList = businessMapper.listBusinessByPage(params);
		long count = businessMapper.countBusiness(params);
		getObj.put("sEcho", params.get("sEcho"));
		getObj.put("iTotalRecords", count);//实际的行数
		getObj.put("iTotalDisplayRecords", count);//显示的行数,这个要和上面写的一样
		getObj.put("data",JSONArray.fromObject(businessList,jsonConfig));
		return getObj;
	}

	public JSONObject listBusinessItemByPage(Map<String,Object> param) {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new DateFormat());
		JSONObject getObj = new JSONObject();
		List<Item> itemList = itemMapper.listBusinessItemByPage(param);
		long count = itemMapper.countBusinessItem(param);
		getObj.put("sEcho", null);
		getObj.put("iTotalRecords", count);//实际的行数
		getObj.put("iTotalDisplayRecords", count);//显示的行数,这个要和上面写的一样
		getObj.put("data",JSONArray.fromObject(itemList,jsonConfig));
		return getObj;
	}

	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

}
