/* ù{ù^ùùùùù?ù?ùùoù[ùWùùùù*/

$(document).ready(function(){
	$(".accordion .accordionTitle").click(function(){
		var idx = $(".accordion .accordionTitle").index(this);
		var src = $(".accordion .accordionBtn").eq(idx).attr("src");
		if(src.indexOf("open") >= 0){ src = src.replace("open","close"); }
		else if(src.indexOf("close") >= 0){ src = src.replace("close","open");}
		$(".accordion img.accordionBtn").eq(idx).attr("src", src);
		$(".accordionDetail").eq(idx).slideToggle();
	});

	/*ùJùeùSùùù?ùp*/
	$(".accordion2 .accordionBtn2").click(function(){
		var idx = $(".accordion2 .accordionBtn2").index(this);
		$(".accordionDetail2").eq(idx).slideToggle();
	});

})
