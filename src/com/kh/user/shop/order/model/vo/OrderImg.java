// 주문목록 이미지 삽입용 VO
// 2023-04-24 김서영

package com.kh.user.shop.order.model.vo;

public class OrderImg {

	private int maxPrice;
	private String itemImgPath;

	public OrderImg() {	}

	public OrderImg(int maxPrice, String itemImgPath) {
		super();
		this.maxPrice = maxPrice;
		this.itemImgPath = itemImgPath;
	}

	public int getMaxPrice() {
		return maxPrice;
	}

	public void setMaxPrice(int maxPrice) {
		this.maxPrice = maxPrice;
	}

	public String getItemImgPath() {
		return itemImgPath;
	}

	public void setItemImgPath(String itemImgPath) {
		this.itemImgPath = itemImgPath;
	}

	@Override
	public String toString() {
		return "OrderImg [maxPrice=" + maxPrice + ", itemImgPath=" + itemImgPath + "]";
	}






}
