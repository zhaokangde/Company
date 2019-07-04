package com.qq.model;

public class User {
	
	private int userid;
	private String username;
	private String password;
	private String power;
	private String email;
	private  String acl ;
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(int userid, String username, String password, String power, String email, String acl) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.power = power;
		this.email = email;
		this.acl = acl;
	}

	public User(int userid, String username, String password, String power) {
		super();
		this.userid = userid;
		this.username = username;
		this.password = password;
		this.power = power;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAcl() {
		return acl;
	}

	public void setAcl(String acl) {
		this.acl = acl;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
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

	public String getPower() {
		return power;
	}

	public void setPower(String power) {
		this.power = power;
	}
	
	
	
}
