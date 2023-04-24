package com.kh.admin.shop.order.model.vo;

public class Order {

	private int orderNo; //주문번호
	private String memberId; //회원 아이디
	private int paymentAmount; //주문 총 가격
	private String orderDate; //주문 날짜
	private String shipAddr; //배송지
	private String orderStatus; // 배송 상태
	
	private String itemList; //아이템 리스트 (닭가슴살샐러드, 제로슈거사이다 ...)
	private String request; //요청사항
	private String phone; //전화번호
//	private String trackNo; // 운송장번호
//	private String paymentNo; //결제번혼데 String으로 되어있어 ..
	private String imagePath; // 주문상품 썸네일 이미지
	
	public Order() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public Order(int orderNo, String memberId, int paymentAmount, String orderDate, String shipAddr, String orderStatus,
		String itemList, String request, String phone) {
	super();
	this.orderNo = orderNo;
	this.memberId = memberId;
	this.paymentAmount = paymentAmount;
	this.orderDate = orderDate;
	this.shipAddr = shipAddr;
	this.orderStatus = orderStatus;
	this.itemList = itemList;
	this.request = request;
	this.phone = phone;
}






	public Order(int orderNo, String memberId, int paymentAmount, String orderDate, String shipAddr,
			String orderStatus) {
		super();
		this.orderNo = orderNo;
		this.memberId = memberId;
		this.paymentAmount = paymentAmount;
		this.orderDate = orderDate;
		this.shipAddr = shipAddr;
		this.orderStatus = orderStatus;
	}




	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getPaymentAmount() {
		return paymentAmount;
	}
	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getShipAddr() {
		return shipAddr;
	}
	public void setShipAddr(String shipAddr) {
		this.shipAddr = shipAddr;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getItemList() {
		return itemList;
	}
	public void setItemList(String itemList) {
		this.itemList = itemList;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}




	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", memberId=" + memberId + ", paymentAmount=" + paymentAmount
				+ ", orderDate=" + orderDate + ", shipAddr=" + shipAddr + ", orderStatus=" + orderStatus + ", itemList="
				+ itemList + ", request=" + request + ", phone=" + phone + "]";
	}




	public String getImagePath() {
		return imagePath;
	}




	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
	

	
	

}
