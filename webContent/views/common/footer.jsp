<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String paths = request.getContextPath();
%> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- footer css -->
  <link rel="stylesheet" href="<%= paths %>/resources/css/reset.css">
  <link rel="stylesheet" href="<%= paths %>/resources/css/footer.css">

  <!-- CDN -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <!-- 스크립트파일 -->
  <title>footer</title>
</head>
<body>
        <div id="footer">
        <div class="inner_footer">
            <div class="cc_footer">
            <!-- cc = company calls --> 
                <h2 class="cc_tit">고객행복센터</h2>
                <div class="cc_view cc_call">
                    <h3>
                        <span class="tit">1644-1107</span>
                    </h3>
                    <dl class="list">
                        <dt>365고객센터</dt>
                        <dd>오전 7시 - 오후 7시</dd>
                    </dl>
                </div>
                <div class="cc_view cc_kakao">
                    <h3>
                        <a href="#" class="tit">카카오톡 문의</a>
                    </h3>
                    <dl class="list">
                        <dt>365고객센터</dt>
                        <dd>오전 7시 - 오후 7시</dd>
                    </dl>
                </div>
                <div class="cc_view cc_qna">
                    <h3>
                        <a href="#" class="tit">1:1 문의</a>
                    </h3>
                    <dl class="list">
                        <dt>24시간 접수 가능</dt>
                        <dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
                    </dl>
                </div>
              </div>
            <div class="company_info">
                <ul class="list">
                    <li>
                        <a href="#" class="link">마이무당소개</a>
                    </li>
                    <li>
                        <a href="#" class="link">마이무당소개영상</a>
                    </li>
                    <li>
                        <a href="#" class="link">인재채용</a>
                    </li>
                    <li>
                        <a href="#" class="link">이용약관</a>
                    </li>
                    <li>
                        <a href="#" class="link">개인정보처리방침</a>
                    </li>
                    <li>
                        <a href="#" class="link">이용안내</a>
                    </li>
                </ul>
                <div class="spec_info">
                    법인명 (상호) : 주식회사 마이무당
                    <span class="bar">I</span>
                    사업자등록번호 : 000-00-0000 
                    <a href="#" class="link">사업자정보확인</a><br>
                    통신판매업 : 제 2018-서울강남-00000 호
                    <span class="bar">I</span>
                    개인정보보호책임자 : 000 <br>
                    주소 : 서울시 도산대로 16길 20, 이래빌딩 B1 ~ 4F
                    <span class="bar">I</span>
                    대표이사 : 김가현 <br>
                    입점문의 : <a href="#" class="link">입점문의하기</a>
                    제휴문의 : <a href="#" class="link">11017sk@hanmail.net</a><br>
                    채용문의 : <a href="#" class="link">11017sk@hanmail.net</a><br>
                    팩스 : 000 - 0000 - 0000
                    <span class="bar">I</span>
                    이메일 : <a href="#" class="link">11017sk@hanmail.net</a><br>
                    <br>
                    <strong class="copy">© MymooDang CORP. ALL RIGHTS RESERVED</strong>
                    <ul class="sns">
                        <li>
                            <a href="#" class="link_sns insta" target="_blank">
                                <img src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt="마켓컬리 인스타그바로가기">
                            </a>
                            <!-- bg url 넣기 -->
                        </li>
                        <li>
                            <a href="#" class="link_sns fb" target="_blank">
                                <img src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt="마켓컬리 페이스북 바로가기">
                            </a>
                        </li>
                        <li>
                            <a href="#" class="link_sns naver_blog" target="_blank">
                                <img src="https://res.kurly.com/pc/ico/1810/ico_blog.png" alt="마켓컬리 네이버블로그 바로가기">
                            </a>
                        </li>
                        <li>
                            <a href="#" class="link_sns naver_post" target="_blank">
                                <img src="https://res.kurly.com/pc/ico/1810/ico_naverpost.png" alt="마켓컬리 포스트 바로가기">
                            </a>
                        </li>
                        <li>
                            <a href="#" class="link_sns yt" target="_blank">
                                <img src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt="마켓컬리 유튜브 바로가기">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

          <div class="link_footer">
              <div class="authentication">
                  <a href="#" class="mark" target="_blank">
                      <img src="https://res.kurly.com/pc/ico/2001/logo_isms.png" alt="isms 로고" class="logo">
                      <p class="txt">
                          [인증범위] 마이무당 쇼핑몰 서비스 개발 · 운영<br>
                          [유효기간] 2023-04-06 ~ 2099-12-31
                      </p>
                  </a>
                  <a href="#" class="mark" target="_blank">
                      <img src="https://res.kurly.com/pc/ico/2001/logo_eprivacyplus.png" alt="eprivacy plus 로고" class="logo">
                      <p class="txt">
                          개인정보보호 우수 웹사이트 ·<br>
                          개인정보처리시스템 인증 (ePRIVACY PLUS)
                      </p>
                  </a>
                  <a href="#" class="lguplus mark" target="_blank">
                      <img src="https://res.kurly.com/pc/service/main/2009/logo_payments.png" alt="payments 로고" class="logo">
                      <p class="txt">
                          고객님의 안전거래를 위해 현금 등으로 결제 시 저희 쇼핑몰에서 가입한<br>
                          토스 페이먼츠 구매안전(에스크로) 서비스를 이용하실 수 있습니다.
                      </p>
                  </a>
              </div>
          </div>
      </div>
</body>
</html>