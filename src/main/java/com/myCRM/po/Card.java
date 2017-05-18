package com.myCRM.po;

public class Card {
	private int cid;
	private int uid;
	private CardCategory cardCategory;
	private String description;
	private double amount;
	private double plusAmount;
	private double remaining;
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public double getPlusAmount() {
		return plusAmount;
	}
	public void setPlusAmount(double plusAmount) {
		this.plusAmount = plusAmount;
	}
	public double getRemaining() {
		return remaining;
	}
	public void setRemaining(double remaining) {
		this.remaining = remaining;
	}
	public CardCategory getCardCategory() {
		return cardCategory;
	}
	public void setCardCategory(CardCategory cardCategory) {
		this.cardCategory = cardCategory;
	}
	@Override
	public String toString() {
		return "Card [cid=" + cid + ", uid=" + uid + ", cardCategory="
				+ cardCategory + ", description=" + description + 
				", amount=" + amount + ", plusAmount="
				+ plusAmount + ", remaining=" + remaining + "]";
	}

	
	
}
