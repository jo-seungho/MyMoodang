package com.kh.admin.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.admin.member.model.vo.AdMember;
import com.kh.admin.member.model.vo.ShippingAddress;

public class MemberDao {

	private Properties prop = new Properties();

	public MemberDao() {

		String fileName = MemberDao.class.getResource("/sql/admin/member/member-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

//    ---------------------------------- 어드민 부분 -------------------------
	/*
	 * 어드민 회원관리 페이지에서 회원 리스트 불러오는 메소드 2023-04-14 최명진
	 *
	 * @param selectMemberList
	 *
	 * @return
	 */
	public ArrayList<AdMember> selectMemberListAd(Connection conn) {

		ArrayList<AdMember> list = new ArrayList<AdMember>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectMemberListAd");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				AdMember m = new AdMember();
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setPassword(rset.getString("PASSWORD"));
				m.setName(rset.getString("NAME"));
				m.setBirthDate(rset.getString("BIRTH_DATE"));
				m.setGender(rset.getString("GENDER"));
				m.setEmail(rset.getString("EMAIL"));
				m.setPhone(rset.getString("PHONE"));
				m.setEnrollDate(rset.getString("ENROLL_DATE"));
				m.setModifyDate(rset.getString("MODIFY_DATE"));
				m.setStatus(rset.getString("STATUS"));
				m.setTotalMoney(rset.getInt("TOTAL_MONEY"));
				m.setGradeNo(rset.getString("GRADE_NAME"));

				list.add(m);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	/**
	 * 어드민 상세조회에서 회원 정보 변경하는 메소드 2023-04-14 최명진
	 *
	 * @param m
	 * @return
	 */
	public int updateMemberAd(Connection conn, AdMember m) {

		int result = 0;

		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateMemberAd");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getGradeNo());
			pstmt.setString(2, m.getStatus());
			pstmt.setInt(3, m.getMemberNo());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return result;
	}

	/*
	 * 어드민 회원관리 페이지에서 회원 상세 정보 불러오는 메소드 2023-04-14 최명진
	 *
	 * @param selectMemberList
	 *
	 * @return
	 */
	public AdMember selectMemberAd(Connection conn, int id) {

		AdMember m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectMemberAd");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				m = new AdMember();
				m.setMemberNo(rset.getInt("MEMBER_NO"));
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setPassword(rset.getString("PASSWORD"));
				m.setName(rset.getString("NAME"));
				m.setBirthDate(rset.getString("BIRTH_DATE"));
				m.setGender(rset.getString("GENDER"));
				m.setEmail(rset.getString("EMAIL"));
				m.setPhone(rset.getString("PHONE"));
				m.setEnrollDate(rset.getString("ENROLL_DATE"));
				m.setModifyDate(rset.getString("MODIFY_DATE"));
				m.setStatus(rset.getString("STATUS"));
				m.setTotalMoney(rset.getInt("TOTAL_MONEY"));
				m.setGradeNo(rset.getString("GRADE_NAME"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return m;

	}


//  ---------------------------------- 회원 부분 -------------------------


	/** 가입하는 회원의 회원번호 조회용 메소드
	 * 2023-04-14 김서영
	 * @param conn
	 * @return
	 */
	public int selectMemberNo(Connection conn) {
		int memberNo = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectMemberNo");

		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				memberNo = rset.getInt("MEMBER_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rset.close();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return memberNo;
	}

	/**
	 * 아이디 중복 체크 메소드 2023/04/14 김서영
	 *
	 * @param conn
	 * @param checkEmail
	 * @return
	 */
	public int idCheck(Connection conn, String checkId) {

		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("idCheck");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, checkId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				count = rset.getInt("CNT");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return count;

	}

	/**
	 * 회원가입 (회원정보 추가) 메소드 2023-04-15 김서영
	 *
	 * @param conn
	 * @param m
	 * @return
	 */
	public int insertMember(Connection conn, AdMember m) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertMember");

		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(++i, m.getMemberNo());
			pstmt.setString(++i, m.getMemberId());
			pstmt.setString(++i, m.getPassword());
			pstmt.setString(++i, m.getName());
			pstmt.setString(++i, m.getBirthDate());
			pstmt.setString(++i, m.getGender());
			pstmt.setString(++i, m.getEmail());
			pstmt.setString(++i, m.getPhone());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	/**
	 * 회원가입용 (주소정보 추가) 메소드 2023-04-15 김서영
	 *
	 * @param conn
	 * @param addr
	 * @return
	 */
	public int insertMemberAddr(Connection conn, ShippingAddress addr) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("insertMemberAddr");

		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(++i, addr.getShipAddr());
			pstmt.setString(++i, addr.getShipAddrInfo());
			pstmt.setString(++i, addr.getPhone());
			pstmt.setString(++i, addr.getZipcode());
			pstmt.setInt(++i, addr.getMemberNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}
}
