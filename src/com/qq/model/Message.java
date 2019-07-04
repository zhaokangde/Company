package com.qq.model;

public class Message {
	int contentid;
	int classid;
	String title;
	String contents;
	String publish_time;
	
	
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Message(int contentid, int classid, String title, String contents, String publish_time) {
		super();
		this.contentid = contentid;
		this.classid = classid;
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
	
	
	
}
