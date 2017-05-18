package com.myCRM.po;

import java.util.List;

public class User {
	
	private int id;
	private String username;
	private String password;
	private int gender;//0-Female;1-Male
	private Integer age;
	private String phone;
	private String wechat;
	private String position;
	private int userType;//1-admin;2-manager;3-staff;4-normal customer;5-vip1 customer;6-vip2 customer;7-vvip customer
	private int status;//0-disable;1-enable
	private List<Card> card;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getWechat() {
		return wechat;
	}
	public void setWechat(String wechat) {
		this.wechat = wechat;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public List<Card> getCard() {
		return card;
	}
	public void setCard(List<Card> card) {
		this.card = card;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", gender=" + gender + ", age=" + age + ", phone="
				+ phone + ", wechat=" + wechat + ", position=" + position
				+ ", userType=" + userType + ", status=" + status + ", card="
				+ card + "]";
	}
	
}
