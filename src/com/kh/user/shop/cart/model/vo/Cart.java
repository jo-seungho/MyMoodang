package com.kh.user.shop.cart.model.vo;
// 2023-04-19 조승호

public class Cart {
	
	private int cartNo;					//	장바구니 번호
	private int cartStock;				//	상품 한개의 수량
	private int price;					//	상품 하나 가격
	private int discountPrice;			//  할인된 상품 하나의 가격
	private int totalPrice;	 			//  상품 전체 가격
	private int totalDiscountPrice;		//  할인된 전체 상품 가격
	private int difference;				//  총 가격과 할인된 총액의 차이
	private int memberNo;				//	회원번호
	private int itemCode;				//	상품코드
	private String itemName;			//  상품 이름
	private String imgPath;				//  상품 이미지
	
	public Cart() { }
	
	

	public Cart(int cartNo, int cartStock, int price, int discountPrice, int totalPrice, int totalDiscountPrice,
			int difference, int memberNo, String itemName, String imgPath, int itemCode) {
		super();
		this.cartNo = cartNo;
		this.cartStock = cartStock;
		this.price = price;
		this.discountPrice = discountPrice;
		this.totalPrice = totalPrice;
		this.totalDiscountPrice = totalDiscountPrice;
		this.difference = difference;
		this.memberNo = memberNo;
		this.itemName = itemName;
		this.imgPath = imgPath;
		this.itemCode = itemCode;
	}


	public Cart(int cartNo, int cartStock, int price, int discountPrice, int totalPrice, int totalDiscountPrice,
			int difference, int memberNo, int itemCode, String itemName, String imgPath) {
		super();
		this.cartNo = cartNo;
		this.cartStock = cartStock;
		this.price = price;
		this.discountPrice = discountPrice;
		this.totalPrice = totalPrice;
		this.totalDiscountPrice = totalDiscountPrice;
		this.difference = difference;
		this.memberNo = memberNo;
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.imgPath = imgPath;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getCartStock() {
		return cartStock;
	}

	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getTotalDiscountPrice() {
		return totalDiscountPrice;
	}

	public void setTotalDiscountPrice(int totalDiscountPrice) {
		this.totalDiscountPrice = totalDiscountPrice;
	}

	public int getDifference() {
		return difference;
	}

	public void setDifference(int difference) {
		this.difference = difference;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getItemCode() {
		return itemCode;
	}

	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public String getImgPath() {
		return imgPath;
	}



	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}


	@Override
	public String toString() {
		return "Cart [cartNo=" + cartNo + ", cartStock=" + cartStock + ", price=" + price + ", discountPrice="
				+ discountPrice + ", totalPrice=" + totalPrice + ", totalDiscountPrice=" + totalDiscountPrice
				+ ", difference=" + difference + ", memberNo=" + memberNo + ", itemCode=" + itemCode + ", itemName="
				+ itemName + ", imgPath=" + imgPath + "]";
	}

	
}
