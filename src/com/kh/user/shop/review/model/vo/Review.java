package com.kh.user.shop.review.model.vo;
// 2023.04.14
//소현아

//2023.04.21
// 이태화 - 수정


public class Review {

		//	REVIEW_NO	NUMBER
		//	TITLE	VARCHAR2(40 BYTE)
		//	CONTENT	VARCHAR2(4000 BYTE)
		//	WRITE_DATE	DATE
		//	STAR_POINT	NUMBER
		//	ITEM_CODE	NUMBER
		//	MEMBER_NO	NUMBER

		private int reviewNo;
		private String title;
		private String content;
		private String writeDate;
		private int starPoint;
		private int itemCode;
		private int memberNo;
		private String MemberId;

		public Review() {
			super();
		}

		public Review(int reviewNo, String title, String content, String writeDate, int starPoint, int itemCode,
				int memberNo) {
			super();
			this.reviewNo = reviewNo;
			this.title = title;
			this.content = content;
			this.writeDate = writeDate;
			this.starPoint = starPoint;
			this.itemCode = itemCode;
			this.memberNo = memberNo;
		}
		
		// 상세페이지 리뷰 조회용
		public Review(int reviewNo, String title, String content, String writeDate, int starPoint, int itemCode,
				int memberNo, String memberId) {
			super();
			this.reviewNo = reviewNo;
			this.title = title;
			this.content = content;
			this.writeDate = writeDate;
			this.starPoint = starPoint;
			this.itemCode = itemCode;
			this.memberNo = memberNo;
			this.MemberId = memberId;
		}
		
		
		
		
		// 상세페이지 리뷰 인서트
		public Review(String title, String content, int starPoint, int itemCode, int memberNo) {
			super();
			this.title = title;
			this.content = content;
			this.starPoint = starPoint;
			this.itemCode = itemCode;
			this.memberNo = memberNo;
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

		public int getItemCode() {
			return itemCode;
		}

		public void setItemCode(int itemCode) {
			this.itemCode = itemCode;
		}

		public int getMemberNo() {
			return memberNo;
		}

		public void setMemberNo(int memberNo) {
			this.memberNo = memberNo;
		}
		
		

		public String getMemberId() {
			return MemberId;
		}

		public void setMemberId(String memberId) {
			this.MemberId = memberId;
		}

		@Override
		public String toString() {
			return "Review [reviewNo=" + reviewNo + ", title=" + title + ", content=" + content + ", writeDate="
					+ writeDate + ", starPoint=" + starPoint + ", itemCode=" + itemCode + ", memberNo=" + memberNo
					+ "]";
		}
		
		
		

}

