package com.kh.admin.shop.item.model.vo;

public class ItemImg {
	
	private int itemImgNo;
	private int itemImgLevel;
	private String itemImgPath;
	private String itemImgStatus;
	private int itemImgCode;
	private String itemImg;
	
	public ItemImg() {
		// TODO Auto-generated constructor stub
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
	public String getItemImg() {
		return itemImg;
	}
	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}
	
	
	
	
	public ItemImg(int itemImgNo, int itemImgLevel, String itemImgPath, String itemImgStatus, int itemImgCode,
			String itemImg) {
		super();
		this.itemImgNo = itemImgNo;
		this.itemImgLevel = itemImgLevel;
		this.itemImgPath = itemImgPath;
		this.itemImgStatus = itemImgStatus;
		this.itemImgCode = itemImgCode;
		this.itemImg = itemImg;
	}
	
	
	@Override
	public String toString() {
		return "ItemImg [itemImgNo=" + itemImgNo + ", itemImgLevel=" + itemImgLevel + ", itemImgPath=" + itemImgPath
				+ ", itemImgStatus=" + itemImgStatus + ", itemImgCode=" + itemImgCode + ", itemImg=" + itemImg + "]";
	}
	
	
	
}