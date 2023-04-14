package com.kh.admin.common;

public enum Gender {
    남자("M"),
    여자("F"),
    해당없음("X");

    private String code;

    Gender(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public static Gender getGender(String gender) {
        for (Gender g : Gender.values()) {
            if (g.name().equalsIgnoreCase(gender)) {
                return g;
            }
        }
        return 해당없음;
    }

    public static String getGenderCode(String gender) {
        Gender g = getGender(gender);
        return g.getCode();
    }
}


