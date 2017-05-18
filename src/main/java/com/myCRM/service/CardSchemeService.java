package com.myCRM.service;

import net.sf.json.JSONObject;

import com.myCRM.po.CardScheme;
import com.myCRM.tools.BaseMapper;

public interface CardSchemeService extends BaseMapper<CardScheme> {

	JSONObject listByPage(String aoData);

	CardScheme findCardSchemeByUserId(int id);

}
