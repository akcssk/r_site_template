/*�X�N���[������ƃy�[�W�g�b�v�֖߂�{�^�����t�F�[�h���ĕ\��

$(function() {
	var topBtn = $('#page-top');	
	topBtn.hide();
	$(window).scroll(function () {
		if ($(this).scrollTop() > 100) {
			topBtn.fadeIn();
		} else {
			topBtn.fadeOut();
		}
	});
	//�X�N���[�����ăg�b�v
    topBtn.click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 500);
		return false;
    });
});
*/
/*�X�N���[������ƃy�[�W�g�b�v�֖߂�{�^�����A�j���[�V�����ŕ\��*/

$(function() {
	var showFlug = false;
	var topBtn = $('#page-top');	
	topBtn.css('bottom', '-100px');
	var showFlug = false;
	$(window).scroll(function () {
		if ($(this).scrollTop() > 100) {
			if (showFlug == false) {
				showFlug = true;
				topBtn.stop().animate({'bottom' : '20px'}, 200); 
			}
		} else {
			if (showFlug) {
				showFlug = false;
				topBtn.stop().animate({'bottom' : '-100px'}, 200); 
			}
		}
	});
	//�X�N���[�����ăg�b�v
    topBtn.click(function () {
		$('body,html').animate({
			scrollTop: 0
		}, 500);
		return false;
    });
});
