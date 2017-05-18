package com.myCRM.po;

import java.util.Date;

public class Set {
	
	private int setId;
	private String name;
	private String createBy;
	private Date createDate;
	private String updateBy;
	private Date updateDate;
	private int status;//0-disable;1-enable
	private int iscoupon;//0-no;1-yes
	private double price;
	private Date startFrom;
	private Date expireTo;
	
	public int getSetId() {
		return setId;
	}
	public void setSetId(int setId) {
		this.setId = setId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getIscoupon() {
		return iscoupon;
	}
	public void setIscoupon(int iscoupon) {
		this.iscoupon = iscoupon;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Date getStartFrom() {
		return startFrom;
	}
	public void setStartFrom(Date startFrom) {
		this.startFrom = startFrom;
	}
	public Date getExpireTo() {
		return expireTo;
	}
	public void setExpireTo(Date expireTo) {
		this.expireTo = expireTo;
	}
	
	@Override
	public String toString() {
		return "Set [setId=" + setId + ", name=" + name + ", createBy="
				+ createBy + ", createDate=" + createDate + ", updateBy="
				+ updateBy + ", updateDate=" + updateDate + ", status="
				+ status + ", iscoupon=" + iscoupon + ", price=" + price
				+ ", startFrom=" + startFrom + ", expireTo=" + expireTo + "]";
	}
}
