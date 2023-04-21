<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.user.member.model.vo.MemberFindId" %>

<% MemberFindId findId = (MemberFindId)session.getAttribute("findId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 성공 화면</title>

    <!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

    <link rel="stylesheet" href="/resources/css/member/login.css">

</head>
<body>

	<%@ include file="../common/header.jsp" %>

	<div id="content">
        <div class="section_login">
            <h3 class="tit_login">아이디 찾기</h3>
            <div class="write_form find_view">

                <h3><span id="memberName" style="color: darkgreen; font-size: 18px; font-weight: 800;"><%= findId.getMemberName() %></span> 님의 아이디는</h3> <br><br>

                <h3><span id="memberId" style="color: darkgreen; font-size: 18px; font-weight: 800;"><%= findId.getMemberId() %></span> 입니다.</h3>


                <button type="button" class="btn_type1" >
                    <a class="txt_type" href="/loginForm.me">로그인 페이지로 이동</a>
                </button>
            </div>
        </div>
    </div>


</body>
</html>