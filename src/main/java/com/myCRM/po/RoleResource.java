package com.myCRM.po;

public class RoleResource {
	private int rrId;
	private int roleId;
	private int resId;
	private String url;
	private int resPid;
	private String name;
	
	public int getRrId() {
		return rrId;
	}
	public void setRrId(int rrId) {
		this.rrId = rrId;
	}
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public int getResId() {
		return resId;
	}
	public void setResId(int resId) {
		this.resId = resId;
	}
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getResPid() {
		return resPid;
	}
	public void setResPid(int resPid) {
		this.resPid = resPid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "RoleResource [rrId=" + rrId + ", roleId=" + roleId + ", resId="
				+ resId + ", url=" + url + ", resPid=" + resPid + ", name="
				+ name + "]";
	}
	
}
