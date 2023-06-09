<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

	<%@ include file="../common/common.jsp" %>

    <link rel="stylesheet" href="/resources/css/member/login.css">
    <script src="/resources/js/member/find_id11.js"></script>


</head>
<body>
<!-- jsp 변환 / 2023-04-14 / 김서영 -->

	<%@ include file="../common/header.jsp" %>


      <div id="content">
        <div class="section_login">
            <h3 class="tit_login">아이디 찾기</h3>
            <div class="write_form find_view">
                    <form method="post" name="fm_id" id="form"  action="/findId.me">

                    <strong class="tit_label">이름</strong>
                    <input type="text" name="srch_id" id="srch_id" size="20" tabindex="2" size="29" required placeholder="이름 입력">

                    <strong class="tit_label">휴대폰번호</strong>
                    <input type="text" name="srch_phone"  id="srch_phone" size="20" tabindex="5" size="29" required placeholder="가입 시 등록한 휴대폰번호 입력">
                    <button type="button" onclick="return check_input_fid()" class="btn_type1">
                        <span class="txt_type">확인</span>
                    </button>
                </form>


            </div>
        </div>
    </div>


</body>
</html>



