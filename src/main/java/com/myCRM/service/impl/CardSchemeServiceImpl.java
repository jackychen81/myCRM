package com.myCRM.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myCRM.mapper.CardSchemeMapper;
import com.myCRM.po.CardScheme;
import com.myCRM.service.CardSchemeService;
import com.myCRM.tools.DataTableParams;
import com.myCRM.tools.DateFormat;
@Service
public class CardSchemeServiceImpl implements CardSchemeService {
	@Autowired
	private CardSchemeMapper cardSchemeMapper;
	@Autowired
	private DataTableParams dataTableParams;
	
	public List<CardScheme> list() {
		return cardSchemeMapper.list();
	}

	public void add(CardScheme t) {
		cardSchemeMapper.add(t);
	}

	public void update(CardScheme t) {
		cardSchemeMapper.update(t);
	}

	public void delete(int id) {
		cardSchemeMapper.delete(id);
	}

	public void delete(String bid) {

	}

	public JSONObject listByPage(String aoData) {
		Map<String,Object> params = dataTableParams.getParams(aoData);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new DateFormat());
		JSONObject getObj = new JSONObject();
		List<CardScheme> cardScheme = cardSchemeMapper.listByPage(params);
		long count =cardSchemeMapper.count(params);
		getObj.put("sEcho", params.get("sEcho"));
		getObj.put("iTotalRecords", count);//实际的行数
		getObj.put("iTotalDisplayRecords", count);//显示的行数,这个要和上面写的一样
		getObj.put("data",JSONArray.fromObject(cardScheme,jsonConfig));
		return getObj;
	}

	public CardScheme findCardSchemeByUserId(int id) {
		return cardSchemeMapper.findCardSchemeByUserId(id);
	}

}
