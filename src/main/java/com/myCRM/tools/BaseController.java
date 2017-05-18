package com.myCRM.tools;

import org.springframework.ui.Model;


public interface BaseController <T>{
	String list();
	String listBusinessByPage(String aoData);
	String add(Model model);
	String add(T t);
	String delete(int id);
	String update(Model model, int id);
	String update(T t,int id);
	
}
