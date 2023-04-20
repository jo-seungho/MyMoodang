<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배송지 추가</title>

	<!-- 중복되는 헤더, 푸터, 리셋 css & 제이쿼리 & 헤더 js 담은 common.jsp / 2023-04-20 김서영 -->
	<%@ include file="../common/common.jsp"%>

    <link rel="stylesheet" href="/resources/css/shop/address_search.css">
    <script src="/resources/js/shop/deliver.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>

    <div class="section_destination" >
        <div id="inputForm">
            <form action="" method="post">
                <div class="modify only_pc">
                    <p class="tit_result">배송지를 선택해주세요.<br>
                        <span class="desc">매일 아침, 고객님의 제품을 문 앞까지 안전하게 보내드릴게요.</span>
                    </p>
                    <div class="field">
                        <div class="address_search">
                            <input id="addrMain" class="address" type="text" readonly="" name="user_address" placeholder="주소를 검색해주세요.">
                            <!-- text창을 누르면 검색버튼이 눌리도록 함.-->
                            <button type="button"  class="btn" onclick="sample3_execDaumPostcode()">
                                <span class="ico"></span>재검색<!-- 검색kakao api -->
                            </button>
                        </div>
                        <input type="text" id="addrSub" name="user_detail_address" placeholder="나머지 주소를 입력해주세요">
                    </div>

                    <!-- <label class="label_default"><br>
                        <input type="checkbox" id="isDefault" name="isDefault">
                        <span class="ico"></span>기본 배송지로 저장</label> -->

                    <label class="label_default">
                        <input type="checkbox" id="isDefault" name="Default_address" value="1">
                        <span class="ico"></span>
                        기본 배송지로 저장
                    </label>


                        <!-- db에 반영해야할 요소로 보임.(기본배송지)-->
                        <button type="submit" class="btn active">저장</button>
                        <!-- 저장시 db에 반영됨. 기본배송지 체크 시 반영해야함.-->
                        <br><br>
                </div>
            </form>
        </div>
    </div>


    <div id="wrapp" style="height:100%;">
    </div>

    <script>
        // 우편번호 찾기 찾기 화면을 넣을 element
        var element_wrap = document.getElementById('wrapp');

        function sample3_execDaumPostcode() {
            $('.section_destination').css('display', 'none');

            // 현재 scroll 위치를 저장해놓는다.
            var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
            new daum.Postcode({

                oncomplete: function(data) {
                    // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        // document.getElementById("sample3_extraAddress").value = extraAddr;

                    } else {
                        document.getElementById("addrMain").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    // document.getElementById('sample3_postcode').value = data.zonecode;

                    document.getElementById("addrMain").value = addr;
                    $('.section_destination').css('display', 'block');





                    // // 커서를 상세주소 필드로 이동한다.
                    // document.getElementById("sample3_detailAddress").focus();

                    // iframe을 넣은 element를 안보이게 한다.
                    // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                    element_wrap.style.display = 'none';

                    // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                    document.body.scrollTop = currentScroll;
                },
                // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                onresize : function(size) {
                    element_wrap.style.height = 866+'px'; // size.height

                },
                width : '100%',
                height : '100%'
            }).embed(element_wrap);

            // iframe을 넣은 element를 보이게 한다.
            element_wrap.style.display = 'block';
        }


        sample3_execDaumPostcode();

    </script>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>