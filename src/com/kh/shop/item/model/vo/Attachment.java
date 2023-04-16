package com.kh.shop.item.model.vo;

public class Attachment {
	/**
     * 상품 이미지 정보 VO
     * 2023-04-16 이태화
     */
    
//	ITEM_IMG_CODE	NUMBER
//	ITEM_IMG_T_F	VARCHAR2(1 BYTE)
//	ITEM_IMAGE	VARCHAR2(300 BYTE)
//	ITEM_IMG_DELETE_T_F	VARCHAR2(1 BYTE)

    private int itemImgCode;
    private String itemImgTF;
    private String itemImage;
    private String itemImgDeleteTF;
    
    public Attachment() {
        super();
    }

    public Attachment(int itemImgCode, String itemImgTF, String itemImage, String itemImgDeleteTF) {
        super();
        this.itemImgCode = itemImgCode;
        this.itemImgTF = itemImgTF;
        this.itemImage = itemImage;
        this.itemImgDeleteTF = itemImgDeleteTF;
    }

    public int getItemImgCode() {
        return itemImgCode;
    }

    public void setItemImgCode(int itemImgCode) {
        this.itemImgCode = itemImgCode;
    }

    public String getItemImgTF() {
        return itemImgTF;
    }

    public void setItemImgTF(String itemImgTF) {
        this.itemImgTF = itemImgTF;
    }

    public String getItemImage() {
        return itemImage;
    }

    public void setItemImage(String itemImage) {
        this.itemImage = itemImage;
    }

    public String getItemImgDeleteTF() {
        return itemImgDeleteTF;
    }

    public void setItemImgDeleteTF(String itemImgDeleteTF) {
        this.itemImgDeleteTF = itemImgDeleteTF;
    }

    @Override
    public String toString() {
        return "Attachment [itemImgCode=" + itemImgCode + ", itemImgTF=" + itemImgTF + ", itemImage=" + itemImage
                + ", itemImgDeleteTF=" + itemImgDeleteTF + "]";
    }

}
