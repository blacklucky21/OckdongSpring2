<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<!-- js -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/header.js"></script>
<!-- js End -->

<!-- CSS -->

<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/header/header.css">
<!--  CSS end -->
</head>		


<body>
<div class="top-area"></div>
<div id="pagescroll">
    <p onclick = "scrollup();"><a id="scrollup" href="#"><img src="resources/img/up.png"/></a></p>
    <p onclick = "scrolldown();"><a id="scrolldown" href="#"><img src="resources/img/btn_down.png"/></a></p>
</div>

    <div id="top" class="header">
<!-- 퀵 검색 폼 -->
    <!-- 퀵 검색 폼 -->



<!-- ####################### 최상단메뉴 ####################### -->

<div id="topbar">
<div class="wizsubmenu">

<!-- :::::::::::::::::::::::::::::::::::::: 상단왼쪽 :::::::::::::::::::::::::::::::::::::: -->


<!-- 상단카테고리영역 -->

<div class="topbar_left">
<ul>
<li class="topbar_cate"><a href="#" ><img src="resources/img/list_icon.png"> CATEGORIES</a>
<div class="cate_sub">
<div><a href="">NEW product</a></div>
<div><a href="listproduct.do">LUNCH BOX</a></div>
<div><a onclick="myOwnClick();">My own lunch box</a></div>
<div><a></a></div>
<div><a href="lbotmlist.do">Lunch box of the month</a></div>
<div><a></a></div>
</div>
</li>

<!-- //상단카테고리영역 -->

<!-- 상단커뮤니티영역 -->

<li class="topbar_com"><a href="#"><img src="resources/img/list_icon2.png"> COMMUNITY</a>
<div class="com_sub">
<div><a href="nlist.do">NOTICE</a></div>
<div><a href="">Q&A</a></div>
<div><a href="">REVIEW</a></div>
<div><a href="" target="_blank">DELIVERY</a></div>
</div>
</li>


<!-- //상단커뮤니티영역 -->


<!-- 상단마이페이지영역 -->

<li class="topbar_mypage"><a href="#">MYPAGE<img src="resources/img/add_icon.png"></a>
<div class="mypage_sub">
<div><a href="">ORDER</a></div>
<div><a href="">WISH LIST</a></div>
<div><a href="">POINT</a></div>
<div><a href="">COUPON</a></div>
<div><a href="">BOARD</a></div>
</div>
</li>

<!-- //상단마이페이지영역 -->

</ul>
</div> 


<!-- :::::::::::::::::::::::::::::::::::::: //상단왼쪽 :::::::::::::::::::::::::::::::::::::: -->


<!-- :::::::::::::::::::::::::::::::::::::: 상단오른쪽 :::::::::::::::::::::::::::::::::::::: -->

<div class="topbar_right">
<ul>
<!-- 로그인 상태가 아닐때 -->
<c:if test="${ empty sessionScope.loginUser }">
	<li><a href="loginView.me">LOGIN</a></li>
	<li><a href="enrollView.me">JOIN US</a>
	<!-- 회원가입 포인트 -->	
	</li>

	<li><a href="loginView.me">CART</a></li>

</c:if>

<!-- 로그인 상태 -->
<c:if test="${ !empty sessionScope.loginUser}">
	<c:choose >
		<c:when test="${ loginUser.userId == 'admin' }">
		<li><a href="myPageView.me"> <c:out value="${ loginUser.nickName }"/> 님 환영 합니다.</a></li>
		<li><a href="CartView.do">CART</a></li>
		<li><a href="">ORDER</a></li>
		<li><a href="logout.me">log out</a><li>
		<li><a href="goAdmin.Page">ad page</a></li>				
		</c:when>
		<c:otherwise>
		
		<li><a href="myPageView.me"> <c:out value="${ loginUser.nickName }"/> 님 환영 합니다.</a></li>
		<li><a href="CartView.do">CART</a></li>
		<li><a href="">ORDER</a></li>
		<li><a href="logout.me">log out</a><li>

		</c:otherwise>

	</c:choose>
</c:if>



</ul>
</div> <!-- .topbar_right -->


<!-- :::::::::::::::::::::::::::::::::::::: //상단오른쪽 :::::::::::::::::::::::::::::::::::::: -->


</div><!-- #wizsubmenu -->

</div> <!-- #topbar -->

<!-- ####################### //최상단메뉴END ####################### -->


<!-- ####################### 로고영역 ######################### -->

<div class="logoBox">
    <div class="logo">
        <h1><a href="main.do"><img src="resources/img/mainlogo.png"  alt="상단 로고" title="상단 로고" /></a></h1>
        <!-- 검색 폼 -->
        <div class="search">
    <form name="frmSearchTop" id="frmSearchTop" action="" method="get">
        <fieldset>
            <legend>검색폼</legend>
            <div>
                <input type="text" id="search-form" name="keyword" class="text" title="" placeholder="" autocomplete="off" />
                <input type="image" class="image" id="btnSearchTop" title="검색" value="검색" src="resources/img/Search.png"  width="28" height="30" alt="검색"/>
                
            </div>
        </fieldset>
    </form>
</div>
    </div>
</div>

<!-- ####################### 로고영역끝 ######################### -->

<!-- ####################### 상단메뉴영역 ######################### -->

<div class="topMenu ">
<div id="topside">
<div class="lnb">
    <!-- 사이드 카테고리 시작 -->
    <h2 class="dn">사이드 카테고리</h2>
    <ul class="category type-layer">
    
    <li>
        <a href="nlist.do">공지사항</a>
    </li>
    <li>
        <a href="listproduct.do">전체 상품</a>
        <ul class="sub_menu">
            <li  >
                <a href="listdo.do" >도시락</a>
            </li>
            <li  >
                <a href="listsal.do" >샐러드</a>
            </li>
        </ul>
   </li>
    <li  >
        <a onclick="myOwnClick();">나만의 도시락</a>
    </li>
    <li>
    	<a href="lbotmlist.do">도시락 자랑하기</a>
    </li>
   
   
   
</ul>
<hr/>
    <!-- 사이드 카테고리 끝 -->
</div>
</div>
	</div>
<!-- ####################### //상단메뉴영역끝 ######################### -->	


<hr/>
    </div>
    <script>
    	function myOwnClick(){
    		if(${sessionScope.loginUser eq null}){
    			alert("로그인 후 이용가능한 서비스 입니다.");
    		}else{
    			location.href="myOwn4.do";
    		}
    	}
    	
    	
    </script>
</body>
</html>