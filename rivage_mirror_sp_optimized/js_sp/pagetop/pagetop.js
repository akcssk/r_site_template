/* �X�N���[������ƃy�[�W�g�b�v�֖߂�{�^�����A�j���[�V�����ŕ\��*/

$(function() {
	var showFlug = false;
	var topBtn = $('p#page-top');	
	var cartBtn = $('p#page-cart');	

	topBtn.css('bottom', '-100px');
	cartBtn.css('bottom', '-100px');

	var showFlug = false;
	$(window).scroll(function () {
		if ($(this).scrollTop() > 100) {
			if (showFlug == false) {
				showFlug = true;
				topBtn.animate({'bottom' : '0px'}, 200); 
				cartBtn.animate({'bottom' : '50px'}, 200); 
			}
		} else {
			if (showFlug) {
				showFlug = false;
				topBtn.animate({'bottom' : '-100px'}, 200); 
				cartBtn.animate({'bottom' : '-100px'}, 200); 
			}
		}
	});

	// PAGETOP�{�^���N���b�N
    topBtn.click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 500);
    });

	// ���w���͂�����{�^���N���b�N
    cartBtn.click(function () {
		var pos = $('a[name=cart]').position();
		$('body,html').animate({
			scrollTop: pos.top
		}, 500);
    });
});