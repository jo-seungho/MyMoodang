/**
 * 2023-04-17 김서영
 * 유효성 검사 추가
 */
function check_input_fpw(){
    let name = $("#srch_name")
    let email = $("#srch_email")


    // 이름 유효성 검사
    let regExp = /^[가-힣]{2,}$/;
    if(!regExp.test(name.val())) {
        alert("이름을 확인하고 다시 입력해주세요.");
        name.focus();
        return false;
    }

    // 이메일 검사
	if(email.val().length == 0) {
		alert("이메일을 정확히 입력해주세요.");
		email.focus();
		return false;
	}

	var data = { name : name.val()
			   , email : email.val()};

	$.ajax({
		 url : "/findPwdMailCheck.me"
	   , type : "post"
	   , data : data
	   , success : function(result) {
		   if(result.success == "Y") {
			   console.log("찾았다!");
			   location.href = ""
		   }
	   }

	});





    return true;
}