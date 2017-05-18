package com.myCRM.po;

import java.util.Date;

public class CardScheme {
	
	private int id;
	private String name;
	private Double discount;
	private Double amount;
	private Double plus;
	private Double total;
	private Integer status;//0-disable;1-enable;
	private String createBy;
	private Date createDate;
	private String updateBy;
	private Date updateDate;
	private Date startFrom;
	private Date expireTo;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public Double getPlus() {
		return plus;
	}
	public void setPlus(Double plus) {
		this.plus = plus;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
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
		return "CardScheme [id=" + id + ", name=" + name + ", discount="
				+ discount + ", amount=" + amount + ", plus=" + plus
				+ ", total=" + total + ", status=" + status + ", createBy="
				+ createBy + ", createDate=" + createDate + ", updateBy="
				+ updateBy + ", updateDate=" + updateDate + ", startFrom="
				+ startFrom + ", expireTo=" + expireTo + "]";
	}
	
	
	
}
