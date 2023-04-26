package com.kh.admin.member.model.vo;

import com.kh.common.model.vo.Converter;
import com.kh.user.member.model.vo.Member;

public class AdMember extends Member {	

	private int orderCount;

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	
	
}
