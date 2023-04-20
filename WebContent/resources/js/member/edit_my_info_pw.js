function validate() {
	let $id = $("#memberId");
	let $pwd = $("#pwdCheck");

	if($pwd.val() == "") {
		alert("비밀번호를 입력해 주세요.");
	}

	var data = {memberId : $id.val()
		      , password : $pwd.val()}

	console.log("입력받은 값" + data);

}