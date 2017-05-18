package com.myCRM.mapper;

import com.myCRM.po.Set;
import com.myCRM.tools.BaseMapper;

public interface SetMapper extends BaseMapper<Set>{
	void addMiddle(int setId,int itemId);
}
