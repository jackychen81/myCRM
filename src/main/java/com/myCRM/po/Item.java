package com.myCRM.po;

import java.util.Date;

public class Item {
	
	private int itemId;
	private String name;
	private double price;
	private Integer count;
	private int status;
	private double itemDiscount;
	private int itemPid;
	private String createBy;
	private Date createDate;
	private String updateBy;
	private Date updateDate;
	private boolean checked;
	private boolean nocheck;
	
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public double getItemDiscount() {
		return itemDiscount;
	}
	public void setItemDiscount(double itemDiscount) {
		this.itemDiscount = itemDiscount;
	}
	public int getItemPid() {
		return itemPid;
	}
	public void setItemPid(int itemPid) {
		this.itemPid = itemPid;
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
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public boolean isNocheck() {
		return nocheck;
	}
	public void setNocheck(boolean nocheck) {
		this.nocheck = nocheck;
	}
	@Override
	public String toString() {
		return "Item [itemId=" + itemId + ", name=" + name + ", price=" + price
				+ ", count=" + count + ", status=" + status + ", itemDiscount="
				+ itemDiscount + ", itemPid=" + itemPid + ", createBy="
				+ createBy + ", createDate=" + createDate + ", updateBy="
				+ updateBy + ", updateDate=" + updateDate + ", checked="
				+ checked + ", nocheck=" + nocheck + "]";
	}
	
	
}
