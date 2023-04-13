$(document).ready(function(){
    $('.slider').slick({
    dots: true, // 페이지네이션 표시 여부
    arrows: true, // 이전/다음 버튼 표시 여부
    // autoplay: true, // 자동 재생 여부
    autoplaySpeed: 3000, // 자동 재생 간격
    speed: 500, // 슬라이드 전환 속도
    slidesToShow: 1, // 한 번에 보여줄 슬라이드 수
    slidesToScroll: 1 // 슬라이드 이동 시 변경될 슬라이드 수
    });
});