package com.myCRM.mapper;

import java.util.List;

import com.myCRM.po.CardCategory;
import com.myCRM.tools.BaseMapper;

public interface CardCategoryMapper extends BaseMapper<CardCategory>{

	CardCategory findCardCategoryById(int id);

}
