// 2023.04.25 기본 배송지 필드 추가 및 그에 따른 수정, toString 추가, 
// shipNo, defaultAddress, memberNo 하나로 묶는 생성자부 추가 / 이지환

	/* 기본배송지 체크용 생성자 이지환 */

// 2023-04.24 / 배송지 수정 생성자 추가 / 이지환
// 배송지 관련 VO



package com.kh.user.member.model.vo;

public class ShippingAddress {

	private int shipNo;
	private String shipAddr;
	private String shipAddrInfo;
	private String phone;
	private String shipName;
	private int memberNo;
	private String zipcode;
	private String defaultAddress;

	public ShippingAddress() {}

/* defaultAddress */
	public ShippingAddress(int shipNo, String shipAddr, String shipAddrInfo, String phone, String shipName,
			int memberNo, String defaultAddress) {
		super();
		this.shipNo = shipNo;
		this.shipAddr = shipAddr;
		this.shipAddrInfo = shipAddrInfo;
		this.phone = phone;
		this.shipName = shipName;
		this.memberNo = memberNo;
		this.defaultAddress = defaultAddress;
	}


	// 2023.04.25 기본배송지 추가
	public ShippingAddress(int shipNo, String shipAddr, String shipAddrInfo, String phone, String shipName,
			int memberNo, String zipcode, String defaultAddress) {
		super();
		this.shipNo = shipNo;
		this.shipAddr = shipAddr;
		this.shipAddrInfo = shipAddrInfo;
		this.phone = phone;
		this.shipName = shipName;
		this.memberNo = memberNo;
		this.zipcode = zipcode;
		this.defaultAddress = defaultAddress;
	}

	
	/* 기본배송지 체크용 생성자 이지환 */
	public ShippingAddress(String defaultAddress) {
		super();
		this.defaultAddress = defaultAddress;
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
	
	/* 배송지 수정용 생성자 */
	
	// 2023.04.25 default_Addr 추가 이지환
	public ShippingAddress(int shipNo, String shipAddr, String shipAddrInfo, String phone, String shipName, String defaultAddress) {
		super();
		this.shipNo = shipNo;
		this.shipAddr = shipAddr;
		this.shipAddrInfo = shipAddrInfo;
		this.phone = phone;
		this.shipName = shipName;
		this.defaultAddress = defaultAddress;
	}


	public int getShipNo() {
		return shipNo;
	}

	

	/* 2023.04.25 마이페이지에서 배송지 추가용 */

	/**
	 * 2023.04.25 회원별 배송지목록에 기본 배송지가 있는 지 체크용 생성자부 추가 / 이지환
	 * @param shipNo
	 * @param memberNo
	 * @param defaultAddress
	 */
	public ShippingAddress(int shipNo, int memberNo, String defaultAddress) {
		super();
		this.shipNo = shipNo;
		this.memberNo = memberNo;
		this.defaultAddress = defaultAddress;
	}

	public String getDefaultAddress() {
		return defaultAddress;
	}


	public void setDefaultAddress(String defaultAddress) {
		this.defaultAddress = defaultAddress;
	}

	
	/* 2023.04.25 기본배송지 추가 */
	public ShippingAddress(int shipNo, String shipAddr, String shipAddrInfo, int memberNo, String defaultAddress) {
		super();
		this.shipNo = shipNo;
		this.shipAddr = shipAddr;
		this.shipAddrInfo = shipAddrInfo;
		this.memberNo = memberNo;
		this.defaultAddress = defaultAddress;
	}
	
	/* 2023.04.25 shipNo 기준 배송지 정보들을 조회 */


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
				+ ", defaultAddress=" + defaultAddress + "]";
	}


	




}
