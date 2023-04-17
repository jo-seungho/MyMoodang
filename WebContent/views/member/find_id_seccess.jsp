<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 찾기 성공 화면</title>
    <link rel="stylesheet" href="/resources/css/common/reset.css">
    <link rel="stylesheet" href="/resources/css/common/header.css">
    <link rel="stylesheet" href="/resources/css/common/footer.css">
    <link rel="stylesheet" href="/resources/css/member/login.css">

    <script src="/resources/js/header.js"></script>

</head>
<body>

	<%@ include file="../common/header.jsp" %>

	<div id="content">
        <div class="section_login">
            <h3 class="tit_login">아이디 찾기</h3>
            <div class="write_form find_view">

                <h3><span id="memberName">김서영</span> 님의 아이디는</h3> <br><br>

                <h3><span id="memberId">young0914</span> 입니다.</h3>


                <button type="button" class="btn_type1">
                    <span class="txt_type">로그인 페이지로 이동</span>
                </button>

            </div>
        </div>
    </div>



</body>
</html>