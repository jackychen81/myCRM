package com.myCRM.shiro;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.myCRM.po.Resource;
import com.myCRM.po.User;
import com.myCRM.service.RoleService;
import com.myCRM.service.UserService;


public class ShiroRealm extends AuthorizingRealm{
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
/*		@Autowired
	private PermissionService permissionService;*/
	
	//用户授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		
		String puser =  (String) principals.getPrimaryPrincipal();
		User user = userService.findUserByUsername(puser);
		//User puser = (User) principals.getPrimaryPrincipal();
		//User user = userService.findUserByUsername(puser.getUsername());
		
		List<String> roles = roleService.listUserRoleString(user.getId());
		//System.out.println(roles);
		List<Resource> reses = userService.listResourceByUid(user.getId());
		List<String> permissions = new ArrayList<String>();
		//System.out.println("reses="+reses.toString());
		for(Resource r:reses){
			permissions.add(r.getUrl());
		}
		info.addRoles(roles);
		info.addStringPermissions(permissions);
		//System.out.println("username--------------------------------"+user.getUsername());
		/*List<Role> roles = roleService.selectRolesByUserId(user.getId());
		for (Role role : roles){
			info.addRole(role.getRoleName());
			List<Permission> permissions = permissionService.selectPermissionsByRoleId(role.getId());
			for(Permission permission : permissions){
				info.addStringPermission(permission.getPermissionSign());
			}
		}*/
		
		
		return info;
	}
	//用户认证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token)throws AuthenticationException{
			String username = (String) token.getPrincipal();
			//String password = new String((char[]) token.getCredentials());
			User user = null;
			
			user = userService.findUserByUsername(username);
			SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user.getUsername(),user.getPassword(),this.getName());
			//用户密码加盐处理
			info.setCredentialsSalt(ByteSource.Util.bytes(user.getUsername()));
		return info;
	}
	@Override
	protected void clearCachedAuthorizationInfo(PrincipalCollection principals) {
		System.out.println("清除授权");
		Cache c = this.getAuthorizationCache();
		Set<Object> keys = c.keys();
		for(Object o:keys){
			System.out.println("授权缓存�?"+o+"----"+c.get(o)+"=======");
		}
		super.clearCachedAuthorizationInfo(principals);
	}
	@Override
	protected void clearCachedAuthenticationInfo(PrincipalCollection principals) {
		System.out.println("清除认证");
		Cache c = this.getAuthenticationCache();
		Set<Object> keys = c.keys();
		for(Object o:keys){
			System.out.println("认证缓存�?"+o+"----"+c.get(o)+"=======");
		}
		super.clearCachedAuthenticationInfo(principals);
	}

}
