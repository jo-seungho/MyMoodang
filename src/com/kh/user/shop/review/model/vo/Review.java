package com.kh.user.shop.review.model.vo;
// 2023.04.14
//소현아

// 이태화 - 날짜 DATE -> STRING 으로 수정

public class Review {

		private int reviewNo;         //	review_no	number
		private String title;         //	title	varchar2(40 byte)
		private String content;       //	content	varchar2(4000 byte)
		private String writeDate;       //	write_date	String
		private int starPoint;        //	star_point	number
		private String filePathName;  //	file_path_name	varchar2(50 byte)
		private int orderNo;          //	order_no	number
		private int itemCode;         //	item_code	number
		
		
		public Review() {
			// TODO Auto-generated constructor stub
		}
		
		public int getReviewNo() {
			return reviewNo;
		}
		public void setReviewNo(int reviewNo) {
			this.reviewNo = reviewNo;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getWriteDate() {
			return writeDate;
		}
		public void setWriteDate(String writeDate) {
			this.writeDate = writeDate;
		}
		public int getStarPoint() {
			return starPoint;
		}
		public void setStarPoint(int starPoint) {
			this.starPoint = starPoint;
		}
		public String getFilePathName() {
			return filePathName;
		}
		public void setFilePathName(String filePathName) {
			this.filePathName = filePathName;
		}
		public int getOrderNo() {
			return orderNo;
		}
		public void setOrderNo(int orderNo) {
			this.orderNo = orderNo;
		}
		public int getItemCode() {
			return itemCode;
		}
		public void setItemCode(int itemCode) {
			this.itemCode = itemCode;
		}
		public Review(int reviewNo, String title, String content, String writeDate, int starPoint, String filePathName,
				int orderNo, int itemCode) {
			super();
			this.reviewNo = reviewNo;
			this.title = title;
			this.content = content;
			this.writeDate = writeDate;
			this.starPoint = starPoint;
			this.filePathName = filePathName;
			this.orderNo = orderNo;
			this.itemCode = itemCode;
		}
		@Override
		public String toString() {
			return "Review [reviewNo=" + reviewNo + ", title=" + title + ", content=" + content + ", writeDate="
					+ writeDate + ", starPoint=" + starPoint + ", filePathName=" + filePathName + ", orderNo=" + orderNo
					+ ", itemCode=" + itemCode + "]";
		}
		public Review(int reviewNo, String title, String content, String writeDate, int starPoint, int orderNo) {
			super();
			this.reviewNo = reviewNo;
			this.title = title;
			this.content = content;
			this.writeDate = writeDate;
			this.starPoint = starPoint;
			this.orderNo = orderNo;
		}

		public Review(int reviewNo, String title, String content, String writeDate, int starPoint, int orderNo,
				int itemCode) {
			super();
			this.reviewNo = reviewNo;
			this.title = title;
			this.content = content;
			this.writeDate = writeDate;
			this.starPoint = starPoint;
			this.orderNo = orderNo;
			this.itemCode = itemCode;
		}
		
		

		
		
}

