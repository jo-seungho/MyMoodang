
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

    var data = { name : name.val()
    		   , phone : phone.val()};

   	$.ajax({
		   url : "findId.me"
		 , type : "post"
		 , data : data
		 , success : function(result) {
			 if(result.success == "Y") { // 성공
				 console.log("성공");
				location.href = "views/member/find_id_success.jsp";

			 } else { // 실패
				 alert(result.message);
				 console.log("실패");
			 }
		 }
		 , error : function() {
			 console.log("아이디 찾기용 ajax 통신 실패!!");
		 }
	   });
	return true;
}