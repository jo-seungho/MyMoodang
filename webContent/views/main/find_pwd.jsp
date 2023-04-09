<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" href="/css/coomon/reset.css">
    <link rel="stylesheet" href="css/coomon/common.css">
    <link rel="stylesheet" href="/css/mypage/login.css">
</head>
<body>
    <body>
        <div id="container">



            <div id="main">
                <div id="content">
                    <div class="section_login">
                        <h3 class="tit_login">비밀번호 찾기</h3>
                        <div class="write_form find_view">
                            <form method="post" name="fm_pw" id="form" onsubmit="return chkForm(this);" action="">
                                <input type="hidden" name="act" value="Y">
                                <input type="hidden" name="rncheck" value="none">
                                <input type="hidden" name="dupeinfo" value>
                                <strong class="tit_label">이름</strong>
                                <input type="text" name="srch_name" size="20" tabindex="2" size="29" required placeholder="이름 입력">                    
                               
                                <strong class="tit_label">이메일</strong>
                                <input type="text" name="srch_email" size="20" tabindex="5" size="29" required placeholder="가입 시 등록한 이메일 입력">
                                <button type="button" onclick="check_input_fpw()" class="btn_type1">
                                    <span class="txt_type">확인</span>
                                </button>
                            </form>
                            
        
                        </div>
                    </div>
                </div>
            </div>

            

        </div>

        <script>

            var name = "테스트"
            var id = "test"
            var email = "test@inu.ac.kr"
        
            
            function check_input_fpw(){
                if (!document.fm_pw.srch_name.value){
                    alert("이름을 입력하세요");
                    document.fm_pw.srch_name.focus();
                    return;
                }
                
                if (!document.fm_pw.srch_email.value){
                    alert("가입 시 등록한 이메일을 입력하세요");
                    document.fm_pw.srch_email.focus();
                    return;
                }
                if (document.fm_pw.srch_name.value != name || document.fm_pw.srch_email.value != email){
                    alert("등록하신 회원정보가 없습니다.");
                    location.href="find_pw.html";
                    return;
                }
                document.fm_pw.submit();//action미지정. 이동없음

            }
        </script>

    </body>
    
</body>
</html>



