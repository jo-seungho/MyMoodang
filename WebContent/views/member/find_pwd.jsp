<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>

    <!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

    <link rel="stylesheet" href="/resources/css/member/login.css">
    <script src="/resources/js/member/find_pwd.js"></script>

</head>
<body>
<!-- jsp 변환 / 2023-04-14 / 김서영 -->

	<%@ include file="../common/header.jsp" %>

    <div id="main">
        <div id="content">
            <div class="section_login">
                <h3 class="tit_login">비밀번호 찾기</h3>
                <div class="write_form find_view">
                        <strong class="tit_label">이름</strong>
                        <input type="text" name="srch_name" id="srch_name" size="20" tabindex="2" size="29" required placeholder="이름 입력">

                        <strong class="tit_label">이메일</strong>
                        <input type="email" name="srch_email" id="srch_email" size="20" tabindex="5" size="29" required placeholder="가입 시 등록한 이메일 입력">
                        <button type="button" onclick="check_input_fpw()" class="btn_type1">
                            <span class="txt_type">확인</span>
                        </button>

                </div>
            </div>
        </div>
    </div>

    </body>

</body>
</html>



