package com.kh.user.member.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.user.member.model.dao.MemberDao;
import com.kh.user.member.model.vo.Member;
import com.kh.user.member.model.vo.ShippingAddress;

public class MemberService {


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
	 * 회원가입 시 회원정보, 주소를 입력하는 메소드 2023-04-16 김서영
	 *
	 * @param m
	 * @param addr
	 * @return
	 * @throws SQLException
	 */
	public int insertMember(Member m, ShippingAddress addr) {

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

	/* 로그인한 회원 본인 2023.04.17 이지환 */

	public ArrayList<ShippingAddress> selectShippingAddressList(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();

		ArrayList<ShippingAddress> list = new MemberDao().selectShippingAddressList(conn, memberNo);

		close(conn);

		return list;
	}

	/**
	 * 아이디 찾기 메소드 2023-04-17 김서영
	 *
	 * @param m
	 * @return
	 */
	public Member findId(Member m) {

		Connection conn = getConnection();

		Member fi = new MemberDao().findId(conn, m);

		close(conn);

		return fi;
	}

	/**
	 * 회원정보 수정 조회용 메소드 2023-04-17 김서영
	 *
	 * @param memberId
	 * @return
	 */
	public Member selectMemberInfo(String memberId) {

		Connection conn = getConnection();

		Member m = new MemberDao().selectMemberInfo(conn, memberId);

		close(conn);

		return m;
	}

	/**
	 * 로그인 기능 2023-04-18 이지환
	 * 로그인 요청 기능
	 * @param m
	 * @return
	 */
	public Member loginUser(Member m) {


		Connection conn = JDBCTemplate.getConnection();

		Member loginUser =  new MemberDao().loginUser(conn, m);

		close(conn);


		return loginUser;
	}
}
