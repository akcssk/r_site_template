$(function(){
  $('.popup-iframe').magnificPopup({
    type: 'iframe',
    disableOn: 500, //�E�B���h�E����500px�ȉ��������烂�[�_���\���������Ƀ����N��֑J��
    mainClass: 'mfp-fade',
    removalDelay: 200,
    preloader: false,
    fixedContentPos: false
  });
});

$(function(){
      $('.popup-image').magnificPopup({
      type: 'image'
  });
});


$(function(){
	$('.popup-gallery').magnificPopup({
		delegate: 'a',
		type: 'image',
		tLoading: 'Loading image #%curr%...',
		mainClass: 'mfp-img-mobile',
		gallery: {
			enabled: true,
			navigateByImgClick: true,
			preload: [0,1] // Will preload 0 - before current, and 1 after the current image
		},
		image: {
			tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
			titleSrc: function(item) {
				return item.el.attr('title');
			}
		}
	});
});


function iframeClose(){
	$.magnificPopup.close();
}
