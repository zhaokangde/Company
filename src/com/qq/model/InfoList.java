package com.qq.model;

import java.util.Date;

public class InfoList {
	int contentid;
	int classid;
	int picid;
	String classname;
	String  url;
	String title;
	String contents;
	String publish_time;
	public InfoList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InfoList(int contentid, int classid, int picid, String classname, String url, String title, String contents,
			String publish_time) {
		super();
		this.contentid = contentid;
		this.classid = classid;
		this.picid = picid;
		this.classname = classname;
		this.url = url;
		this.title = title;
		this.contents = contents;
		this.publish_time = publish_time;
	}
	public int getContentid() {
		return contentid;
	}
	public void setContentid(int contentid) {
		this.contentid = contentid;
	}
	public int getClassid() {
		return classid;
	}
	public void setClassid(int classid) {
		this.classid = classid;
	}
	public int getPicid() {
		return picid;
	}
	public void setPicid(int picid) {
		this.picid = picid;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getPublish_time() {
		return publish_time;
	}
	public void setPublish_time(String publish_time) {
		this.publish_time = publish_time;
	}
	@Override
	public String toString() {
		return "InfoList [contentid=" + contentid + ", classid=" + classid + ", picid=" + picid + ", classname="
				+ classname + ", url=" + url + ", title=" + title + ", contents=" + contents + ", publishtime="
				+ publish_time + "]";
	}
	

	
}
