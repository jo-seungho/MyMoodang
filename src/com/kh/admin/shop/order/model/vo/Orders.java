package com.kh.admin.shop.order.model.vo;

public class Orders {
	
	private int orderNo; // 주문번호
	private int fee; // 배송비
	private String request; //요청사항
	private int res_Phone; // 전화번호
	private String order_Date; // 주문 일자
	private String order_Status; // 주문 상태
	private String isVisible; // 사용자 노출
	private String trackingNo; // 운송번호
	private String payment; //결제금액
	private int memberNo; // 회원번호
	private int shipNo; //배송지번호
	
	public Orders() {
		// TODO Auto-generated constructor stub
	}
	
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getFee() {
		return fee;
	}
	public void setFee(int fee) {
		this.fee = fee;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public int getRes_Phone() {
		return res_Phone;
	}
	public void setRes_Phone(int res_Phone) {
		this.res_Phone = res_Phone;
	}
	public String getOrder_Date() {
		return order_Date;
	}
	public void setOrder_Date(String order_Date) {
		this.order_Date = order_Date;
	}
	public String getOrder_Status() {
		return order_Status;
	}
	public void setOrder_Status(String order_Status) {
		this.order_Status = order_Status;
	}
	public String getIsVisible() {
		return isVisible;
	}
	public void setIsVisible(String isVisible) {
		this.isVisible = isVisible;
	}
	public String getTrackingNo() {
		return trackingNo;
	}
	public void setTrackingNo(String trackingNo) {
		this.trackingNo = trackingNo;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getShipNo() {
		return shipNo;
	}
	public void setShipNo(int shipNo) {
		this.shipNo = shipNo;
	}
	
	
	
}
