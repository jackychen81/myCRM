package com.myCRM.po;

public class CardCategory {
	private int cardCategoryId;
	private String name;
	private Double discount;
	private int cardCategoryStatus;
	public int getCardCategoryId() {
		return cardCategoryId;
	}
	public void setCardCategoryId(int cardCategoryId) {
		this.cardCategoryId = cardCategoryId;
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
	public int getCardCategoryStatus() {
		return cardCategoryStatus;
	}
	public void setCardCategoryStatus(int cardCategoryStatus) {
		this.cardCategoryStatus = cardCategoryStatus;
	}
	@Override
	public String toString() {
		return "CardCategory [cardCategoryId=" + cardCategoryId + ", name="
				+ name + ", discount=" + discount + ", cardCategoryStatus="
				+ cardCategoryStatus + "]";
	}
	
	
}
