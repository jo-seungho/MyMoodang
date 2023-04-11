var name = "test"
var email = "test@inu.ac.kr"


function check_input_fid(){
    if (!document.fm_id.srch_id.value){
        alert("이름을 입력하세요");
        document.fm_id.srch_id.focus();
        return;
    }
    if (!document.fm_id.srch_phone.value){
        alert("가입 시 등록한 휴대폰번호를 입력하세요");
        document.fm_id.srch_phone.focus();
        return;
    }
    if (document.fm_id.srch_id.value != name || document.fm_id.srch_email.value != email){
        alert("등록하신 회원정보가 없습니다.");
        location.href="find_id.html";
        return;
    }
    document.fm_id.submit();//action미지정. 이동없음

}