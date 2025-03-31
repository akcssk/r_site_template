$(function(){

//フェードイン1枚////////////////////////////////////////////////////////////////

	$('.slick-fadeIn1').slick({
		slidesToShow:1,      //スライドが見える数
		slidesToScroll:1,    //スクロールするスライドの数
		accessibility:false, //左右のナビゲーションの有効/無効
		fade:true,//フェードインでの表示の有効/無効
		arrows:false,//前へ/次へナビゲーションの有効/無効
		dots:false, //カレント表示のナビゲーション
		autoplay:true, // 	オートプレイの有効/無効
		autoplaySpeed:5000, //スライドが切り替わる時間(ms)
		pauseOnHover:true //スライドにホバーした際に自動再生を止める 有効/無効
	});



//スライド1枚////////////////////////////////////////////////////////////////
	$('.slick-slide1').slick({
		slidesToShow:1, //スライドが見える数
		slidesToScroll:1,//スクロールするスライドの数
		accessibility:true, //左右のナビゲーションの有効/無効
		swipe:true,
		autoplay:true, // 	オートプレイの有効/無効
		autoplaySpeed:3000, //スライドが切り替わる時間(ms)
		dots:true, //カレント表示のナビゲーション
		pauseOnHover:true //スライドにホバーした際に自動再生を止める 有効/無効
	});


//スライド3枚////////////////////////////////////////////////////////////////
	$('.slick-slide3').slick({
		slidesToShow:3, //スライドが見える数
		slidesToScroll:1,//スクロールするスライドの数
		accessibility:true, //左右のナビゲーションの有効/無効
		swipe:true,
		autoplay:true, // 	オートプレイの有効/無効
		autoplaySpeed:3000, //スライドが切り替わる時間(ms)
		dots:true, //カレント表示のナビゲーション
		pauseOnHover:true //スライドにホバーした際に自動再生を止める 有効/無効
	});



//サムネイル用////////////////////////////////////////////////////////////////
  $( '.slick-thum-for' ).each( function( i ) {
    var $_t = $( this );
		var j = i + 1;
		//htmlはi上からidを1から順番につけること（複数のslickに対応）
		// id="slider-for1"
		// id="slider-nav1"

		//メイン部分////////////////////////////
		$( '#slick-thum-for' + j ).slick( {
			slidesToShow: 1,
			slidesToScroll: 1,
			dots:false,
			variableWidth:true,
			centerMode:true,
			autoplay:true,
		  arrows: true,
			asNavFor: '#slick-thum-nav' + j
		});
		//サムネイル////////////////////////////
		$( '#slick-thum-nav' + j ).slick( {
			slidesToShow: 5,
		  slidesToScroll: 1,
		  asNavFor: '#slick-thum-for' + j,
		  dots: false,
		  focusOnSelect: true,
		  arrows: true,
		  //centerMode: true,
		  dots:false,
		  autoplay:true
		});
	});
	
	
//サムネイル用-スライドなし////////////////////////////////////////////////////////////////



  var thumbnailMain = ".slick-thumb-main"; // スライダー
  var thumbnailItem = ".slick-thumb-list li"; // サムネイル画像アイテム
  
  // サムネイル画像アイテムに data-index でindex番号を付与
  $(thumbnailItem).each(function(){
   var index = $(thumbnailItem).index(this);
   $(this).attr("data-index",index);
  });
  
  // スライダー初期化後、カレントのサムネイル画像にクラス「thumbnail-current」を付ける
  // 「slickスライダー作成」の前にこの記述は書いてください。
  $(thumbnailMain).on('init',function(slick){
   var index = $("li.slick-slide.slick-current").attr("data-slick-index");
   $(thumbnailItem+'[data-index="'+index+'"]').addClass("thumbnail-current");
  });

	var arg = new Object;
	var prm = window.location.search.substring(1).split("&");
	for(var i = 0; i < prm.length; i++){
		var kv = prm[i].split("=");
		arg[kv[0]] = kv[1];
	}
	var initialSlide = arg.idx || 0;

  //メイン
  $(thumbnailMain).slick({
    autoplay: false,
    arrows: false,
    fade: true,
	initialSlide: initialSlide,
    infinite: false //これはつけましょう。
  });
  //サムネイル画像アイテムをクリックしたときにスライダー切り替え
  $(thumbnailItem).on('click',function(){
    var index = $(this).attr("data-index");
    $(thumbnailMain).slick("slickGoTo",index,false);
  });
  
  //サムネイル画像のカレントを切り替え
  $(thumbnailMain).on('beforeChange',function(event,slick, currentSlide,nextSlide){
    $(thumbnailItem).each(function(){
      $(this).removeClass("thumbnail-current");
    });
    $(thumbnailItem+'[data-index="'+nextSlide+'"]').addClass("thumbnail-current");
  });



//レスポンシブで枚数変更////////////////////////////////////////////////////////////////
	$('.slick-slide-res').slick({
		infinite: true,
		slidesToShow: 5,
		slidesToScroll: 1,

			responsive: [{
				breakpoint: 768,
				settings: {
					slidesToShow: 3,
					slidesToScroll: 1,
				}
			},
			{
				breakpoint: 480,
				settings: {
					slidesToShow: 2,
					slidesToScroll: 1,
				}
			}],

		accessibility:true, //左右のナビゲーションの有効/無効
		swipe:true,		
		autoplay:true, // 	オートプレイの有効/無効
		autoplaySpeed:3000, //スライドが切り替わる時間(ms)
		dots:true, //カレント表示のナビゲーション
		pauseOnHover:true //スライドにホバーした際に自動再生を止める 有効/無効
  });


//ここまでｓ///////////////////////////////////////////////

});


