package com.kh.admin.common;

public enum Status {
    활성("Y"),
    비활성("N");

    private String code;

    Status(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public static Status getStatus(String status) {
        for (Status s : Status.values()) {
            if (s.name().equalsIgnoreCase(status)) {
                return s;
            }
        }
        return 비활성;
    }

    public static String getStatusCode(String status) {
        Status s = getStatus(status);
        return s.getCode();
    }
}