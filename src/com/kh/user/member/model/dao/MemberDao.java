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

	/**
	 * 가입하는 회원의 회원번호 조회용 메소드 2023-04-14 김서영
	 *
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

	/**
	 * 아이디 찾기 메소드 2023-04-17 김서영
	 *
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

			while (rset.next()) {
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
	 * 회원정보 수정 시 정보 조회용 메소드 2023-04-17 김서영
	 *
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

			while (rset.next()) {
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
				m.setGradeNo(rset.getString("GRADE_NO"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return m;
	}

	/**
	 * 2023-04-18 로그인 기능 이지환
	 * @param conn
	 * @param m
	 * @return
	 */
	/**
	 * 2023-04-23 조승호
	 * 수정 : 장바구니 수량조회 추가
	 * @param conn
	 * @param m
	 * @return
	 */
	
	public Member loginUser(Connection conn, Member m) {

			// 로그인 하려면 어떤 게 필요할까 고민하자.
			// => SELECT문이 필요함 => ResultSet 객체 (unique 제약조건 때문에 단일행 조회) => Member 가공

			// 1. 필요한 변수 먼저 셋팅
			Member loginUser = null;

			PreparedStatement pstmt = null;
			ResultSet rset = null;


			// 실행할 쿼리문까지 변수로 담음
			String sql = prop.getProperty("loginUser");

			 try {
			        pstmt = conn.prepareStatement(sql);
			        pstmt.setString(1, m.getMemberId());
			        pstmt.setString(2, m.getMemberId());
			        pstmt.setString(3, m.getPassword());

			        rset = pstmt.executeQuery();


			   if (rset.next()) {
						loginUser = new Member(rset.getInt("CART_COUNT")
									 , rset.getInt("MEMBER_NO")
									 , rset.getString("MEMBER_ID")
									 , rset.getString("PASSWORD")
									 , rset.getString("NAME")
									 , rset.getString("BIRTH_DATE")
									 , rset.getString("GENDER")
									 , rset.getString("EMAIL")
									 , rset.getString("PHONE")
									 , rset.getString("ENROLL_DATE")
									 , rset.getString("MODIFY_DATE")
									 , rset.getString("STATUS")
									 , rset.getInt("TOTAL_MONEY")
									 , rset.getString("GRADE_NO"));
					}
			   	
			    } catch (SQLException e) {
			        e.printStackTrace();
			    } finally {
			        JDBCTemplate.close(rset);
			        JDBCTemplate.close(pstmt);
			    }
			    return loginUser;

		}

	/**
	 * 2023.04.19 / 내 배송지 관리 중 내 배송지 목록 조회 / 이지환
	 * @param conn
	 * @param memberNo
	 * @return
	 */
	public ArrayList<ShippingAddress> selectShippingAddressList(Connection conn, int memberNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ShippingAddress> shippingAddressList = new ArrayList<>();

		String sql = prop.getProperty("selectShippingAddressList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
                ShippingAddress shippingAddress = new ShippingAddress();
                shippingAddress.setShipNo(rset.getInt("SHIP_NO"));
                shippingAddress.setShipAddr(rset.getString("SHIP_ADDR"));
                shippingAddress.setShipAddrInfo(rset.getString("SHIP_ADDR_INFO"));
                shippingAddress.setPhone(rset.getString("PHONE"));
                shippingAddress.setShipName(rset.getString("SHIP_NAME"));
                shippingAddress.setMemberNo(rset.getInt("MEMBER_NO"));
                shippingAddress.setZipcode(rset.getString("ZIPCODE"));
                shippingAddressList.add(shippingAddress);
            }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return shippingAddressList;
	}

	/**
	 * 회원 정보 수정(기본정보 수정) 용 메소드
	 * 2023-04-20 김서영
	 * @param conn
	 * @param m
	 * @return
	 */
	public int updateInfoMember(Connection conn, Member m) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateInfoMember");

		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(++i, m.getName());
			pstmt.setString(++i, m.getBirthDate());
			pstmt.setString(++i, m.getGender());
			pstmt.setString(++i, m.getEmail());
			pstmt.setString(++i, m.getPhone());
			pstmt.setString(++i, m.getMemberId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	/**
	 * 회원 비밀번호 수정 용 메소드
	 * 2023-04-20 김서영
	 * @param conn
	 * @param m
	 * @param upPwd
	 * @return
	 */
	public boolean updatePwdMember(Connection conn, Member m, String upPwd) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updatePwdMember");

		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(++i, upPwd);
			pstmt.setString(++i, m.getMemberId());
			pstmt.setString(++i, m.getPassword());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return (result > 0);
	}


	public int deleteMember(Connection conn, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteMember");

		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(++i, m.getMemberId());
			pstmt.setString(++i, m.getPassword());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

//		System.out.println("dao : " + result);
		return result;
	}
}
