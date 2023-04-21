package com.kh.admin.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.admin.member.model.dao.MemberDao;
import com.kh.admin.member.model.vo.AdMember;
import com.kh.admin.member.model.vo.ShippingAddress;

public class MemberService {

	/*
	 * 어드민 회원관리 페이지에서 회원 리스트 불러오는 메소드 2023-04-14 최명진
	 *
	 * @param selectMemberList
	 *
	 * @return
	 */

	public ArrayList<AdMember> selectMemberListAd() {
		Connection conn = getConnection();

		ArrayList<AdMember> list = new MemberDao().selectMemberListAd(conn);

		close(conn);

		return list;
	}

	/**
	 * 어드민 회원관리 페이지에서 회원 상세정보 불러오는 메소드 2023-04-14 최명진
	 *
	 * @param selectMember
	 * @return
	 */
	public AdMember selectMemberAd(int id) {
		Connection conn = getConnection();

		AdMember m = new MemberDao().selectMemberAd(conn, id);

		close(conn);

		return m;
	}

	/**
	 * 아이디 중복 체크 메소드 2023-04-14 김서영
	 *
	 * @param checkId
	 * @return
	 */
	public int idCheck(String checkId) {
		Connection conn = getConnection();

		int count = new MemberDao().idCheck(conn, checkId);

		JDBCTemplate.close(conn);

		return count;
	}

	/**
	 * 어드민이 회원 상세정보 수정 2023-04-14 최명진
	 *
	 * @param m
	 * @return
	 */
	public int updateMemberAd(AdMember m) {
		Connection conn = getConnection();

		int result = new MemberDao().updateMemberAd(conn, m);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	/**
	 * 회원가입 시 회원정보, 주소를 입력하는 메소드
	 *
	 * @param m
	 * @param addr
	 * @return
	 * @throws SQLException
	 */
	public int insertMember(AdMember m, ShippingAddress addr) {

		Connection conn = getConnection();

		try {
			conn.setAutoCommit(false);
		} catch (SQLException e) {
		}

		int memberNo = new MemberDao().selectMemberNo(conn);
		m.setMemberNo(memberNo);

		int result1 = new MemberDao().insertMember(conn, m);

		addr.setMemberNo(memberNo);
		addr.setPhone(m.getPhone());

		int result2 = 0;

		if (result1 > 0) { // 회원정보 추가가 된 상황
			// 주소도 등록해야 함 (멤버 번호 받아야 하므로 => 핸드폰 번호가 똑같은 멤버의 번호 가져오기)
			result2 = new MemberDao().insertMemberAddr(conn, addr);
		}

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1 * result2;

	}

}
