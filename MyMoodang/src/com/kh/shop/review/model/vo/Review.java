package com.kh.shop.review.model.vo;
// 2023년 04월 13일 소현아

import java.sql.Date;

public class Review {

			private int reviewNo;       //	REVIEW_NO	NUMBER
			private String title;       //	TITLE	VARCHAR2(40 BYTE)
			private String content;     //	CONTENT	VARCHAR2(4000 BYTE)
			private Date writeDate;     //	WRITE_DATE	DATE
			private int starPoint;      //	STAR_POINT	NUMBER
			private String filePathName;//	FILE_PATH_NAME	VARCHAR2(50 BYTE)
			private int orderNo;        //	ORDER_NO	NUMBER
			private int itemCode;       //	ITEM_CODE	NUMBER
			
			
			
			public Review () { }



			public Review(int reviewNo, String title, String content, Date writeDate, int starPoint,
					String filePathName, int orderNo, int itemCode) {
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



			public Date getWriteDate() {
				return writeDate;
			}



			public void setWriteDate(Date writeDate) {
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
						+ writeDate + ", starPoint=" + starPoint + ", filePathName=" + filePathName + ", orderNo="
						+ orderNo + ", itemCode=" + itemCode + "]";
			}
			
			
			
			
}
