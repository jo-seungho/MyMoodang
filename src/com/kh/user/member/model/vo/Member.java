

package com.kh.user.member.model.vo;

import com.kh.common.model.vo.Converter;

public class Member {
// 2023-04-13 김서영
// 2023-04-23 조승호 수정 : cartCount 추가
	private int cartCount;
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

	public Member() {

	}

	public Member(int cartCount, int memberNo, String memberId, String password, String name, String birthDate, String gender,
			String email, String phone, String enrollDate, String modifyDate, String status, int totalMoney,
			String gradeNo) {
		super();
		this.cartCount = cartCount;
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

	/**
	 * 2023-04-15 김서영 회원가입용 생성자
	 *
	 * @param memberId
	 * @param password
	 * @param name
	 * @param birthDate
	 * @param gender
	 * @param email
	 * @param phone
	 */
	public Member(String memberId, String password, String name, String birthDate, String gender, String email,
			String phone) {
		super();
		this.memberId = memberId;
		this.password = password;
		this.name = name;
		this.birthDate = birthDate;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
	}

	/**
	 * 아이디 찾기 용 생성자
	 * 2023-04-17 김서영
	 * @param name
	 * @param phone
	 */
	public Member(String name, String phone) {
		super();
		this.name = name;
		this.phone = phone;
	}

	
	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}



	/**
	 * 정보 수정용 생성자
	 * 2023-04-20 김서영
	 * @param memberId
	 * @param name
	 * @param birthDate
	 * @param gender
	 * @param email
	 * @param phone
	 */
	public Member(String memberId, String name, String birthDate, String gender, String email, String phone) {
		super();
		this.memberId = memberId;
		this.name = name;
		this.birthDate = birthDate;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
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
		this.gender = Converter.convert(gender);
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
		this.status = Converter.convert(status);

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
		return "Member [cartCount=" + cartCount + ", memberNo=" + memberNo + ", memberId=" + memberId + ", password="
				+ password + ", name=" + name + ", birthDate=" + birthDate + ", gender=" + gender + ", email=" + email
				+ ", phone=" + phone + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", status="
				+ status + ", totalMoney=" + totalMoney + ", gradeNo=" + gradeNo + "]";
	}


}