<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

    <link rel="stylesheet" href="/resources/css/member/join.css">
    <link rel="stylesheet" href="/resources/css/member/edit_my_info.css">

    <script src="/resources/js/member/join.js"></script>
    <script src="/resources/js/member/edit_my_info.js"></script>

    <title>내 정보 수정</title>
</head>

<body>

<!-- jsp 변환 / 2023-04-14 / 김서영 -->

        <%@ include file="../common/header.jsp" %>


	<%
		String memberId = loginUser.getMemberId();
		String email = loginUser.getEmail();
		String password = loginUser.getPassword();
		String name = loginUser.getName();


		String phone = (loginUser.getPhone() == null) ? "" : loginUser.getPhone();
		String gender = (loginUser.getGender() == null) ? "" : loginUser.getGender();
		String birthDate = (loginUser.getBirthDate() == null) ? "" : loginUser.getBirthDate();

		String year = "";
		String month = "";
		String day = "";

		if(birthDate != "") {
			year = birthDate.substring(0, 4);
			month = birthDate.substring(4, 6);
			day = birthDate.substring(6);
		}
	%>


  <!-- 내용 영역 시작 - 내 정보 수정-->

    <div id="content" >
        <div class="main_page_aticle">
            <div class="form">
                <h3 class="main_title">내 정보 수정</h3><br><br>
                <div class="boder_btom"></div>

                <form action="/updateInfo.me" method="POST">
                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6 id_bell_f"> <br>
                            <span class="member_name">
                                <label>아이디<span class="star">*</span></label>
                            </span>
                            <span class="member_content">
                                <input type="text" name="memberId" class="width300 form-control" id="loginId" value="<%= memberId %>" readonly>&nbsp;&nbsp;
                            </span>
                        </div>
                    </div>

					<div class="row mb-3" id="font_size">
                        <div class="col-sm-6 id_bell_f"> <br>
                            <span class="member_name">
                                <label>이메일<span class="star">*</span></label>
                            </span>
                            <span class="member_content">
                                <input type="email" name="email" class="width300 form-control" id="email" value="<%= email %>" required>&nbsp;&nbsp;
                            </span>
                        </div>
                    </div>



                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6">
                            <span class="member_name">
                                <label class="col-sm-2 col-form-label">이름 <span class="star">*</span></label>
                            </span>
                            <span class="member_content">
                                <input type="text" name="userName" class="form-control" id="submit_check_name" value="<%= name %>" required>
                            </span>
                        </div>
                    </div>

                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6">
                            <span class="member_name">
                                <label class="col-sm-2 col-form-label">휴대폰 </label>
                            </span>
                            <span class="member_content">
                                <input type="text" name="phone_number" class="form-control" id="submit_check_phone" value="<%= phone %>">
                            </span>
                        </div>
                    </div>

                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6">
                            <span class="member_name">
                                <label class="col-sm-2 col-form-label">성별 <span id=ico></span></label>
                            </span>
                            <span class="member_content">
                                <label><input type="radio" name="gender" class="gender" value="F" id="gender_M"><label class="gender_label" for="gender_M">남자</label>
                                <label><input type="radio" name="gender" class="gender" value="M" id="gender_W"><label class="gender_label" for="gender_W">여자</label>
                                <label><input type="radio" name="gender" class="gender" value="X" id="gender_N" checked="checked"><label class="gender_label" for="gender_N">선택안함</label>
                            </span>
                        </div>
                    </div>

                    <div class="row mb-3  btom_line" id="font_size">
                        <div class="col-sm-6 ">
                            <span class="member_name">
                                <label class="col-sm-2 col-form-label">생년월일</label>
                            </span>
                            <span class="member_content">
                                <input type="text" name="year" class="form-control width100" id="birth_year" pattern="[0-9]*" value="<%= year %>" label="생년월일" size="4" maxlength="4" >
                                <span class="bar"></span>
                                <input type="text" name="month" class="form-control width100" id="birth_month" pattern="[0-9]*" value="<%= month %>" label="생년월일" size="2" maxlength="2">
                                <span class="bar"></span>
                                <input type="text" name="day" class="form-control width100" id="birth_day" pattern="[0-9]*" value="<%= day %>" label="생년월일" size="2" maxlength="2">
                              </span>
                        </div>

                    </div>


                    <div id="edit_form_btn" align="center">
                        <button type="button" id="edit_info_btn" onclick="updateInfo();">수정하기</button> &nbsp;
                        <button type="button" id="edit_pwd_btn" data-toggle="modal" data-target="#updatePwdForm">비밀번호 변경</button> &nbsp;
                        <button type="button" id="delete_info_btn" data-toggle="modal" data-target="#deleteForm">회원탈퇴</button>
                     </div>

                </form>
            </div>
        </div>
    </div>



    <!-- 비밀번호 변경용 모달창 (부트스트랩) -->
    <div class="modal" id="updatePwdForm">
        <div class="modal-dialog">
            <div class="modal-content" >

                <!-- Modal Header -->
                <div class="modal-header" align="center">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="text-align: center; font-size: 20px;">비밀번호 변경</h4> <br>
                </div>

                <!-- Modal body -->
                <div class="modal-body" align="center">
                    <form action="/updatePwd.me" method="post">
                        <!--
                                비밀번호 변경 시 고려할 사항
                                현재 비밀번호, 변경할 비밀번호, 변경할 비밀번호 재입력

                                추가적으로 로그인한 회원의 아이디도 같이 넘기기 (hidden)
                         -->
                         <input type="hidden" name="userId" value="">
                         <table id="modal_pwd">
                             <tr>
                                 <td>현재 비밀번호</td>
                                 <td>
                                     <input type="password" name="userPwd" id="userPwd" required>
                                 </td>
                             </tr>
                             <tr>
                                 <td>새 비밀번호</td>
                                 <td>
                                     <input type="password" name="updatePwd" id="updatePwd" required>
                                 </td>
                             </tr>
                             <tr>
                                 <td>새 비밀번호 확인</td>
                                 <td>
                                     <input type="password" name="checkPwd" required>
                                 </td>
                             </tr>
                         </table>

                         <br>

                         <button type="submit" class="btn btn-secondary btn-block" id="edit_pwd_btn1" onclick="validatePwd();">비밀번호 변경</button>
                      </form>


                </div>

            </div>
        </div>
    </div>





    <!-- 회원 탈퇴용 모달창 (부트스트랩) -->
	<div class="modal" id="deleteForm">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"  style="text-align: center; font-size: 20px;">회원탈퇴</h4> <br><br>
                </div>

                <!-- Modal body -->
                <div class="modal-body" id="modal_del" align="center">

                   <b>
                         <span id="danger">탈퇴 후 복구가 불가능</span>합니다. <br><br>
                         정말로 탈퇴하시겠습니까? <br><br>
                   </b>

                   <form action="/delete.me" method="post">

                           <table id="modal_del1">
                               <tr>
                                   <td>비밀번호</td>
                                   <td>
                                       <input type="password" id="pass" name="userPwd" required>
                                       <!-- 본인의 비밀번호를 입력하고 일치해야만 탈퇴가 가능하도록 설계 -->
                                   </td>
                               </tr>
                           </table>

                           <br>

                           <button type="button" id="delete_info_btn1"  class="btn btn-danger btn-block" onclick="deleteMember('<%= memberId %>');">회원탈퇴</button>
                   </form>

                </div>
            </div>
        </div>
    </div>


</body>

</html>