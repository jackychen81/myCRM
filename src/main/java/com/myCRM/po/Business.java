package com.myCRM.po;

import java.util.Date;
import java.util.List;

public class Business {
	
	private String bid;
	private User user;
	private Card card;
	private List<Item> item;
	private Date date = new Date();
	private double totalPrice;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Card getCard() {
		return card;
	}
	public void setCard(Card card) {
		this.card = card;
	}
	public List<Item> getItem() {
		return item;
	}
	public void setItem(List<Item> item) {
		this.item = item;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	@Override
	public String toString() {
		return "Business [bid=" + bid + ", user=" + user + ", card=" + card
				+ ", item=" + item + ", date=" + date + ", totalPrice="
				+ totalPrice + "]";
	}
}
