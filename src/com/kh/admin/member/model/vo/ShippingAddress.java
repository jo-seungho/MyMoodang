// 2023-04-15 김서영
// 배송지 관련 VO

package com.kh.admin.member.model.vo;

public class ShippingAddress {

	private int shipNo;
	private String shipAddr;
	private String shipAddrInfo;
	private String phone;
	private String shipName;
	private int memberNo;
	private String zipcode;


	public ShippingAddress() {}


	public ShippingAddress(int shipNo, String shipAddr, String shipAddrInfo, String phone, String shipName,
			int memberNo, String zipcode) {
		super();
		this.shipNo = shipNo;
		this.shipAddr = shipAddr;
		this.shipAddrInfo = shipAddrInfo;
		this.phone = phone;
		this.shipName = shipName;
		this.memberNo = memberNo;
		this.zipcode = zipcode;
	}



	/** 2023-04-15 김서영
	 * 회원 가입용 생성자
	 * @param shipAddr
	 * @param shipAddrInfo
	 * @param phone
	 * @param zipcode
	 */
	public ShippingAddress(String shipAddr, String shipAddrInfo, String phone, String zipcode) {
		super();
		this.shipAddr = shipAddr;
		this.shipAddrInfo = shipAddrInfo;
		this.phone = phone;
		this.zipcode = zipcode;
	}


	public int getShipNo() {
		return shipNo;
	}


	public void setShipNo(int shipNo) {
		this.shipNo = shipNo;
	}


	public String getShipAddr() {
		return shipAddr;
	}


	public void setShipAddr(String shipAddr) {
		this.shipAddr = shipAddr;
	}


	public String getShipAddrInfo() {
		return shipAddrInfo;
	}


	public void setShipAddrInfo(String shipAddrInfo) {
		this.shipAddrInfo = shipAddrInfo;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getShipName() {
		return shipName;
	}


	public void setShipName(String shipName) {
		this.shipName = shipName;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getZipcode() {
		return zipcode;
	}


	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}


	@Override
	public String toString() {
		return "ShippingAddress [shipNo=" + shipNo + ", shipAddr=" + shipAddr + ", shipAddrInfo=" + shipAddrInfo
				+ ", phone=" + phone + ", shipName=" + shipName + ", memberNo=" + memberNo + ", zipcode=" + zipcode
				+ "]";
	}




}
