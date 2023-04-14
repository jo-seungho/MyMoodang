package com.kh.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

import static com.kh.common.JDBCTemplate.*;

public class MemberService {

	/**
	 * 이메일 중복 체크 메소드
	 * 2023-04-14 김서영
	 * @param checkEmail
	 * @return
	 */
	public int emailCheck(String checkEmail) {
		Connection conn = getConnection();

		int count = new MemberDao().emailCheck(conn, checkEmail);

		JDBCTemplate.close(conn);

		return count;
	}
  
	 * 어드민 회원관리 페이지에서 회원 리스트 불러오는 메소드
	 * 2023-04-14 최명진
	 * @param selectMemberList
	 * @return
	 */
	public ArrayList<Member> selectMemberList() {
		Connection conn = getConnection();

		ArrayList<Member> list = new MemberDao().selectMemberList(conn);

		close(conn);

		return list;
	}

  /**
	 * 어드민 회원관리 페이지에서 회원 상세정보 불러오는 메소드
	 * 2023-04-14 최명진
	 * @param selectMember
	 * @return
	 */
	public Member selectMember(int id) {
		Connection conn = getConnection();

		Member m = new MemberDao().selectMember(conn, id);

		close(conn);

		return m;
	}

}
