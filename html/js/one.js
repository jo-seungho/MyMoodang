$(function() {
    $("#sd1_q1").click(function() {
        let $q2 = $("#sd1_q2");
        let $a = $("#sd1_a");

        if($q2.css("display") == "none") {
            $q2.slideDown(1000);
            $a.slideDown(1000);
        } else {
            $q2.slideUp(1000);
            $a.slideUp(1000);
        }     
    });
});