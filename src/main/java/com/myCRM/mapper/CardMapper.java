package com.myCRM.mapper;

import java.util.List;
import java.util.Map;

import com.myCRM.po.Card;
import com.myCRM.tools.BaseMapper;

public interface CardMapper extends BaseMapper<Card>{

	public List<Card> listCardByPage(Map<String, Object> params);
	
	public long countCard(Map<String,Object> params);

	public Card findCardById(int cid);

	public List<Card> listCardByUid(int id);
	
}
