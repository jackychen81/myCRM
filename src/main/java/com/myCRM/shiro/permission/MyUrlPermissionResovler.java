package com.myCRM.shiro.permission;

import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.permission.PermissionResolver;
import org.apache.shiro.authz.permission.WildcardPermission;

public class MyUrlPermissionResovler implements PermissionResolver {

	public Permission resolvePermission(String permissionString) {
		if(permissionString.startsWith("/")){
			return new MyUrlPermission(permissionString);
		}
		return new WildcardPermission(permissionString);
	}

}
