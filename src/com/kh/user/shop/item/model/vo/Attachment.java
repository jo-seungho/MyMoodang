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
     
     public Attachment() { }

     public Attachment(int itemImgNo, int itemImgCode, int itemImgLevel, String itemImgPath, String itemImgStatus) {
          super();
          this.itemImgNo = itemImgNo;
          this.itemImgCode = itemImgCode;
          this.itemImgLevel = itemImgLevel;
          this.itemImgPath = itemImgPath;
          this.itemImgStatus = itemImgStatus;
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

     @Override
     public String toString() {
          return "Attachment [itemImgNo=" + itemImgNo + ", itemImgCode=" + itemImgCode + ", itemImgLevel=" + itemImgLevel
                    + ", itemImgPath=" + itemImgPath + ", itemImgStatus=" + itemImgStatus + "]";
     }
     
}
	
	

  