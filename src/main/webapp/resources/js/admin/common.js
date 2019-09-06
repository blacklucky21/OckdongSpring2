/*//// 아코디언 효과
$(document).ready(function() {
	$(" .menu_depth1").click(function() {
        if ($(this).next().is(":hidden")) {
            $(".acc_subject").slideUp();
            $(this).next().slideDown();

        } else {
            $(".acc_subject").slideUp();
        }
        //$(this).toggleClass("activeMenu").siblings(".accor_has_sub .menu_depth1").removeClass("activeMenu");
    });
});*/

$(function(){
	$(".accor_has_sub .menu_depth1").click(function(){
	
	$(this).next(".acc_subject").slideToggle().siblings(".acc_subject").slideUp();
		$(this).toggleClass("activeMenu").siblings(".accor_has_sub .menu_depth1").removeClass("activeMenu"); 
		
	});
});

// 관리자 메인 페이지
$(function(){
	$('.div1').on("click", function(){
		location.href="adminView.do";
	});
});

// 로그 아웃
$(function(){
	$('.logout').on("click", function(){
		location.href="logout.me";
	});
});
