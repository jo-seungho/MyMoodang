package com.kh.admin.shop.order.model.vo;

public class Order {

	private int orderNo;
	private String memberId;
	private int paymentAmount;
	private String orderDate;
	private String shipAddr;
	private String orderStatus;

	public Order() {
		// TODO Auto-generated constructor stub
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

	@Override
	public String toString() {
		return "Orders [orderNo=" + orderNo + ", memberId=" + memberId + ", paymentAmount=" + paymentAmount
				+ ", orderDate=" + orderDate + ", shipAddr=" + shipAddr + ", orderStatus=" + orderStatus + "]";
	}
	
	

}
