// 이메일 인증 용 VO
// 2023-04-23 김서영

package com.kh.user.member.model.vo;

public class EmailAuthResult {

	private String success;
	private String message;
	private int authNo;

	public EmailAuthResult() {}

	public EmailAuthResult(String success, String message, int authNo) {
		super();
		this.success = success;
		this.message = message;
		this.authNo = authNo;
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

	public int getAuthNo() {
		return authNo;
	}

	public void setAuthNo(int authNo) {
		this.authNo = authNo;
	}

	@Override
	public String toString() {
		return "EmailAuthResult [success=" + success + ", message=" + message + ", authNo=" + authNo + "]";
	}







}
