package com.qq.model;

public class ClassMg {
	
	int classid;
	String classname;
	public ClassMg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ClassMg(int classid, String classname) {
		super();
		this.classid = classid;
		this.classname = classname;
	}
	public int getClassid() {
		return classid;
	}
	public void setClassid(int classid) {
		this.classid = classid;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}

}
