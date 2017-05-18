package com.myCRM.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myCRM.mapper.CardMapper;
import com.myCRM.mapper.UserMapper;
import com.myCRM.po.User;
import com.myCRM.po.Card;
import com.myCRM.service.CardService;
import com.myCRM.tools.DataTableParams;
import com.myCRM.tools.DateFormat;
@Service
public class CardServiceImpl implements CardService {
	@Autowired
	private CardMapper cardMapper;
	@Autowired
	private DataTableParams dataTableParams;
	@Autowired
	private UserMapper userMapper;
	
	public List<Card> list() {
		return cardMapper.list();
	}

	public void add(Card t) {
		cardMapper.add(t);
	}

	public void update(Card t) {
		cardMapper.update(t);
	}

	public void delete(int id) {
		cardMapper.delete(id);
	}

	public JSONObject listCardByPage(String aoData) {
		Map<String,Object> params = dataTableParams.getParams(aoData);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new DateFormat());
		JSONObject getObj = new JSONObject();
		List<Card> userCardList = cardMapper.listCardByPage(params);
		long count = countCard(params);
		getObj.put("sEcho", params.get("sEcho"));
		getObj.put("iTotalRecords", count);//实际的行数
		getObj.put("iTotalDisplayRecords", count);//显示的行数,这个要和上面写的一样
		getObj.put("data",JSONArray.fromObject(userCardList,jsonConfig));
		return getObj;
		/*Map<String,Object> params = dataTableParams.getParams(aoData);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new DateFormat());
		JSONObject getObj = new JSONObject();
		JSONArray jarr = new JSONArray();
		JSONObject obj = new JSONObject();
		long count = cardMapper.countCard(params);
		List<Card> userCardList = cardMapper.listCardByPage(params);
		for(Card uc:userCardList){
			User user = userMapper.findUserByUserId(uc.getUid());
			obj.put("cid", uc.getCid());
			obj.put("username", user.getUsername());
			obj.put("description", uc.getDescription());
			obj.put("discount", uc.getDiscount());
			obj.put("amount", uc.getAmount());
			obj.put("plusAmount", uc.getPlusAmount());
			obj.put("remaining", uc.getRemaining());
			jarr.add(obj);
		}
		getObj.put("sEcho", params.get("sEcho"));
		getObj.put("iTotalRecords", count);//实际的行数
		getObj.put("iTotalDisplayRecords", count);//显示的行数,这个要和上面写的一样
		getObj.put("data",jarr);
		return getObj;*/
	}

	public long countCard(Map<String, Object> params) {
		return cardMapper.countCard(params);
	}

	public Card findCardById(int cid) {
		return cardMapper.findCardById(cid);
	}

	public void delete(String bid) {
		// TODO Auto-generated method stub
		
	}

	public List<Card> listCardByUid(int id) {
		return cardMapper.listCardByUid(id);
	}

}
