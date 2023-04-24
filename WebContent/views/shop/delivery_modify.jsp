<!--  2023.04.23 page import 추가, 스클립 추가
, input type=hidden 으로 배송지번호를 넘김, 기본값으로 본인의 수정하기 버튼 입력한 행의 배송지 정보들을 불러옴 / 이지환 -->

<!-- 스클립틀릿 추가 (변수명 updateMS), 저장 버튼 클릭 시 function 이벤트 작성 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList, com.kh.user.member.model.vo.ShippingAddress" %>


<% ShippingAddress updateMS = (ShippingAddress)request.getAttribute("updateMS");
			%>
			
			<%--
     <% if(session.getAttribute("isSuccess") != null && (boolean)session.getAttribute("isSuccess")){ %>
        alert("<%= request.getAttribute("alertMsg") %>");
        window.close();
    <% } %>
    --%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    
	
			
	
    <title>배송지 수정</title>

    <link rel="stylesheet" href="/views/common/common.jsp">
    <link rel="stylesheet" href="/resources/css/shop/address_search.css">
    <link rel="stylesheet" href="/resources/css/shop/delivery_modify.css">
	<link rel="stylesheet" href="/resources/css/">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    
    <script src="/resources/js/shop/deliver.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
</head>
<body>


    <div class="section_destination delivery_modify">
        <div id="inputForm">
            <form  method="post" action="update.de">
           
            	  <%--  <% if(updateMS != null && updateMS.isEmpty()) { --%>
                <div class="modify only_pc">
                    <h2 class="pop_head">배송지 수정</h2>
                    <div class="field">
                    
                    <!-- db로부터 shipNo 넘김 -->
                    <input type="hidden" name="shipNo" value="<%= updateMS.getShipNo() %>">
                        <div id="addrMain" class="address">
                        
                		<%-- 경기도 광명시 하안동 대신 주소 입력할 수 있게끔 아래의 구문 작성 --%>
                
                		<!-- 2023.04.23 추가 -->
                		<input type="text" name="address" placeholder="기본 주소 입력" value="<%=updateMS.getShipAddr()%>">
                        </div>
                        
                        <!--  2023.04.23 / 기본 주소 입력 구문 추가 / 이지환 -->
                     <%-- <input type="text" id=addrMain name="address" placeholder="기본 주소 입력" value=""> --%>
                      
                        <input type="text" id="addrSub" name="user_detail_address" placeholder="나머지 주소를 입력해주세요" value="<%= updateMS.getShipAddrInfo() %>">
                    </div>

                    <div class="field">
                        <div class="label_block">이름</div>
                        <input type="text" id="receiverName" name="name"  placeholder="이름을 입력해주세요" value="<%= updateMS.getShipName() %>">
                    </div>


                    <div class="field">
                        <div class="label_block">
                            휴대폰
                        </div>
                        <input type="text" id="receiverPhone" name="mobileInp"  data-format="number" pattern="[0-9]*" inputmode="decimal" placeholder="번호를 입력해주세요" value="<%= updateMS.getPhone()%>">
                    </div>

                    <label class="label_default">
                        <input type="checkbox" id="isDefault" name="Default_address" value="">
                        <span class="ico"></span>
                     	기본배송지로 저장
                    </label>

                    	<!-- 2023.04.23 action 추가 용으로 form 태그로 묶음 이지환 -->
                    	<form>
                    		
                    		<!-- 2023.04.24 수정 팝업 창 닫는 이벤트 추가 -->
                    		<button type="submit" class="btn active" onclick="popup_close()" action="/update.de">저장</button>
                    	</form>
                    <button type="submit" class="btn normal" formaction="" >삭제</button>
				
                </div>
              
            </form>
        </div>
    </div>

</body>
</html>