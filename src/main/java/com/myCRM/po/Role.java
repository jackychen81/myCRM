package com.myCRM.po;

public class Role {
	private int rid;
	private String roleName;
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	@Override
	public String toString() {
		return "Role [rid=" + rid + ", roleName=" + roleName + "]";
	}
	
	
}
