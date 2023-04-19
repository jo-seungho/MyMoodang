// 2023-04-17 김서영
// 1:1 문의 VO

package com.kh.user.board.inquiry.model.vo;

public class Inquiry {

	private int inqNo;   			// 문의번호
	private String title;           // 제목
	private String description;     // 문의내용
	private String dateCreate;      // 작성일
	private String inquiryType;     // 문의유형
	private String replyContents;   // 답변내용
	private String replyDate;       // 답변일
	private int memberNo;           // 회원번호


	public Inquiry() {}


	public Inquiry(int inqNo, String title, String description, String dateCreate, String inquiryType, String replyContents, String replyDate, int memberNo) {
		super();
		this.inqNo = inqNo;
		this.title = title;
		this.description = description;
		this.dateCreate = dateCreate;
		this.inquiryType = inquiryType;
		this.replyContents = replyContents;
		this.replyDate = replyDate;
		this.memberNo = memberNo;
	}






	/**
	 * 1:1 문의 등록용 / 수정용 생성자
	 * 2023-04-18 김서영
	 * @param title
	 * @param description
	 * @param inquiryType
	 */
	public Inquiry(int inqNo, String title, String description, String inquiryType) {
		super();

		this.inqNo = inqNo;
		this.title = title;
		this.description = description;
		this.inquiryType = inquiryType;
	}


	public int getInqNo() {
		return inqNo;
	}


	public void setInqNo(int inqNo) {
		this.inqNo = inqNo;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getDateCreate() {
		return dateCreate;
	}


	public void setDateCreate(String dateCreate) {
		this.dateCreate = dateCreate;
	}


	public String getInquiryType() {
		return inquiryType;
	}


	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}


	public String getReplyContents() {
		return replyContents;
	}


	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}


	public String getReplyDate() {
		return replyDate;
	}


	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	@Override
	public String toString() {
		return "Inquiry [inqNo=" + inqNo + ", title=" + title + ", description=" + description + ", dateCreate=" + dateCreate + ", inquiryType=" + inquiryType + ", replyContents=" + replyContents
				+ ", replyDate=" + replyDate + ", memberNo=" + memberNo + "]";
	}






}
