package com.kh.board.notice.model.vo;
// 2023/04/14
// 소현아



public class Notice {

		private int noticeNo;         //	notice_no	number
		private String noticeTitle;   //	notice_title	varchar2(200 BYTE)
		private String noticeContent; //	notice_content	clob
		private String createDate;      //	create_date	date
		private int views;            //	views	number
		private String deleteStatus;  //	delete_status	char(1 byte)
	
		public Notice() { }

		public Notice(int noticeNo, String noticeTitle, String noticeContent,String createDate, int views,
				String deleteStatus) {
			super();
			this.noticeNo = noticeNo;
			this.noticeTitle = noticeTitle;
			this.noticeContent = noticeContent;
			this.createDate = createDate;
			this.views = views;
			this.deleteStatus = deleteStatus;
		}
		
		
		
		

		public Notice(int noticeNo, String noticeTitle, String createDate, int views) {
			super();
			this.noticeNo = noticeNo;
			this.noticeTitle = noticeTitle;
			this.createDate = createDate;
			this.views = views;
		}

		
		
		public int getNoticeNo() {
			return noticeNo;
		}

		public void setNoticeNo(int noticeNo) {
			this.noticeNo = noticeNo;
		}

		public String getNoticeTitle() {
			return noticeTitle;
		}

		public void setNoticeTitle(String noticeTitle) {
			this.noticeTitle = noticeTitle;
		}

		public String getNoticeContent() {
			return noticeContent;
		}

		public void setNoticeContent(String noticeContent) {
			this.noticeContent = noticeContent;
		}

		public String getCreateDate() {
			return createDate;
		}

		public void setCreateDate(String createDate) {
			this.createDate = createDate;
		}

		public int getViews() {
			return views;
		}

		public void setViews(int views) {
			this.views = views;
		}

		public String getDeleteStatus() {
			return deleteStatus;
		}

		public void setDeleteStatus(String deleteStatus) {
			this.deleteStatus = deleteStatus;
		}

		
		
		@Override
		public String toString() {
			return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
					+ ", createDate=" + createDate + ", views=" + views + ", deleteStatus=" + deleteStatus + "]";
		}
		
		
		
		
		
}
