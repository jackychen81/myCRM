package com.myCRM.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myCRM.mapper.SetMapper;
import com.myCRM.po.Set;
import com.myCRM.service.SetService;
@Service
public class SetServiceImpl implements SetService {
	@Autowired
	private SetMapper setMapper;
	
	public List<Set> list() {
		return setMapper.list();
	}

	public void add(Set t) {
		setMapper.add(t);
	}

	public void update(Set t) {
		setMapper.update(t);
	}

	public void delete(int id) {
		setMapper.delete(id);
	}

	public void delete(String bid) {
		// TODO Auto-generated method stub
	}

	public void addMiddle(int setId, int itemId) {
		setMapper.addMiddle(setId, itemId);
	}

}
