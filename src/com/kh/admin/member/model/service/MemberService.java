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
	 * 모든멤버 카운트 구해오는 메소드
	 * 2023-04-22 최명진
	 * @return
	 */
	public int selectAllmemberCount() {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().selectAllmemberCount(conn);
		
		close(conn);
		
		return result;
	}

	/**
	 * 사용자가 구매한 총 매출 구해오는 메소드
	 * 2023-04-22 최명진
	 * @return
	 */
	public int selectTotalMoney() {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().selectTotalMoney(conn);
		
		close(conn);
		
		return result;
	}

}
