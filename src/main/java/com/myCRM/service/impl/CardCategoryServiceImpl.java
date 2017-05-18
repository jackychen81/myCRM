package com.myCRM.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myCRM.mapper.CardCategoryMapper;
import com.myCRM.po.CardCategory;
import com.myCRM.service.CardCategoryService;
@Service
public class CardCategoryServiceImpl implements CardCategoryService {
	@Autowired
	private CardCategoryMapper cardCategoryMapper;
	public List<CardCategory> list() {
		return cardCategoryMapper.list();
	}

	public void add(CardCategory t) {
		cardCategoryMapper.add(t);
	}

	public void update(CardCategory t) {
		cardCategoryMapper.update(t);
	}

	public void delete(int id) {
		cardCategoryMapper.delete(id);
	}

	public CardCategory findCardCategoryById(int id) {
		return cardCategoryMapper.findCardCategoryById(id);
	}

	public void delete(String bid) {
		// TODO Auto-generated method stub
		
	}

}
