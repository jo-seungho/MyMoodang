package com.kh.admin.common;

import java.util.HashMap;
import java.util.Map;

public class Converter {
    private static final Map<String, String> CHANGE_MAP = new HashMap<>();

    static {
    	CHANGE_MAP.put("M", "남자");
    	CHANGE_MAP.put("F", "여자");
    	CHANGE_MAP.put("X", "해당없음");
        
    	CHANGE_MAP.put("남자", "M");
    	CHANGE_MAP.put("여자", "F");
    	CHANGE_MAP.put("해당없음", "X");
    	
    	CHANGE_MAP.put("01", "왕초보당");
    	CHANGE_MAP.put("02", "초보당");
    	CHANGE_MAP.put("03", "중수당");
        CHANGE_MAP.put("04", "고수당");
        
        CHANGE_MAP.put("왕초보당","01");
        CHANGE_MAP.put("초보당", "02");
        CHANGE_MAP.put("중수당", "03");
        CHANGE_MAP.put("고수당", "04");

        CHANGE_MAP.put("활성", "Y");
        CHANGE_MAP.put("비활성", "N");
        
        CHANGE_MAP.put("Y", "활성");
        CHANGE_MAP.put("N", "비활성");
        
    }

    public static String convert(String change) {
        return CHANGE_MAP.getOrDefault(change, "알수없음");
    }
}