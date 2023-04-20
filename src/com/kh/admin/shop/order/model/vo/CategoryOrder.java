package com.kh.admin.shop.order.model.vo;

import java.util.ArrayList;

import com.kh.admin.common.model.vo.AdminPageInfo;

public class CategoryOrder {


	  private AdminPageInfo pi;
	  private ArrayList<Order> files;
	  
	  
	  
	public CategoryOrder(AdminPageInfo pi, ArrayList<Order> files) {
		this.pi = pi;
		this.files = files;
	}
	
	
	public AdminPageInfo getPi() {
		return pi;
	}
	public void setPi(AdminPageInfo pi) {
		this.pi = pi;
	}
	public ArrayList<Order> getFiles() {
		return files;
	}
	public void setFiles(ArrayList<Order> files) {
		this.files = files;
	}

	  
	  
}
