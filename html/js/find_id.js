

function check_input_fid(){

    let name = $("#srch_id")
    let phone = $("#srch_phone")
   
    // 이름 유효성 검사
    let regExp = /^[가-힣]{2,}$/;
    if(!regExp.test(name.val())) {
        alert("이름을 확인하고 다시 입력해주세요.");
        name.focus();
        return false;
    }

    regExp = /^\d{3}\d{3,4}\d{4}$/;
    if(!regExp.test(phone.val())) {
        alert("핸드폰 번호를 확인하고 다시 입력해주세요.");
        phone.focus();
        return false;
    }
    return true;

}