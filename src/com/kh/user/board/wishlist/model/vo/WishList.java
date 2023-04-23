package com.kh.user.board.wishlist.model.vo;

public class WishList {
	
	private int itemCode;
	private String itemName;
	private int discountPrice;
	private int itemPrice;
	private double itemDiscount;
	private String itemImgPath;
	
	
	public WishList() {}
	
	
	public WishList(int itemCode, String itemName, int discountPrice, int itemPrice, double itemDiscount,
			String itemImgPath) {
		super();
		this.itemCode = itemCode;
		this.itemName = itemName;
		this.discountPrice = discountPrice;
		this.itemPrice = itemPrice;
		this.itemDiscount = itemDiscount;
		this.itemImgPath = itemImgPath;
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
	public int getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public double getItemDiscount() {
		return itemDiscount;
	}
	public void setItemDiscount(double itemDiscount) {
		this.itemDiscount = itemDiscount;
	}
	public String getItemImgPath() {
		return itemImgPath;
	}
	public void setItemImgPath(String itemImgPath) {
		this.itemImgPath = itemImgPath;
	}


	@Override
	public String toString() {
		return "WishList [itemCode=" + itemCode + ", itemName=" + itemName + ", discountPrice=" + discountPrice
				+ ", itemPrice=" + itemPrice + ", itemDiscount=" + itemDiscount + ", itemImgPath=" + itemImgPath + "]";
	}
	
	
	
	
	
}
