package com.kh.user.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.user.member.model.vo.Member;
import com.kh.user.member.model.vo.ShippingAddress;

public class MemberDao {

	private Properties prop = new Properties();

	public MemberDao() {

		String fileName = MemberDao.class.getResource("/sql/user/member/member-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}


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
	 * 아이디 중복 체크 메소드
	 * 2023/04/14 김서영
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
	 * 회원가입 (회원정보 추가) 메소드
	 *  2023-04-15 김서영
	 *
	 * @param conn
	 * @param m
	 * @return
	 */
	public int insertMember(Connection conn, Member m) {

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
	 * 회원가입용 (주소정보 추가) 메소드
	 * 2023-04-15 김서영
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


	/**
	 * 아이디 찾기 메소드
	 * 2023-04-17 김서영
	 * @param conn
	 * @param m
	 * @return
	 */
	public Member findId(Connection conn, Member m) {

		Member fi = new Member();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("findId");

		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(++i, m.getName());
			pstmt.setString(++i, m.getPhone());

			rset = pstmt.executeQuery();

			while(rset.next()) {
				fi.setName(rset.getString("NAME"));
				fi.setMemberId(rset.getString("MEMBER_ID"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return fi;
	}


	/**
	 * 회원정보 수정 시 정보 조회용 메소드
	 * 2023-04-17 김서영
	 * @param conn
	 * @param memberId
	 * @return
	 */
	public Member selectMemberInfo(Connection conn, String memberId) {

		Member m = new Member();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectMemberInfo");

		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(++i, memberId);

			rset = pstmt.executeQuery();

			while(rset.next()) {
				m.setMemberId(rset.getString("MEMBER_ID"));
				m.setEmail(rset.getString("EMAIL"));
				m.setName(rset.getString("NAME"));
				m.setGender(rset.getString("GENDER"));
				m.setBirthDate(rset.getString("BIRTH_DATE"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return m;
	}
}
