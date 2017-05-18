package com.myCRM.mapper;

import java.util.List;
import java.util.Map;

import com.myCRM.po.Business;
import com.myCRM.tools.BaseMapper;

public interface BusinessMapper extends BaseMapper<Business>{
	Business findBusinessById(String id);

	List<Business> listBusinessByPage(Map<String, Object> params);

	long countBusiness(Map<String, Object> params);

	
}
