<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />

        <link rel="stylesheet" href="/resources/css/common/reset.css">
        <link rel="stylesheet" href="/resources/css/member/login.css">
        <link rel="stylesheet" href="/resources/css/common/header.css">

        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script src="/resources/js/common/header.js"></script>
        <script src="/resources/js/member/join.js"></script>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <title>로그인</title>

    </head>

    <body>
<!-- jsp 변환 / 2023-04-14 / 김서영 -->

	<%@ include file="../common/header.jsp" %>


        <div id="container" class="container">



            <div id="main">
                <div id="content">
                    <div class="section_login">
                        <h3 class="tit_login">로그인</h3>
                        <div class="write_form">
                            <div class="write_view login_view">
                                <form method="post" name="login_form" id="form"  action="login_ok.html">
                                    <input type="hidden" name="returnUrl" value="">
                                    <input type="hidden" name="close" value>
                                    <input type="text" name="m_id" size="20" tabindex="1" value placeholder="아이디 입력">
                                    <input type="password" name="password" size="20" tabindex="2" placeholder="비밀번호 입력">
                                    <div class="checkbox_save">
                                        <div class="login_search">
                                            <a href="/findIdForm.me" class="link">아이디 찾기</a> <!-- 2023-04-17 아이디 찾기 주소 연결 -->
                                            <span class="bar"></span>
                                            <a href="/findPwdForm.me" class="link">비밀번호 찾기</a>
                                        </div>
                                    </div>
                                    <button type="button" onclick="check_input()" class="btn_type1">
                                        <span class="txt_type">로그인</span>
                                    </button>
                                </form>
                                <a href="/enrollForm.me" class="btn_type2 btn_member">
                                    <span class="txt_type">회원가입</span> <!-- 2023-04-17 김서영 회원 가입 페이지랑 연결 -->
                                </a>

                            </div>

                        </div>
                    </div>
                </div>

            </div>






        </div>




        <script>

            var id = "test"
            var pw = "test"

            // getId = '${m_id}';
            // getPw = '${password}';

            function check_input(){
                if (!document.login_form.m_id.value){
                    alert("아이디를 입력하세요");
                    document.login_form.m_id.focus();
                    return;
                }
                if (!document.login_form.password.value){
                    alert("비밀번호를 입력하세요");
                    document.login_form.password.focus();
                    return;
                }
                if (document.login_form.m_id.value != id || document.login_form.password.value != pw){
                    alert("아이디 또는 비밀번호가 틀렸습니다.");
                    history.go(0);
                    return;
                }
                document.login_form.submit();

            }
        </script>
    </body>
</html>
