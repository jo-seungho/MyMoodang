package com.kh.admin.shop.review.model.vo;
// 2023-04-14
//소현아

import java.sql.Date;

public class Review {

		private int reviewNo;         //	review_no	number
		private String title;         //	title	varchar2(40 byte)
		private String content;       //	content	varchar2(4000 byte)
		private String writeDate;       //	write_date	date
		private int starPoint;        //	star_point	number
		private String filePathName;  //	file_path_name	varchar2(50 byte)
		private int orderNo;          //	order_no	number
		private int itemCode;         //	item_code	number
        private int memberNo;         //    MEMBER_NO
        private String deleteStatus;  //    DELETE_STATUS
		private String memberId;
        
        
        
		public Review() { }







		public Review(int reviewNo, String title, String content, String writeDate, int starPoint, String filePathName,
				int orderNo, int itemCode, int memberNo, String deleteStatus, String memberId) {
			super();
			this.reviewNo = reviewNo;
			this.title = title;
			this.content = content;
			this.writeDate = writeDate;
			this.starPoint = starPoint;
			this.filePathName = filePathName;
			this.orderNo = orderNo;
			this.itemCode = itemCode;
			this.memberNo = memberNo;
			this.deleteStatus = deleteStatus;
			this.memberId = memberId;
		}








		public Review(String title, String writeDate, int starPoint, int orderNo, String memberId) {
			super();
			this.title = title;
			this.writeDate = writeDate;
			this.starPoint = starPoint;
			this.orderNo = orderNo;
			this.memberId = memberId;
		}




		public String getMemberId() {
			return memberId;
		}


		public void setMemberId(String memberId) {
			this.memberId = memberId;
		}


		public int getMemberNo() {
			return memberNo;
		}


		public void setMemberNo(int memberNo) {
			this.memberNo = memberNo;
		}


		public String getDeleteStatus() {
			return deleteStatus;
		}


		public void setDeleteStatus(String deleteStatus) {
			this.deleteStatus = deleteStatus;
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







		@Override
		public String toString() {
			return "Review [reviewNo=" + reviewNo + ", title=" + title + ", content=" + content + ", writeDate="
					+ writeDate + ", starPoint=" + starPoint + ", filePathName=" + filePathName + ", orderNo=" + orderNo
					+ ", itemCode=" + itemCode + ", memberNo=" + memberNo + ", deleteStatus=" + deleteStatus
					+ ", memberId=" + memberId + "]";
		}


	

		
		
		
		
		
}
