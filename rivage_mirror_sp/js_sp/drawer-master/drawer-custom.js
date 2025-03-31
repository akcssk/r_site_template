$(document).ready(function() {
 $('.drawer').drawer();
});

$(".drawerClose").on("click", function(){
	var flg = $("body").hasClass("drawer-open");
	if(flg){
		$(".drawer").drawer("close");
	}
});

//ページ内リンクの時、class="drawerClose"を入れる
/*
<nav class="drawer-nav">
	<ul class="drawer-menu clearfix">
	<li><a href="#concept" class="drawerClose">コンセプト<span>concept</span></a></li>
	<li><a href="#outline" class="drawerClose">物件概要･設備<span>outline</span></a></li>
	<li><a href="#plan" class="drawerClose">間取り<span>plan</span></a></li>
	<li><a href="#access" class="drawerClose">アクセス<span>access</span></a></li>
	<li><a href="#location" class="drawerClose">ロケーション<span>location</span></a></li>
	<li class="dispSP"><a href="https://hibiki.co.jp/rent/?s_name=グランパラッシオ甲陽園" target="_blank">空室一覧<span>list</span></a></li>
	<li class="dispSP"><a href="https://hibiki.co.jp/contact/" target="_blank">資料請求・お問合せ<span>inquiry</span></a></li>
	</ul>
</nav>
*/
