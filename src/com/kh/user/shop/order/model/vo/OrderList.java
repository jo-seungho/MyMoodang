// 주문목록 조회용 VO
// 2023-04-24 김서영
// 2023-04-25 조승호 수정 (상품 이미지 추가)

package com.kh.user.shop.order.model.vo;

public class OrderList {

	private int orderNo;     // 주문번호
	private String orderStatus;  // 배송상태
	private String orderDate;  // 주문날짜
	private String itemList; // 아이템 리스트
	private int totalPrice;  // 총 금액
	private String itemImg;	 // 상품 이미지


	public OrderList () {}


	public OrderList(int orderNo, String orderStatus, String orderDate, String itemList, int totalPrice, String itemImg) {
		super();
		this.orderNo = orderNo;
		this.orderStatus = orderStatus;
		this.orderDate = orderDate;
		this.itemList = itemList;
		this.totalPrice = totalPrice;
		this.itemImg = itemImg;
	}


	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}


	public String getOrderStatus() {
		return orderStatus;
	}


	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}


	public String getOrderDate() {
		return orderDate;
	}


	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}


	public String getItemList() {
		return itemList;
	}


	public void setItemList(String itemList) {
		this.itemList = itemList;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public String getItemImg() {
		return itemImg;
	}


	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}


	@Override
	public String toString() {
		return "OrderList [orderNo=" + orderNo + ", orderStatus=" + orderStatus + ", orderDate=" + orderDate
				+ ", itemList=" + itemList + ", totalPrice=" + totalPrice + ", itemImg=" + itemImg + "]";
	}

}
