<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배송지 수정</title>
    <link rel="stylesheet" href="/resources/css/common/reset.css">
    <link rel="stylesheet" href="/resources/css/shop/address_search.css">
    <link rel="stylesheet" href="/resources/css/shop/delivery_modify.css">


    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/resources/js/shop/deliver.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   
</head>
<body>

    <div class="section_destination delivery_modify">
        <div id="inputForm">
            <form  method="post">
                <div class="modify only_pc">
                    <h2 class="pop_head">배송지 수정</h2>
                    <div class="field">
                        <div id="addrMain" class="address">
                            경기도 광명시 하안동
                        </div>
                        <input type="text" id="addrSub" name="user_detail_address" placeholder="나머지 주소를 입력해주세요" value="202-202">
                    </div>

                    <div class="field">
                        <div class="label_block">이름</div>
                        <input type="text" id="receiverName" name="name"  placeholder="이름을 입력해주세요" value="조승호">
                    </div>


                    <div class="field">
                        <div class="label_block">
                            휴대폰
                        </div>
                        <input type="text" id="receiverPhone" name="mobileInp"  data-format="number" pattern="[0-9]*" inputmode="decimal" placeholder="번호를 입력해주세요" value="01082486651">
                    </div>

                    <label class="label_default">
                        <input type="checkbox" id="isDefault" name="Default_address" value="1">
                        <span class="ico"></span>
                        기본 배송지로 저장
                    </label>

                    <button type="submit" class="btn active" formaction="" >저장</button>
                    <button type="submit" class="btn normal" formaction="" >삭제</button>
                        
                </div>
            </form>
        </div>
    </div>
    
</body>
</html>