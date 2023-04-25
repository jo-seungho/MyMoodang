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

		System.out.println("넘어가기 전 멤버" + m);

		String sql = prop.getProperty("insertMember");

		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);
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


	/**
	 * 회원탈퇴용 메소드
	 * 김서영
	 * @param conn
	 * @param m
	 * @return
	 */
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



	/**
	 * 비밀번호 찾기 회원의 정보조회용 메소드
	 * 2023-04-24 김서영
	 * @param conn
	 * @param m
	 * @return
	 */
	public int findPwdMember(Connection conn, Member m) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("findPwdMember");

		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(++i, m.getName());
			pstmt.setString(++i, m.getEmail());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}


	/**
	 * 임시비밀번호로 수정하는 메소드
	 * 2023-04-24 김서영
	 * @param conn
	 * @param extraPwd
	 * @param m
	 * @return
	 */
	public int updateExtraPwd(Connection conn, String extraPwd, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateExtraPwd");

		try {
			int i = 0;
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(++i, extraPwd);
			pstmt.setString(++i, m.getName());
			pstmt.setString(++i, m.getEmail());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}


	/**
	 * 2023.04.24 / 배송지 목록 업데이트용 메소드 / 이지환
	 * @param conn
	 * @param updateMS
	 * @return
	 */
	public int updateShippingAddress(Connection conn, ShippingAddress updateMS) {
		// System.out.println(updateMS + "1");
		// UPDATE 문 => int (처리된 행의 갯수)

		// 1. 필요한 변수 먼저 셋팅
		int result = 0;
		PreparedStatement pstmt = null;

		// 실행할 쿼리문
		String sql = prop.getProperty("updateMemberShipAddress");

		try {
			// 2. PreparedStatement 객체 생성
			pstmt = conn.prepareStatement(sql);

			// 3_1. 미완성된 쿼리문 완성시키기
			pstmt.setString(1, updateMS.getShipAddr());
			pstmt.setString(2, updateMS.getShipAddrInfo());
			pstmt.setString(3, updateMS.getPhone());
			pstmt.setString(4, updateMS.getShipName());
			pstmt.setInt(5, updateMS.getMemberNo());
			pstmt.setInt(6, updateMS.getShipNo());


			// 3_2. 쿼리문 실행 후 결과 받기
			result = pstmt.executeUpdate(); // 업데이트가 잘 됐다면 result 에 1, 아니면 0 이 담겨있을 거임
			System.out.println(result);


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			// 4. 자원 반납 (생성 순서의 역순)
			JDBCTemplate.close(pstmt);
		}

		// 5. 결과 반환
		return result;
	}


	/**
	 * 2023-04-21  shipNo 를 기준으로 그 배송지 목록만 조회하기 위한 것 / 이지환
	 * @param conn
	 * @return
	 */
	public ShippingAddress selectListByShipNo(Connection conn, int shipNo) {

		/* ShippinAddress h = new ShippingAddress(); 에서 ShippingAddress h = null; 로 변경 이지환 */
		ShippingAddress h = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectShipAddressByShipNo");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, shipNo);

			rset = pstmt.executeQuery();

		/* 2023.04.24 if문으로 조회 / 이지환 */
			if(rset.next()) {

				h = new ShippingAddress();
				h.setShipAddr(rset.getString("SHIP_ADDR"));
				h.setShipAddrInfo(rset.getString("SHIP_ADDR_INFO"));
				h.setPhone(rset.getString("PHONE"));
				h.setShipName(rset.getString("SHIP_NAME"));
				h.setMemberNo(rset.getInt("MEMBER_NO"));
				h.setShipNo(rset.getInt("SHIP_NO"));

			}


		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);

		}

		return h;


	}
}

