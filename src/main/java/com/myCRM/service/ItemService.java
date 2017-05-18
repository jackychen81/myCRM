package com.myCRM.service;

import net.sf.json.JSONObject;

import com.myCRM.po.Item;
import com.myCRM.tools.BaseMapper;

public interface ItemService extends BaseMapper<Item>{

	JSONObject listItemByPage(String aoData);

	Item findItemById(int id);

}
