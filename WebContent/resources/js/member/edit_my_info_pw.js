$( document ).ready(function() {
    console.log( "ready!" );
});


function validate() {
	let $id = $("#memberId");
	let $pwd = $("#pwdCheck");

	if($pwd.val() == "") {
		alert("비밀번호를 입력해 주세요.");
		return false;
	}

/*
	var data = {memberId : $id.val()
		      , password : $pwd.val()}
	console.log(data);

	$ajax({
			url : "updateCheckPwd.me"
		  , type : "post"
		  , data : data
		  , success : function(result) {

			  if(result.success == 'Y') { // 비밀번호 확인됨!
				  alert(result.message);
				  console.log("비밀번호 확인 성공!");
				  location.href = "/updateForm.me;

			  } else {// 비밀번호 확인 안됨! 없어!
			  	  alert(result.message);
			  	  console.log("비밀번호 맞게 입력해라잉");
			  }
		  }
		  , error : function() {
			  console.log("비밀번호 체크용 ajax 통신 실패!");
		  }
	});
	*/

	return true;
}