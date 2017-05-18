package com.myCRM.tools;

import java.util.List;

public interface BaseMapper<T> {
	public List<T> list();
	public void add(T t);
	public void update(T t);
	public void delete(int id);
	public void delete(String bid);
}
