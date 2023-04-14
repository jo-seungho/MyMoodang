package com.kh.member.model.vo;

public class Member {
// 2023-04-13 김서영
	private int memberNo;
	private String memberId;
	private String password;
	private String name;
	private String birthDate;
	private String gender;
	private String email;
	private String phone;
	private String enrollDate;
	private String modifyDate;
	private String status;
	private int totalMoney;
	private String gradeNo;


	public Member() {}


	public Member(int memberNo, String memberId, String password, String name, String birthDate, String gender,
			String email, String phone, String enrollDate, String modifyDate, String status, int totalMoney,
			String gradeNo) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.password = password;
		this.name = name;
		this.birthDate = birthDate;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.totalMoney = totalMoney;
		this.gradeNo = gradeNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getBirthDate() {
		return birthDate;
	}


	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		if(gender.equals("M")) {
			this.gender = "남자";
		} else {
			this.gender = "여자";
		}
	}
	


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		if(status.equals("Y")) {
			this.status = "활동";
		} else {
			this.status = "탈퇴";
		}
		
	}
	



	public int getTotalMoney() {
		return totalMoney;
	}


	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}


	public String getGradeNo() {
		return gradeNo;
	}


	public void setGradeNo(String gradeNo) {
		this.gradeNo = gradeNo;
	}
	
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", password=" + password + ", name=" + name
				+ ", birthDate=" + birthDate + ", gender=" + gender + ", email=" + email + ", phone=" + phone
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", status=" + status + ", totalMoney="
				+ totalMoney + ", gradeNo=" + gradeNo + "]";
	}



}
