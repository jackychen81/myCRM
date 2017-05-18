package com.myCRM.po;

public class Resource {
	private int resId;
	private int resPid;
	private String name;
	private String url;
	private String permission;
	private boolean checked;
	private boolean nocheck;
	
	
	public boolean isNocheck() {
		return nocheck;
	}
	public void setNocheck(boolean nocheck) {
		this.nocheck = nocheck;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public int getResPid() {
		return resPid;
	}
	public void setResPid(int resPid) {
		this.resPid = resPid;
	}
	public int getResId() {
		return resId;
	}
	public void setResId(int resId) {
		this.resId = resId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	@Override
	public String toString() {
		return "Resource [resId=" + resId + ", resPid=" + resPid + ", name="
				+ name + ", url=" + url + ", permission=" + permission
				+ ", checked=" + checked + "]";
	}
	
	
}
