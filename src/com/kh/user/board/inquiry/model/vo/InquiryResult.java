// 2023-04-18 김서영
// 1:1 문의 등록 ajax 처리용 VO

package com.kh.user.board.inquiry.model.vo;

public class InquiryResult {

	private int memberNo;
	private String type;
    private String title;
	private String content;
	private String success;
	private String message;

	public InquiryResult() {}

	public InquiryResult(int memberNo, String type, String title, String content, String success, String message) {
		super();
		this.memberNo = memberNo;
		this.type = type;
		this.title = title;
		this.content = content;
		this.success = success;
		this.message = message;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "InquiryResult [memberNo=" + memberNo + ", type=" + type + ", title=" + title + ", content=" + content + ", success=" + success + ", message=" + message + "]";
	}




}
