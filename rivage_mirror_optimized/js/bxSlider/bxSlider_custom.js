$(function(){
    var slide = $('.bxslider ul').bxSlider({
        slideWidth  : 1140,
        slideMargin : 0,
        controls    : true,
        auto        : true,
				pager				: false,
        minSlides   : 3,
        maxSlides   : 3,
        moveSlides  : 1,
				infiniteLoop: true,
        speed       : 1000,
        pause       : 5000,
        touchEnabled: true,
        onSlideAfter: function(){
            slide.startAuto();
        }
    });
});
