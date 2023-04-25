// 임시비밀번호 수정 확인용 VO
// 2023-04-24 김서영

package com.kh.user.member.model.vo;

public class ExtraPwdResult {

	private String success;
	private String message;
	private String extraPwd;

	public ExtraPwdResult() {}

	public ExtraPwdResult(String success, String message, String extraPwd) {
		super();
		this.success = success;
		this.message = message;
		this.extraPwd = extraPwd;
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

	public String getExtraPwd() {
		return extraPwd;
	}

	public void setExtraPwd(String extraPwd) {
		this.extraPwd = extraPwd;
	}

	@Override
	public String toString() {
		return "ExtraPwdResult [success=" + success + ", message=" + message + ", extraPwd=" + extraPwd + "]";
	}





}
