<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 시작 -->
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/admin/common.css">

<!-- css 끝 -->

<!-- js 시작 -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/admin/common.js"></script>

<!-- js 끝 -->

</head>
<body>
     <!-- header -->
<!-- nav 관리자 모 -->
<header class="top">
<!-- 가로 영역 -->
<div id="top_main">
	<div class="div1"><img src="resources/img/admin/admin-logo.png"  alt="상단 로고" title="상단 로고" /></div>

	<div class="div2">
		<span><a href="main.do"><img src="resources/img/admin/home.png" style="width:50px; height:29px;"></a></span>
		<span><img src="resources/img/admin/bell.png"></span>
	<div class="div3">
		<span><c:out value="${ loginUser.userId }"/></span><!-- 여기에 로그인 정보 넣기 -->
		<span class="logout"><img src="resources/img/admin/logout.png" style="width:30px; hegiht:29px"></span>
	</div>
	
	<div class="info">
		
	</div>
	
	</div>
</div>


</header>   
<!-- ###################### top 끝 ################### -->     

<!--$$$$$$$$$$$$$$$ 왼쪽 메뉴 $$$$$$$$$$$$$$$$$  -->            

	<nav class="mo_slide_menu">
    <h3 class="hidden">아코디언 메뉴</h3>
    <ul class="nh_accordion">
        <li class="accor_has_sub active">
            <strong class="menu_depth1">상품관리</strong>
            <ul class="acc_subject">
                <li><a href="productList.do" class="menu_depth2">상품 리스트</a></li>
                <li><a href="productsInsert.do" class="menu_depth2">상품등록</a></li>
                <li><a href="#" class="menu_depth2">상품후기</a></li>
                <li><a href="productInquiry.do" class="menu_depth2">상품문의</a></li>
            </ul>
        </li>
        <li class="accor_has_sub">
          <strong class="menu_depth1">주문/배송 관리</strong>
            <ul class="acc_subject">

             
                <li><a href="adminPaymentList.do" class="menu_depth2">주문통합 리스트</a></li>

                <li><a href="PayResultList.do" class="menu_depth2">결제완료 리스트</a></li>
                <li><a href="adminWarnning.do" class="menu_depth2">신고 리스트</a></li>
            </ul>
        </li>
        <li class="accor_has_sub">
          <strong class="menu_depth1">회원 관리</strong>
            <ul class="acc_subject">
                <li><a href="adminMemberList.do" class="menu_depth2">회원 리스트</a></li>
                <li><a href="adminBlack.do" class="menu_depth2">블랙 리스트</a></li>
                <li><a href="adminSecession2.do" class="menu_depth2">탈퇴회원 리스트</a></li>
                
            </ul>
        </li>
        <li class="accor_has_sub">
 		 <strong class="menu_depth1">상품 분류 관리</strong>            
            <ul class="acc_subject">
                <li><a href="#" class="menu_depth2">상품 그룹 관리</a></li>
                <li><a href="#" class="menu_depth2">카테고리 관리</a></li>
            </ul>
        </li>
         <li class="accor_has_sub">
 		 <strong class="menu_depth1">게시판 관리</strong>            
            <ul class="acc_subject">
                <li><a href="#" class="menu_depth2">게시판 리스트</a></li>
                <li><a href="#" class="menu_depth2">게시글 관리</a></li>
            </ul>
        </li>
         <li class="accor_has_sub">
          <strong class="menu_depth1">통계</strong>
            <ul class="acc_subject">
                <li><a href="#" class="menu_depth2">판매통계</a></li>
            </ul>
        </li>
         <li class="accor_has_sub">
          <strong class="menu_depth1">나만의 도시락</strong>
            <ul class="acc_subject">
                <li><a href="mydo.do" class="menu_depth2">도시락 관리</a></li>
                <li><a href="myIn" class="menu_depth2">재료 관리</a></li>
                <li><a href="IngredientsInsert.do" class="menu_depth2">재료 등록</a></li>
            </ul>
        </li>
        
        <li class="accor_has_sub">
          <strong class="menu_depth1">설정</strong>
            <ul class="acc_subject">
                <li><a href="#" class="menu_depth2">기본설정</a></li>
            </ul>
        </li>
    </ul>
</nav>
<!-- $$$$$$$$$$$$$$$$$$ 왼족 메뉴 끝 $$$$$$$$$$$$$$$$$$  -->




</body>

</html>