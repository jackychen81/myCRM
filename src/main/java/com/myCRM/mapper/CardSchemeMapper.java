package com.myCRM.mapper;

import java.util.List;
import java.util.Map;

import com.myCRM.po.CardScheme;
import com.myCRM.tools.BaseMapper;

public interface CardSchemeMapper extends BaseMapper<CardScheme>{

	List<CardScheme> listByPage(Map<String, Object> params);

	long count(Map<String, Object> params);
	
	CardScheme findCardSchemeById(int id);

}
