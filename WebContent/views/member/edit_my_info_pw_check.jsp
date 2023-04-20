<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>����������_��й�ȣȮ��</title>

    <link rel="stylesheet" href="/resources/css/common/reset.css" />
    <link rel="stylesheet" href="/resources/css/common/header.css" />
    <link rel="stylesheet" href="/resources/css/common/footer.css" />
    <link rel="stylesheet" href="/resources/css/member/edit_my_info_pw_check.css" />

    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="/resources/js/common/header.js"></script>
    <script src="/resources/js/member/edit_my_info_pw.js"></script>

</head>
<body>
<!-- jsp ��ȯ / 2023-04-14 / �輭�� -->
    <!-- ��� ���� -->
    <%@ include file="../common/header.jsp" %>
    <!-- ��� �� -->

    <%
    	String memberId = loginUser.getMemberId();
    %>


    <!-- ���̵� �޴��� ���� -->
    <div id="container">
        <div id="main">
            <div id="content">
                <div class="page_aticle aticle_type2">
                    <div id="mypage_side" class="snb_my" style="position: absolute;">
                        <h2 class="tit_snb">����������</h2>
                        <div class="inner_sub">
                            <ul class="list_menu">
                                <li>
                                    <a href="../main/order_list.html">�ֹ�����</a>
                                </li>
                                <li>
                                    <a href="#">���� ��ǰ</a>
                                </li>
                                <li>
                                    <a href="../main/delivery_list.html">����� ����</a>
                                </li>
                                <li>
                                    <a href="#">���� ����</a>
                                </li>
                                <li>
                                    <a href="#">����</a>
                                </li>
                                <li class="on">
                                    <a href="/updateCheckPwd.me">�� ���� ����</a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <form id="viewOrderList" class="page_section section_orderlist" action="updateForm.me" method="post">

                        <!-- �� ���� ���� - ��й�ȣ Ȯ�� ���� ���� -->
                        <div id="pwdCheck-section" style="margin-top: 50px;">
                          <h1 style="font-weight: 700;">�� ���� ����</h1>
                          <br><hr><br>
                          <h2 style="font-weight: 700;">��й�ȣ ��Ȯ��</h2> <br>
                          <p>ȸ������ ������ �����ϰ� ��ȣ�ϱ� ���� ��й�ȣ�� �ٽ� �ѹ� Ȯ���� �ּ���.</p>
                          <br><hr><br>

                          <div class="pwd_check_input" align="center">
                            <table style="padding: 30px;">
                                <tr>
                                    <th style="font-weight: 800;">���̵�(�̸���)</th>
                                    <td><input type="text" id="memberId" name="memberId" class="form-control" value="<%= memberId %>" readonly></td>
                                </tr>
                                <tr>
                                    <th style="font-weight: 800;">��й�ȣ Ȯ��</th>
                                    <td>
                                        <input type="password" id="pwdCheck" name="pwdCheck" class="form-control" placeholder="��й�ȣ">
                                    </td>
                                </tr>
                                    <td colspan="2" align="center">
                                    	<button type="submit" id="pwd_check_sub" onclick="validate();">Ȯ��</button>
                                    </td>
                                </tr>
                            </table>
                          </div>
                        </div>
                    </form>
                        <!-- �� ���� ���� - ��й�ȣ Ȯ�� ���� �� -->
                </div>
            </div>
        </div>
    </div>



</body>
</html>