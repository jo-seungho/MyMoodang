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
	private int quantity;			//  상품 주문 수량
	private int itemPrice;			//	상품 하나의 가격
	private String itemImg;			//	상품 이미지
	private String memberName;		// 	회원 이름
	private String gradeNo;			//	회원 등급
	private String address;			//  회원 주소
	private int itemList;			//	상품 번호
	private String itemName;		//  상품 이름
	
	
	public Order() { }
	
	public Order(String resPhone, int memberNo, int shipNo, int paymentAmount, String trackingNo) {

		super();
		this.resPhone = resPhone;
		this.memberNo = memberNo;
		this.shipNo = shipNo;
		this.paymentAmount = paymentAmount;
		this.trackingNo = trackingNo;
	}

	public Order(int orderNo, int deliveryFee, String request, String resPhone, String orderDate, String isVisible,
			String trackingNo, String paymentNo, String paymentStatus, int memberNo, int shipNo, int paymentAmount,
			String orderStatus, String itemName) {
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
		this.itemName = itemName;
	}
	

	public Order(int orderNo, int deliveryFee, String request, String resPhone, String orderDate, String trackingNo,
			String paymentNo, String paymentStatus, int memberNo, int shipNo, int paymentAmount, String orderStatus,
			int quantity, int itemPrice, String itemImg, String memberName, String gradeNo, String address,
			int itemList, String itemName) {
		super();
		this.orderNo = orderNo;
		this.deliveryFee = deliveryFee;
		this.request = request;
		this.resPhone = resPhone;
		this.orderDate = orderDate;
		this.trackingNo = trackingNo;
		this.paymentNo = paymentNo;
		this.paymentStatus = paymentStatus;
		this.memberNo = memberNo;
		this.shipNo = shipNo;
		this.paymentAmount = paymentAmount;
		this.orderStatus = orderStatus;
		this.quantity = quantity;
		this.itemPrice = itemPrice;
		this.itemImg = itemImg;
		this.memberName = memberName;
		this.gradeNo = gradeNo;
		this.address = address;
		this.itemList = itemList;
		this.itemName = itemName;
	}

	public Order(int orderNo, int deliveryFee, String request, String resPhone, String orderDate, String isVisible,
			String trackingNo, String paymentNo, String paymentStatus, int memberNo, int shipNo, int paymentAmount,
			String orderStatus, int quantity, int itemPrice, String itemImg, String memberName, String gradeNo,
			String address, int itemList) {
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
		this.quantity = quantity;
		this.itemPrice = itemPrice;
		this.itemImg = itemImg;
		this.memberName = memberName;
		this.gradeNo = gradeNo;
		this.address = address;
		this.itemList = itemList;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String getItemImg() {
		return itemImg;
	}

	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(String gradeNo) {
		this.gradeNo = gradeNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getItemList() {
		return itemList;
	}

	public void setItemList(int itemList) {
		this.itemList = itemList;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", deliveryFee=" + deliveryFee + ", request=" + request + ", resPhone="
				+ resPhone + ", orderDate=" + orderDate + ", isVisible=" + isVisible + ", trackingNo=" + trackingNo
				+ ", paymentNo=" + paymentNo + ", paymentStatus=" + paymentStatus + ", memberNo=" + memberNo
				+ ", shipNo=" + shipNo + ", paymentAmount=" + paymentAmount + ", orderStatus=" + orderStatus
				+ ", quantity=" + quantity + ", itemPrice=" + itemPrice + ", itemImg=" + itemImg + ", memberName="
				+ memberName + ", gradeNo=" + gradeNo + ", address=" + address + ", itemList=" + itemList
				+ ", itemName=" + itemName + "]";
	}

}
