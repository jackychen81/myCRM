package com.myCRM.shiro.permission;

import org.apache.shiro.authz.Permission;
import org.apache.shiro.util.AntPathMatcher;
import org.apache.shiro.util.PatternMatcher;

public class MyUrlPermission implements Permission {
	private String url;
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	public MyUrlPermission() {
	}
	
	public MyUrlPermission(String url) {
		this.url = url;
	}
	
	public boolean implies(Permission p) {
		if(!(p instanceof MyUrlPermission))return false;
		MyUrlPermission mup = (MyUrlPermission) p;
		PatternMatcher patternMatcher = new AntPathMatcher();
		//System.out.println("this:"+this.getUrl()+",mup:"+mup.getUrl()+",permission="+patternMatcher.matches(this.getUrl(), mup.getUrl()));
		return patternMatcher.matches(this.getUrl(), mup.getUrl());
	}

}
