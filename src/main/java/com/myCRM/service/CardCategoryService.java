package com.myCRM.service;

import java.util.List;

import com.myCRM.po.CardCategory;
import com.myCRM.tools.BaseMapper;

public interface CardCategoryService extends BaseMapper<CardCategory>{

	CardCategory findCardCategoryById(int id);
	
}
