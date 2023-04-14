package com.kh.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

import static com.kh.common.JDBCTemplate.*;

public class MemberService {

	// 어드민 회원관리 페이지에서 회원 리스트 불러오는 메소드
	// 2023-04-14 최명진
	public ArrayList<Member> selectMemberList() {
		Connection conn = getConnection();

		ArrayList<Member> list = new MemberDao().selectMemberList(conn);

		close(conn);

		return list;
	}

}
