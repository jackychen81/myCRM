package com.myCRM.mapper;

import java.util.List;
import java.util.Map;

import com.myCRM.po.Item;
import com.myCRM.tools.BaseMapper;

public interface ItemMapper extends BaseMapper<Item>{

	List<Item> listItemByPage(Map<String, Object> params);

	long countItem(Map<String, Object> params);

	Item findItemById(int id);
	
	List<Item> listBusinessItemByPage(Map<String,Object> param);

	long countBusinessItem(Map<String,Object> param);

}
