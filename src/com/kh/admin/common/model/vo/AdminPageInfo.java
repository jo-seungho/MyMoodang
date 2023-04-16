package com.kh.admin.common.model.vo;



public class AdminPageInfo extends com.kh.common.model.vo.PageInfo {
	
	private int saleCount;
	private int soldCount;
	
	
	public int getSaleCount() {
		return saleCount;
	}
	public void setSaleCount(int saleCount) {
		this.saleCount = saleCount;
	}
	public int getSoldCount() {
		return soldCount;
	}
	public void setSoldCount(int soldCount) {
		this.soldCount = soldCount;
	}
	
	public AdminPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage, int saleCount, int soldCount) {
		super(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		this.saleCount = saleCount;
		this.soldCount = soldCount;
	}
	

	
	
	
	
}
