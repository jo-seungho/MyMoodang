<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- header css -->
    <link rel="stylesheet" href="/resources/css/common/reset.css">
    <link rel="stylesheet" href="/resources/css/common/header.css">
    <link rel="stylesheet" href="/resources/css/member/join.css">
    <link rel="stylesheet" href="/resources/css/member/edit_my_info.css">

    <script src="/resources/js/common/header.js"></script>
    <script src="/resources/js/member/join.js"></script>
    <script src="/resources/js/member/edit_my_info.js"></script>




    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>





    <title>내 정보 수정</title>
</head>

<body>

<!-- jsp 변환 / 2023-04-14 / 김서영 -->

        <%@ include file="../common/header.jsp" %>




  <!-- 내용 영역 시작 - 내 정보 수정-->

    <div id="content">
        <div class="main_page_aticle">
            <div class="form">
                <h3 class="main_title">내 정보 수정</h3><br><br>
                <div class="boder_btom"></div>

                <form action="" method="POST">
                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6 id_bell_f"> <br>
                            <span class="member_name">
                                <label>아이디(이메일) </label>
                            </span>
                            <span class="member_content">
                                <input type="text" name="memberId" class="width300 form-control" id="loginId" placeholder="예) stopeatting@mymudang.com">&nbsp;&nbsp;
                            </span>
                        </div>
                    </div>
<!--
                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6 pw_bell_f">
                            <span class="member_name">
                                <label>현재 비밀번호 </label>
                            </span>
                            <span class="member_content">
                                <input type="password" name="password" class="form-control inpt_pw check_pw" id="submit_check_pw" placeholder="비밀번호를 입력해주세요">
                                <p class="txt_guide">
                                    <span class="pw_txt_case1 pw_bell_s ">10자 이상 입력</span>
                                    <span class="pw_txt_case2 pw_bell_t ">영문/숫자/특수문자 (- 제외) 조합해주세요</span>
                                </p>
                            </span>
                        </div>
                    </div>

                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6 pw2_bell_f">
                            <span class="member_name">
                                <label class="col-sm-2 col-form-label">새 비밀번호 </label>
                            </span>
                            <span class="member_content">
                                <input type="password" name="pwCheck" class="form-control inpt_pw2 check_pw" id="submit_check_pw2" placeholder="비밀번호를 한번 더 입력해주세요">
                                <p class="txt_guide">
                                    <span class="pw2_txt_case1  pw2_bell_s">동일한 비밀번호를 입력해주세요</span>
                                </p>
                            </span>
                        </div>
                    </div>

                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6 pw2_bell_f">
                            <span class="member_name">
                                <label class="col-sm-2 col-form-label">새 비밀번호확인 </label>
                            </span>
                            <span class="member_content">
                                <input type="password" name="pwCheck" class="form-control inpt_pw2 check_pw" id="submit_check_pw2" placeholder="비밀번호를 한번 더 입력해주세요">
                                <p class="txt_guide">
                                    <span class="pw2_txt_case1  pw2_bell_s">동일한 비밀번호를 입력해주세요</span>
                                </p>
                            </span>
                        </div>
                    </div>

-->

                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6">
                            <span class="member_name">
                                <label class="col-sm-2 col-form-label">이름 </label>
                            </span>
                            <span class="member_content">
                                <input type="text" name="userName" class="form-control" id="submit_check_name" placeholder="이름을 입력해주세요">
                            </span>
                        </div>
                    </div>

                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6">
                            <span class="member_name">
                                <label class="col-sm-2 col-form-label">휴대폰 </label>
                            </span>
                            <span class="member_content">
                                <input type="text" name="phone_number" class="form-control" id="submit_check_phone" placeholder="숫자만 입력해주세요">
                            </span>
                        </div>
                    </div>

                    <div class="row mb-3" id="font_size">
                        <span class="member_name">
                            <label class="col-sm-2 col-form-label">주소 </label>
                        </span>
                        <span class="member_content">
                          <input type="text" name="zipCode" class="form-control width100 text_disabled" readonly="readonly" placeholder="우편번호">
                          <input type="text" name="shipAddr" class="form-control width309 text_disabled" readonly="readonly" placeholder="주소">
                          <button type="button" id="juso" class="btn-outline-primary width100"><span id="adressNo">주소 검색</span></button>
                        </span>
                    </div>
                    <div class="row mb-3" id="font_size">
                      <span class="member_name"></span>
                      <span class="member_content">
                        <input type="text" name="shipAddrInfo" class="form-control" placeholder="상세주소">
                      </span>
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
                                <input type="text" name="year" class="form-control width100" id="birth_year" pattern="[0-9]*" value="" label="생년월일" size="4" maxlength="4" placeholder="YYYY">
                                <span class="bar"></span>
                                <input type="text" name="month" class="form-control width100" id="birth_month" pattern="[0-9]*" value="" label="생년월일" size="2" maxlength="2" placeholder="MM">
                                <span class="bar"></span>
                                <input type="text" name="day" class="form-control width100" id="birth_day" pattern="[0-9]*" value="" label="생년월일" size="2" maxlength="2" placeholder="DD">
                              </span>
                        </div>

                    </div>


                    <div id="edit_form_btn" align="center">
                        <button type="submit" id="edit_info_btn" >수정하기</button> &nbsp;
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
                         <input type="hidden" name="userId" value="<%= userId %>">
                         <table id="modal_pwd">
                             <tr>
                                 <td>현재 비밀번호</td>
                                 <td>
                                     <input type="password" name="userPwd" required>
                                 </td>
                             </tr>
                             <tr>
                                 <td>새 비밀번호</td>
                                 <td>
                                     <input type="password" name="updatePwd" required>
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

                         <button type="submit" class="btn btn-secondary btn-block" id="edit_pwd_btn1" onclick="return validatePwd();">비밀번호 변경</button>
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

                   <form action="" method="post">

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

                           <button type="submit" id="delete_info_btn1"  class="btn btn-danger btn-block">회원탈퇴</button>
                   </form>

                </div>
            </div>
        </div>
    </div>


</body>

</html>