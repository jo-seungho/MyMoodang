package com.kh.user.member.model.util;

public class EmailAuth {

	/**
	 * 회원가입용 인증번호 숫자 6자리 생성 메소드
	 * 2023-04-23 김서영
	 * @return
	 */
	public int authNo() {

		int authNo = (int)(Math.floor(Math.random() * (999999 - 100000 + 1)) + 100000);

		System.out.println(authNo);

		return authNo;
	}

}
