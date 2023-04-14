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

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/resources/js/common/header.js"></script>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>


    <title>회원가입</title>
</head>

<body>
<!-- jsp 변환 / 2023-04-14 / 김서영 -->

	<%@ include file="../common/header.jsp" %>

    <div id="content">
        <div class="main_page_aticle">
            <div class="form">
                <h3 class="main_title">회원가입</h3>
                <p class="sub">
                    <span id="ico">*</span>
                    필수입력사항
                </p>


                <form action="join_complete.html" method="POST" onsubmit="return on_submit_check();">
                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6 id_bell_f">
                            <span class="member_name">
                                <label>아이디(이메일) <span id=ico>*</span></label>
                            </span>
                            <span class="member_content">
                                <input type="email" name="memberId" class="width300 form-control" id="loginId" placeholder="예) stopeatting@mymudang.com">&nbsp;&nbsp;
                                <button type="button" class="btn-outline-primary width100" id="emailjungbok">중복확인</button>&nbsp;&nbsp;
                                <button type="button" class="btn-outline-primary width100">이메일 인증</button>
                            </span>
                        </div>
                    </div>

                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6 pw_bell_f">
                            <span class="member_name">
                                <label>비밀번호 <span id=ico>*</span></label>
                            </span>
                            <span class="member_content">
                                <input type="password" name="password" class="form-control inpt_pw check_pw" id="submit_check_pw" placeholder="영문/숫자/특수문자를 제외한 10글자 이상의 비밀번호를 입력해 주세요">
                            </span>
                        </div>
                    </div>

                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6 pw2_bell_f">
                            <span class="member_name">
                                <label class="col-sm-2 col-form-label">비밀번호확인 <span id=ico>*</span></label>
                            </span>
                            <span class="member_content">
                                <input type="password" name="pwCheck" class="form-control inpt_pw2 check_pw" id="submit_check_pw2" placeholder="위와 동일한 비밀번호를 한번 더 입력해주세요">
                            </span>
                        </div>
                    </div>


                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6">
                            <span class="member_name">
                                <label class="col-sm-2 col-form-label">이름 <span id=ico>*</span></label>
                            </span>
                            <span class="member_content">
                                <input type="text" name="userName" class="form-control" id="submit_check_name" placeholder="이름을 입력해주세요">
                            </span>
                        </div>
                    </div>

                    <div class="row mb-3" id="font_size">
                        <div class="col-sm-6">
                            <span class="member_name">
                                <label class="col-sm-2 col-form-label">휴대폰 <span id=ico>*</span></label>
                            </span>
                            <span class="member_content">
                                <input type="text" name="phone_number" class="form-control" id="submit_check_phone" placeholder="숫자만 입력해주세요">
                            </span>
                        </div>
                    </div>

                    <div class="row mb-3" id="font_size">
                        <span class="member_name">
                            <label class="col-sm-2 col-form-label">주소 <span id=ico>*</span></label>
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

                    <div class="boder_btom"></div><br>

                    <div class="checkbox_group" id="font_size">
                        <div class="col-sm-6">
                          <span class="member_name">
                            <label class="col-sm-2 col-form-label" style="font-weight: 800;">이용약관동의 <span id=ico> * </span></label>
                          </span>
                          <span class="member_content">
                            <label for="check_all"><input type="checkbox" id="check_all"> 전체 동의합니다.</label>
                          </span>
                        </div>
                        <div class="col-sm-6">
                          <span class="member_name">
                          </span>
                          <span class="member_content">
                            <label for="check_1"><input type="checkbox" class="normal" id="check_1"> 이용약관 동의 <span class="redFont">(필수)</span></label>
                          </span>
                        </div>
                        <div class="col-sm-6">
                          <span class="member_name">
                         </span>
                          <span class="member_content">
                            <label for="check_2"><input type="checkbox" class="normal" id="check_2"> 개인정보 수집, 이용 동의 <span class="redFont">(필수)</span></label>
                          </span>
                        </div>
                        <div class="col-sm-6">
                          <span class="member_name">
                         </span>
                          <span class="member_content">
                            <label  for="check_3"><input type="checkbox" class="normal" id="check_3"> 마케팅 수신 동의 <span class="grayFont">(선택)</span></label>
                          </span>
                        </div>
                    </div>

                    <script>
                        // 체크박스 전체 선택
                        $(".checkbox_group").on("click", "#check_all", function () {
                            $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
                        });

                        // 체크박스 개별 선택
                        $(".checkbox_group").on("click", ".normal", function() {
                            var is_checked = true;

                            $(".checkbox_group .normal").each(function(){
                                is_checked = is_checked && $(this).is(":checked");
                            });

                            $("#check_all").prop("checked", is_checked);
                            });


                    </script>


                    <div id="formSubmit" class="form_footer">
                        <button type="submit" class="btn active btn_join" id="join_btn">가입하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </div>
</body>

</html>