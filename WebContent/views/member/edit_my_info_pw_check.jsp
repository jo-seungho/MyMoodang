<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내정보수정_비밀번호확인</title>

    <link rel="stylesheet" href="/resources/css/common/reset.css" />
    <link rel="stylesheet" href="/resources/css/common/header.css" />
    <link rel="stylesheet" href="/resources/css/common/footer.css" />
    <link rel="stylesheet" href="/resources/css/member/edit_my_info_pw_check.css" />

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/resources/js/common/header.js"></script>
    <script src="/resources/js/member/edit_my_info_pw.js"></script>

</head>
<body>
<!-- jsp 변환 / 2023-04-14 / 김서영 -->
    <!-- 헤더 시작 -->
    <%@ include file="../common/header.jsp" %>
    <!-- 헤더 끝 -->

    <%
    	String memberId = loginUser.getMemberId();
    %>


    <!-- 사이드 메뉴바 시작 -->
    <div id="container">
        <div id="main">
            <div id="content">
                <div class="page_aticle aticle_type2">
                    <div id="mypage_side" class="snb_my" style="position: absolute;">
                        <h2 class="tit_snb">마이페이지</h2>
                        <div class="inner_sub">
                            <ul class="list_menu">
                                <li>
                                    <a href="../main/order_list.html">주문내역</a>
                                </li>
                                <li>
                                    <a href="#">찜한 상품</a>
                                </li>
                                <li>
                                    <a href="../main/delivery_list.html">배송지 관리</a>
                                </li>
                                <li>
                                    <a href="#">리뷰 관리</a>
                                </li>
                                <li>
                                    <a href="#">쿠폰</a>
                                </li>
                                <li class="on">
                                    <a href="/updateCheckPwd.me">내 정보 수정</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <form id="viewOrderList" class="page_section section_orderlist" action="updateForm.me" method="post">

                        <!-- 내 정보 수정 - 비밀번호 확인 영역 시작 -->
                        <div id="pwdCheck-section" style="margin-top: 50px;">
                          <h1 style="font-weight: 700;">내 정보 수정</h1>
                          <br><hr><br>
                          <h2 style="font-weight: 700;">비밀번호 재확인</h2> <br>
                          <p>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해 주세요.</p>
                          <br><hr><br>

                          <div class="pwd_check_input" align="center">
                            <table style="padding: 30px;">
                                <tr>
                                    <th style="font-weight: 800;">아이디(이메일)</th>
                                    <td><input type="text" id="memberId" name="memberId" class="form-control" value="<%= memberId %>" readonly></td>
                                </tr>
                                <tr>
                                    <th style="font-weight: 800;">비밀번호 확인</th>
                                    <td>
                                        <input type="password" id="pwdCheck" name="pwdCheck" class="form-control" placeholder="비밀번호">
                                    </td>
                                </tr>
                                    <td colspan="2" align="center">
                                    	<button type="submit" id="pwd_check_sub" onclick="validate();">확인</button>
                                    </td>
                                </tr>
                            </table>
                          </div>
                        </div>
                    </form>
                        <!-- 내 정보 수정 - 비밀번호 확인 영역 끝 -->
                </div>
            </div>
        </div>
    </div>



</body>
</html>