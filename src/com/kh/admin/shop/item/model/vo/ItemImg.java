package com.kh.admin.shop.item.model.vo;

public class ItemImg {
	
	private int itemImgNo;
	private int itemImgLevel;
	private String itemImgPath;
	private String itemImgStatus;
	private int itemImgCode;
	
	public ItemImg() {}
	
	public ItemImg(int itemImgNo, int itemImgLevel, String itemImgPath, String itemImgStatus, int itemImgCode) {
		super();
		this.itemImgNo = itemImgNo;
		this.itemImgLevel = itemImgLevel;
		this.itemImgPath = itemImgPath;
		this.itemImgStatus = itemImgStatus;
		this.itemImgCode = itemImgCode;
	}
	
	public int getItemImgNo() {
		return itemImgNo;
	}
	public void setItemImgNo(int itemImgNo) {
		this.itemImgNo = itemImgNo;
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
	public int getItemImgCode() {
		return itemImgCode;
	}
	public void setItemImgCode(int itemImgCode) {
		this.itemImgCode = itemImgCode;
	}

	@Override
	public String toString() {
		return "ItemImg [itemImgNo=" + itemImgNo + ", itemImgLevel=" + itemImgLevel + ", itemImgPath=" + itemImgPath
				+ ", itemImgStatus=" + itemImgStatus + ", itemImgCode=" + itemImgCode + "]";
	}
	
	

}
