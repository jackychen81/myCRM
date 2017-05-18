package com.myCRM.service;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.myCRM.po.Card;
import com.myCRM.tools.BaseMapper;

public interface CardService extends BaseMapper<Card>{
	
	public JSONObject listCardByPage(String aoData);
	
	public long countCard(Map<String,Object> params);

	public Card findCardById(int cid);

	public List<Card> listCardByUid(int id);
}
