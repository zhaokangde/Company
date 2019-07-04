package com.qq.model;
public class Critical {
	String resId;
	int craticId;
	String username;
	int contentId;
	String  cratiContent;
	String craticType;
	String craticTime;

	public Critical(String resId, String username, int contentId, String cratiContent, String craticType,
			String craticTime) {
		super();
		this.resId = resId;
		this.username = username;
		this.contentId = contentId;
		this.cratiContent = cratiContent;
		this.craticType = craticType;
		this.craticTime = craticTime;
	}
	public Critical(int craticId,String resId, String username, int contentId, String cratiContent, String craticType,
			String craticTime) {
		super();
		this.resId = resId;
		this.craticId = craticId;
		this.username = username;
		this.contentId = contentId;
		this.cratiContent = cratiContent;
		this.craticType = craticType;
		this.craticTime = craticTime;
	}
	public String getResId() {
		return resId;
	}

	public Critical(String resId, int craticId, String username, int contentId, String cratiContent, String craticType,
			String craticTime) {
		super();
		this.resId = resId;
		this.craticId = craticId;
		this.username = username;
		this.contentId = contentId;
		this.cratiContent = cratiContent;
		this.craticType = craticType;
		this.craticTime = craticTime;	
	}
	public void setResId(String resId) {
		this.resId = resId;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getCraticId() {
		return craticId;
	}

	public void setCraticId(int craticId) {
		this.craticId = craticId;
	}

	public String getUserName() {
		return username;
	}

	public void setUserName(String userName) {
		this.username = userName;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public String getCratiContent() {
		return cratiContent;
	}

	public void setCratiContent(String cratiContent) {
		this.cratiContent = cratiContent;
	}

	public String getCraticType() {
		return craticType;
	}

	public void setCraticType(String craticType) {
		this.craticType = craticType;
	}

	public String getCraticTime() {
		return craticTime;
	}

	public void setCraticTime(String craticTime) {
		this.craticTime = craticTime;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
	
}
