// 아이디 찾기용 VO
// 2023-04-17 김서영

package com.kh.user.member.model.vo;

public class MemberFindId {

	private String memberName ;
	private String memberId;
	private String success;
	private String message;


	public MemberFindId() {}


	public MemberFindId(String memberName, String memberId, String success, String message) {
		super();
		this.memberName = memberName;
		this.memberId = memberId;
		this.success = success;
		this.message = message;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
		return "MemberFindId [memberName=" + memberName + ", memberId=" + memberId + ", success=" + success + ", message=" + message + "]";
	}





}
