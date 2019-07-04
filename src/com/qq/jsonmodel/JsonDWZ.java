package com.qq.jsonmodel;

public class JsonDWZ {
	
	//״̬�룬200��ʾ����
		private String statusCode;
		//������ʾ
		private String message;
		//Ҫˢ�µ���ҳ
		private String navTabId;
		//����
		private String rel;
		//ֵΪcoluseCurrent������رյ�ǰ���
		private String callbackType;

		private String forwardUrl;

		private String confirmMsg;
		
		
		//���췽��
		public JsonDWZ(String statusCode, String message, String navTabId, String rel, String callbackType,
				String forwardUrl, String confirmMsg) {
			super();
			this.statusCode = statusCode;
			this.message = message;
			this.navTabId = navTabId;
			this.rel = rel;
			this.callbackType = callbackType;
			this.forwardUrl = forwardUrl;
			this.confirmMsg = confirmMsg;
		}
}
