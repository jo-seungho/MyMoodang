package com.kh.admin.common;

public enum Grade {
    왕초보당("01", "왕초보당"),
    초보당("02", "초보당"),
    중수당("03", "중수당"),
    고수당("04", "고수당");

    private String code;
    private String name;

    Grade(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public static Grade getMemberGrade(String grade) {
        for (Grade memberGrade : Grade.values()) {
            if (memberGrade.getName().equals(grade)) {
                return memberGrade;
            }
        }
        return null;
    }

    public static String getMemberGradeCode(String grade) {
    	Grade memberGrade = getMemberGrade(grade);
        if (memberGrade != null) {
            return memberGrade.getCode();
        }
        return null;
    }
}