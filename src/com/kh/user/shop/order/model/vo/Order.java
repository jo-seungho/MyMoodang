package com.kh.user.shop.order.model.vo;
// 2023-04-24 조승호

public class Order {
	
	private int orderNo;			//	주문번호
	private int deliveryFee;		//	배송비
	private String request;			//	요청사항
	private	String resPhone;		//	받는사람 전화번호
	private	String orderDate;		//	주문일
	private	String isVisible;		//	일반사용자 노출 여부
	private	String trackingNo;		//	운송장번호
	private	String paymentNo;		//	결제번호
	private	String paymentStatus;	//	결제여부
	private	int memberNo;			//	회원번호
	private	int shipNo;				//	배송지번호
	private	int paymentAmount;		//	결제금액
	private	String orderStatus;		//	주문상태
	
	public Order() { }
	
	public Order(String resPhone, int memberNo, int shipNo, int paymentAmount) {
		super();
		this.resPhone = resPhone;
		this.memberNo = memberNo;
		this.shipNo = shipNo;
		this.paymentAmount = paymentAmount;
	}

	public Order(int orderNo, int deliveryFee, String request, String resPhone, String orderDate, String isVisible,
			String trackingNo, String paymentNo, String paymentStatus, int memberNo, int shipNo, int paymentAmount,
			String orderStatus) {
		super();
		this.orderNo = orderNo;
		this.deliveryFee = deliveryFee;
		this.request = request;
		this.resPhone = resPhone;
		this.orderDate = orderDate;
		this.isVisible = isVisible;
		this.trackingNo = trackingNo;
		this.paymentNo = paymentNo;
		this.paymentStatus = paymentStatus;
		this.memberNo = memberNo;
		this.shipNo = shipNo;
		this.paymentAmount = paymentAmount;
		this.orderStatus = orderStatus;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getDeliveryFee() {
		return deliveryFee;
	}

	public void setDeliveryFee(int deliveryFee) {
		this.deliveryFee = deliveryFee;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getResPhone() {
		return resPhone;
	}

	public void setResPhone(String resPhone) {
		this.resPhone = resPhone;
	}

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
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

	public String getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
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

	public int getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", deliveryFee=" + deliveryFee + ", request=" + request + ", resPhone="
				+ resPhone + ", orderDate=" + orderDate + ", isVisible=" + isVisible + ", trackingNo=" + trackingNo
				+ ", paymentNo=" + paymentNo + ", paymentStatus=" + paymentStatus + ", memberNo=" + memberNo
				+ ", shipNo=" + shipNo + ", paymentAmount=" + paymentAmount + ", orderStatus=" + orderStatus + "]";
	}
	
}
