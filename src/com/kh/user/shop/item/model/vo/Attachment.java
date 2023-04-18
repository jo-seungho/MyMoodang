package com.kh.user.shop.item.model.vo;

public class Attachment {
	/**
     * 상품 이미지 정보 VO
     * 2023-04-16 이태화
     */
    
//	ITEM_IMG_NO	NUMBER
//	ITEM_IMG_CODE	NUMBER
//	ITEM_IMG_LEVEL	NUMBER
//	ITEM_IMG_PATH	VARCHAR2(1000 BYTE)
//	ITEM_IMG_STATUS	VARCHAR2(1 BYTE)


     private int itemImgNo;
     private int itemImgCode;
     private int itemImgLevel;
     private String itemImgPath;
     private String itemImgStatus;
     private String itemName; // 사용자용 상세페이지에서 관련 제품들의 이름을 가져오기 위해 필드생성
     private int itemPrice;  // 사용자용 상세페이지에서 관련 제품들의 정상가격을 가져오기 위해 필드생성
     private int discountPrice; // 사용자용 상세페이지에서 관련 제품들의 할인가격을 가져오기 위해 필드생성 
     
     public Attachment() { }

	public Attachment(int itemImgNo, int itemImgCode, int itemImgLevel, String itemImgPath, String itemImgStatus,
			String itemName, int itemPrice, int discountPrice) {
		super();
		this.itemImgNo = itemImgNo;
		this.itemImgCode = itemImgCode;
		this.itemImgLevel = itemImgLevel;
		this.itemImgPath = itemImgPath;
		this.itemImgStatus = itemImgStatus;
		this.itemName = itemName;
		this.itemPrice = itemPrice;
		this.discountPrice = discountPrice;
	}

	public int getItemImgNo() {
		return itemImgNo;
	}

	public void setItemImgNo(int itemImgNo) {
		this.itemImgNo = itemImgNo;
	}

	public int getItemImgCode() {
		return itemImgCode;
	}

	public void setItemImgCode(int itemImgCode) {
		this.itemImgCode = itemImgCode;
	}

	public int getItemImgLevel() {
		return itemImgLevel;
	}

	public void setItemImgLevel(int itemImgLevel) {
		this.itemImgLevel = itemImgLevel;
	}

	public String getItemImgPath() {
		return itemImgPath;
	}

	public void setItemImgPath(String itemImgPath) {
		this.itemImgPath = itemImgPath;
	}

	public String getItemImgStatus() {
		return itemImgStatus;
	}

	public void setItemImgStatus(String itemImgStatus) {
		this.itemImgStatus = itemImgStatus;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	@Override
	public String toString() {
		return "Attachment [itemImgNo=" + itemImgNo + ", itemImgCode=" + itemImgCode + ", itemImgLevel=" + itemImgLevel
				+ ", itemImgPath=" + itemImgPath + ", itemImgStatus=" + itemImgStatus + ", itemName=" + itemName
				+ ", itemPrice=" + itemPrice + ", discountPrice=" + discountPrice + "]";
	}
	

}


	