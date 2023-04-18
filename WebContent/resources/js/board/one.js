/**
 * 2023-04-18 김서영
 * 문의글 제목 클릭시 문의 내용과 댓글 내용 보이도록 처리
 */
$(function() {
    $("#sd1_q1").click(function() {
        let $q2 = $("#sd1_q2");
        let $a = $("#sd1_a");

        if($q2.css("display") == "none") {
            $q2.slideDown();
            $a.slideDown();
        } else {
            $q2.slideUp();
            $a.slideUp();
        }
    });
});

// 각 로우마다 클릭 이벤트 걸리도록 수정해야 함.... 현재는 첫번째 로우만 이벤트가 걸린 상태