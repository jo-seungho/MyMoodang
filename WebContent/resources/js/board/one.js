/**
 * 2023-04-18 김서영
 * 문의글 제목 클릭시 문의 내용과 댓글 내용 보이도록 처리
 */

// 각 로우마다 클릭 이벤트 걸리도록 수정해야 함.... 현재는 첫번째 로우만 이벤트가 걸린 상태 => 2023-04-18 수정 완료(김서영)



// 클릭한 게시글의 번호를 넘겨 수정폼으로 연결시킴 / 2023-04-18 김서영
function update_form(ino) {
	location.href = "/updateForm.in?ino=" + ino;
}

// 클릭한 게시글의 번호를 넘겨 삭제 / 2023-04-19 김서영
function delete_in(ino) {
	//console.log(ino);
	location.href = "/delete.in?ino=" + ino;
}


$(function() {
    $(".sd1_q1").click(function() {
        let $q2 = $(this).next();
        let $q3 = $(this).next().next().find('pre.sd1_q2');

        if($q2.css("display") == "none") {
            $q2.slideDown();
            $q3.slideDown();
        } else {
            $q2.slideUp();
            $q3.slideUp();
        }
    });
});
