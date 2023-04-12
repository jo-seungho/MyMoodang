// 비밀번호 일치 여부를 검사 (유효성 검사)
function validatePwd() {

    // 일치하지 않는다면 기본이벤트 제거 => false 리턴
    if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()) {
        // input 타입의 name값이 updatePwd인 것과    input 타입의 name값이 checkPwd인 것이 일치 하지 않는다면
        alert("비밀번호가 일치하지 않습니다.");
        return false;  // false 값이 onclick으로 돌아가서 return false가 되어야 하기때문에 위에 onclick 속성에 return validatePwd로 작성한 것임
    }
}

