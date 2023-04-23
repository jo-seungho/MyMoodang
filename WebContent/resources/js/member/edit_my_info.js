 $( document ).ready(function() {
    console.log( "ready!" );
});

 $(function() {

	let gender = "<%= gender %>";

	$("input[type=radio").each(function() {
		if(gender.search($(this).val()) != -1) {
			$(this).attr("checked", true);
		}
	})
});

function updateInfo() {

	let $id = $("#loginId");
	let $email = $("#email");
	let $name = $("#submit_check_name");
	let $phone = $("#submit_check_phone");
	let $gender = $("input[type=radio]");
	let $year = $("#birth_year");
	let $month = $("#birth_month");
	let $day = $("#birth_day");

	var data = { memberId : $id.val()
			   , name : $name.val()
			   , year : $year.val()
			   , month : $month.val()
			   , day : $day.val()
			   /*, birthDate : $year + $month + $day*/
			   , gender : $gender.val()
			   , email : $email.val()
			   , phone : $phone.val()}

	console.log(data);

	$.ajax({
		url : "updateInfo.me"
	  , type : "post"
	  , data : data
	  , success : function(result) {

		  console.log(result);

		  if(result.success == 'Y') {  // 정보 수정 성공
			  alert(result.message);
			  console.log("정보 수정 성공");
			  location.href = "/main";
		  } else { // 정보 수정 실패
			  alert(result.message);
			  console.log("정보 수정 실패");
		  }
		  }
		  , error : function() {
			  console.log("기본 정보수정용 ajax 통신 실패!!");
	  }

	});
}


// 비밀번호 일치 여부를 검사 (유효성 검사) & 비밀번호수정 컨트롤러와 통신
// 2023-04-20 김서영
function validatePwd() {

    // 일치하지 않는다면 기본이벤트 제거 => false 리턴
    if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()) {
        // input 타입의 name값이 updatePwd인 것과    input 타입의 name값이 checkPwd인 것이 일치 하지 않는다면
        alert("비밀번호가 일치하지 않습니다.");
        return false;  // false 값이 onclick으로 돌아가서 return false가 되어야 하기때문에 위에 onclick 속성에 return validatePwd로 작성한 것임
    }

    let $oldPwd = $("#userPwd");
    let $upPwd = $("#updatePwd");

    var data = { oldPwd : $oldPwd.val()
    			, upPwd : $upPwd.val()}

    console.log("비밀번호 수정 데이터" + data);

    $.ajax({
		url : "updatePwd.me"
	  , type : "post"
	  , data : data
	  , success : function(result) {
		  if(result.success == 'Y') {  // 정보 수정 성공
			  alert(result.message);
			  console.log(result.message);
			  console.log("비밀번호 수정 성공");
			  location.href = "/main";
		  } else { // 정보 수정 실패
			  alert(result.message);
			  console.log("비밀번호 수정 실패");
		  }
	  }
	  , error : function() {
			  console.log("비밀번호 수정용 ajax 통신 실패!!");
	  }
	});
}


function deleteMember(memberId) {
	//location.href = "/delete.me?memberId=" + memberId;
	let pwd = $("#pass");

	var data = { memberId : memberId
				, pwd : pwd.val()}

	console.log("회원탈퇴용 데이터 : " + data);

	$.ajax({
		  url : "delete.me"
		, type : "post"
		, data : data
		, success : function(result) {
			if(result.success == 'Y') {  // 회원탈퇴  성공
			  alert(result.message);
			  console.log("회원탈퇴  성공");
			  location.href = "/logout.me";
		 	} else { // 회원탈퇴  실패
			  alert(result.message);
			  console.log("회원탈퇴 실패");
		  	}
	  	}
	 	 , error : function() {
			  console.log("회원탈퇴용 ajax 통신 실패!!");
	 	 }
	});

}




