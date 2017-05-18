package com.myCRM.service;

import com.myCRM.po.Set;
import com.myCRM.tools.BaseMapper;

public interface SetService extends BaseMapper<Set>{
	void addMiddle(int setId,int itemId);
}
