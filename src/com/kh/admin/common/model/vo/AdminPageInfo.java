package com.kh.admin.common.model.vo;



public class AdminPageInfo extends com.kh.common.model.vo.PageInfo {
	
	private int saleCount;
	private int soldCount;
	private int totalCount;
	private int completeCount;
	
	
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
	

	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	public int getCompleteCount() {
		return completeCount;
	}
	public void setCompleteCount(int completeCount) {
		this.completeCount = completeCount;
	}
	public AdminPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage, int totalCount, int saleCount, int soldCount, int completeCount) {
		super(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		this.totalCount = totalCount;
		this.saleCount = saleCount;
		this.soldCount = soldCount;
		this.completeCount = completeCount;
	}
	
	public AdminPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	}
	
	public AdminPageInfo (int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
	int endPage, int totalCount, int saleCount, int soldCount) {
		super(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		this.totalCount = totalCount;
		this.saleCount = saleCount;
		this.soldCount = soldCount;
	}
	

	
	
	
	
}
