package com.kh.shop.item.model.vo;
// 2023-04-13
// 조승호

public class Item {
	
	private int itemCode;
	private String itemCategory;	
	private String itemDate;
	private String itemName;
	private int itemStock;
	private int itemPrice;
	private int item_hits;
	private String itemText;
	private int itemDiscount;
	
	public Item() { }

	public Item(int itemCode, String itemCategory, String itemDate, String itemName, int itemStock, int itemPrice,
			int item_hits, String itemText, int itemDiscount) {
		super();
		this.itemCode = itemCode;
		this.itemCategory = itemCategory;
		this.itemDate = itemDate;
		this.itemName = itemName;
		this.itemStock = itemStock;
		this.itemPrice = itemPrice;
		this.item_hits = item_hits;
		this.itemText = itemText;
		this.itemDiscount = itemDiscount;
	}

	public int getItemCode() {
		return itemCode;
	}

	public void setItemCode(int itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemCategory() {
		return itemCategory;
	}

	public void setItemCategory(String itemCategory) {
		this.itemCategory = itemCategory;
	}

	public String getItemDate() {
		return itemDate;
	}

	public void setItemDate(String itemDate) {
		this.itemDate = itemDate;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public int getItemStock() {
		return itemStock;
	}

	public void setItemStock(int itemStock) {
		this.itemStock = itemStock;
	}

	public int getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}

	public int getItem_hits() {
		return item_hits;
	}

	public void setItem_hits(int item_hits) {
		this.item_hits = item_hits;
	}

	public String getItemText() {
		return itemText;
	}

	public void setItemText(String itemText) {
		this.itemText = itemText;
	}

	public int getItemDiscount() {
		return itemDiscount;
	}

	public void setItemDiscount(int itemDiscount) {
		this.itemDiscount = itemDiscount;
	}

	@Override
	public String toString() {
		return "Item [itemCode=" + itemCode + ", itemCategory=" + itemCategory + ", itemDate=" + itemDate
				+ ", itemName=" + itemName + ", itemStock=" + itemStock + ", itemPrice=" + itemPrice + ", item_hits="
				+ item_hits + ", itemText=" + itemText + ", itemDiscount=" + itemDiscount + "]";
	} 
	
}