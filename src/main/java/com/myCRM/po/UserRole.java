package com.myCRM.po;

public class UserRole {
	private int urId;
	private int userId;
	private int roleId;
	
	public int getUrId() {
		return urId;
	}
	public void setUrId(int urId) {
		this.urId = urId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	@Override
	public String toString() {
		return "UserRole [urId=" + urId + ", userId=" + userId + ", roleId="
				+ roleId + "]";
	}
	public UserRole(int userId, int roleId) {
		super();
		this.userId = userId;
		this.roleId = roleId;
	}
	
}
