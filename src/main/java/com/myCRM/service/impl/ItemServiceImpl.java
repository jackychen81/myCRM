package com.myCRM.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myCRM.mapper.ItemMapper;
import com.myCRM.po.Item;
import com.myCRM.service.ItemService;
import com.myCRM.tools.DataTableParams;
import com.myCRM.tools.DateFormat;
@Service
public class ItemServiceImpl implements ItemService{
	@Autowired
	private ItemMapper itemMapper;
	@Autowired
	private DataTableParams dataTableParams;
	
	public List<Item> list() {
		return itemMapper.list();
	}

	public void add(Item t) {
		itemMapper.add(t);
	}

	public void update(Item t) {
		itemMapper.update(t);
	}

	public void delete(int id) {
		itemMapper.delete(id);
	}

	public JSONObject listItemByPage(String aoData) {
		Map<String,Object> params = dataTableParams.getParams(aoData);
		JsonConfig jsonConfig = new JsonConfig();  
		jsonConfig.registerJsonValueProcessor(Date.class, new DateFormat());
		JSONObject getObj = new JSONObject();
		List<Item> itemList = itemMapper.listItemByPage(params);
		long count = itemMapper.countItem(params);
		getObj.put("sEcho", params.get("sEcho"));
		getObj.put("iTotalRecords", count);//实际的行数
		getObj.put("iTotalDisplayRecords", count);//显示的行数,这个要和上面写的一样
		getObj.put("data",JSONArray.fromObject(itemList, jsonConfig));
		return getObj;
	}

	public Item findItemById(int id) {
		return itemMapper.findItemById(id);
	}

	public void delete(String bid) {
		// TODO Auto-generated method stub
		
	}

}
