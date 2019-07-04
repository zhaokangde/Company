package com.qq.model;

public class Picture {
	int  id ;
	String picurl;
	public Picture(int id, String picurl) {
		super();
		this.id = id;
		this.picurl = picurl;
	}
	public Picture() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPicurl() {
		return picurl;
	}
	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}

	
}
