$(document).ready(function() {
 $('.drawer').drawer();
});

$(".drawerClose").on("click", function(){
	var flg = $("body").hasClass("drawer-open");
	if(flg){
		$(".drawer").drawer("close");
	}
});

//�y�[�W�������N�̎��Aclass="drawerClose"������
/*
<nav class="drawer-nav">
	<ul class="drawer-menu clearfix">
	<li><a href="#concept" class="drawerClose">�R���Z�v�g<span>concept</span></a></li>
	<li><a href="#outline" class="drawerClose">�����T�v��ݔ�<span>outline</span></a></li>
	<li><a href="#plan" class="drawerClose">�Ԏ��<span>plan</span></a></li>
	<li><a href="#access" class="drawerClose">�A�N�Z�X<span>access</span></a></li>
	<li><a href="#location" class="drawerClose">���P�[�V����<span>location</span></a></li>
	<li class="dispSP"><a href="https://hibiki.co.jp/rent/?s_name=�O�����p���b�V�I�b�z��" target="_blank">�󎺈ꗗ<span>list</span></a></li>
	<li class="dispSP"><a href="https://hibiki.co.jp/contact/" target="_blank">���������E���⍇��<span>inquiry</span></a></li>
	</ul>
</nav>
*/
