window.addEventListener('DOMContentLoaded', function() {

    $(document).ready(function() {
        var startPrice = parseFloat($('.goods_price .dc_price').text());
        var quantity = $('.inp').val();
        var cost = parseFloat($('.goods_price input').val());
        var reserveAmount = (quantity * cost) / 20;

        $('.emph, .emphh').text(formatPrice(reserveAmount) + ' 원 적립');
        $('.price .num').text(formatPrice(startPrice));
        $('.num').text(formatPrice(quantity * cost) + '원');

        function formatPrice(price) {
            var formatted = price.toFixed(0).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            return formatted;
        }

        $('.down').click(function() {
            quantity--;
            if (quantity >= 0) {
                $('.inp').val(quantity);
                $(".count_num").text(quantity);
                $('.num').text(formatPrice(quantity * cost) + '원');
                reserveAmount = (quantity * cost) / 20;
                $('.emph, .emphh').text(formatPrice(reserveAmount) + ' 원 적립');
            } else {
                quantity = 0;
            }
        });

        $('.up').click(function() {
            quantity++;
            $('.inp').val(quantity);
            $(".count_num").text(quantity);
            $('.num').text(formatPrice(quantity * cost) + '원');
            reserveAmount = (quantity * cost) / 20;
            $('.emph, .emphh').text(formatPrice(reserveAmount) + ' 원 적립');
        });
    });

    var imgs;
    var img_count;

    imgs = $('.__slide-wrapper ul');
    img_count = imgs.children().length;

    $('.__slide-go-left').click(function() {
        slide_left();
    });

    $('.__slide-go-right').click(function() {
        slide_right();
    });

    function slide_left() {
        if (img_count > 0) {
            $('.__slide-wrapper ul li').last().prependTo('.__slide-wrapper ul');
            $('.__slide-wrapper ul').css("left", (-180) + "px");
            $('.__slide-wrapper ul').stop().animate({
                "left": "0px"
            }, 500, function() {});
        }
        return false;
    }

    function slide_right() {
        if (img_count > 0) {
            $('.__slide-wrapper ul').stop().animate({
                "left": (-180) + "px"
            }, 500, function() {
                $('.__slide-wrapper ul li').first().appendTo('.__slide-wrapper ul');
                $('.__slide-wrapper ul').css("left", "0px");
            })
        }
        return false;
    }

    function comma(num) {
        var len, point, str;

        num = num + "";
        point = num.length % 3;
        len = num.length;

        str = num.substring(0, point);
        while (point < len) {
            if (str != "") str += ",";
            str += num.substring(point, point + 3);
            point += 3;
        }

        return str;

    }
    

});