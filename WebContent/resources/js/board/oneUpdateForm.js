/**
 *  1:1 문의 수정 js 파일
 * 2023-04-18 김서영
 */

$( document ).ready(function() {
    console.log( "ready!" );
});

function inquiryUpdate_btn() {

	let $type = $("#inType");
	let $title = $("#in_title");
	let $content = $("#in_content");
	let $ino = $("#ino");

// 문의 유형 선택 했는지 검사
	if($type.val() == null) {
		alert("문의 유형을 선택해 주세요.")
		$type.focus();
		return false;
	}
// 제목 입력했는지 검사
	if($title.val() == "") {
		alert("제목을 입력해 주세요.");
		$title.focus();
		return false;
	}
// 내용 입력했는지 검사
	if($content.val() == "") {
		alert("문의 내용을 입력해 주세요.");
		$content.focus();
		return false;
	}


	var data = {type : $type.val()
			  , title : $title.val()
			  , content : $content.val()
			  , ino : $ino.val()};

	console.log(data);

	$.ajax({
			url : "/update.in"
		  , type : "post"
		  , data : data
		  , success : function(result) {

			if(result.success == "Y") {
			  console.log("1:1문의 등록 성공!")
			  alert(result.message);
			  location.href = "/list.in";
			} else {
				console.log("1:1문의 등록 실패")
				alert(result.message);
			}
		  }
		  , error : function() {
			  console.log("1:1문의 등록용 ajax 요청 실패!!");
		  }
	});

	return true;
}
