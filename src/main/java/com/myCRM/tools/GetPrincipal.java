package com.myCRM.tools;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

public class GetPrincipal {
	public String initSubject(){
		Subject subject = SecurityUtils.getSubject();
		String username = (String) subject.getPrincipal();
		return username;
	}
}
