package com.kh.admin.common;

public  class MemberCommon {

	
	public static String gender(String gender) {
		if(gender.equals("남자")) {
			return "M";
		} else {
			return "F";
		}
	}
	
	public static String status(String status) {
		if(status.equals("활동")) {
			return "Y";
		} else {
			return "N";
		}
	}
}
