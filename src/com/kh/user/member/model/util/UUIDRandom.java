// 랜덤 비밀번호 생성용 클래스
// 2023-04-23 김서영

package com.kh.user.member.model.util;

import java.util.Random;
import java.util.UUID;

public class UUIDRandom {

	public String extraPwd() {
		// UUID는 randomUUID()를 통해 생성
		// 생성 시 UUID 형태이므로 String 형태로 바꿔줘야 함!!
		String id = UUID.randomUUID().toString();
		//System.out.println("UUID : " + id);  // UUID : 942bac22-12b4-48ef-ab2f-148c63199c30

		Random r = new Random();
		RandomString rs = new RandomString(10, r); // 자리수, 랜덤 객체 순으로 삽입
		String extraPwd = rs.nextString();
		//System.out.println("Random : " + rs.nextString()); // Random : vFG8Geku4s

		return extraPwd;
	}
}
