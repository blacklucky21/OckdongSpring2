<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css 시작 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<!-- css 끝 -->

<!-- js 시작 -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="resources/css/product/productList.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- js 끝 -->
</head>
<body>
<!-- ############### 헤더 부분 ############### -->
	<c:import url="../../header/header.jsp" /> 
	<div class="main">
  		<div class="warp">
  			<div class="element-exhibition type3" style="left: 0%;top: 0%;width: 100%;height: 100%; z-index: 100;">
				<ul id="productList_1">
					<c:forEach var="p" items="${ list }">
					<!-- 여기서 리스트 뽑아 온다.  -->
					<li class="products">
					<input type="hidden" value="${ p.P_ID }"> 
						<div class="p1">
							<img src="resources/img/products/${ p.PT_NAME }" style="width:560px; height: 540px;" onclick="detailform(${p.P_ID});">
							<div class="exhibition_vis">
								<!-- 조건 판매 상태가 만약 판매 중지 이면 나오게 한다. -->
								<c:if test="${p.P_SELL eq 'N'}">
								<div class="exhibition_vis_line">
									<img src="resources/img/stop.png" alt="" class="i_p"
										style="width: 84px; height: 30px;" >
								</div>
								</c:if>
								
								
							</div>
							</div>


							<div class="exhibition_infor">
								<p class="exhibition_tit" onclick="detailform(${p.P_ID});">${ p.P_NAME }</p>
								<p class="exhibition_price">
									<strong>${p.P_PRICE } 원</strong>
								</p>
							</div>
					</li>
					</c:forEach>
				</ul>
			</div>
  		</div>
  		<!-- 페이징 처리  -->
		<div class="w3-container" id="buttonTab">
			<div class="w3-bar"	style="text-align: center; text-decoration:none; margin-bottom:30px">
			
				 <!-- «이전  -->
				 <c:if test="${ pi.currentPage <= 1 }">
 				 	«이전 &nbsp;
				 </c:if>
				 <c:if test="${ pi.currentPage > 1 }">
				 	<c:url var="before" value="nlist.do">
				 		<c:param name="page" value="${ pi.currentPage - 1 }"/>
				 	</c:url>				 
  				 <a href="${ before }" class="w3-button">«이전</a> &nbsp;
				 </c:if>
				 
				 <!-- 페이지 -->
				 <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				 	<c:if test="${ p eq cureentPage }">
				 		<font color="red" size="4"><a class="w3-button">${ p }</a></font>
				 	</c:if>
				 	
				 	<c:if test="${ p ne currentPage }">
				 		<c:url var="pagination" value="listproduct.do">
				 			<c:param name="page" value="${ p }"/>
				 		</c:url>
				 		<a href="${ pagination }" class="w3-button">${ p }</a> &nbsp;
				 	</c:if>
				 </c:forEach>
				 
				 <!-- 다음» -->
				 <c:if test="${ pi.currentPage >= pi.maxPage }">
				 	&nbsp; 다음»
				 </c:if>
				 <c:if test="${ pi.currentPage < pi.maxPage }">
				 	<c:url var="after" value="nlist.do">
				 		<c:param name="page" value="${ pi.currentPage + 1 }"/>
				 	</c:url>
				 	<a href="${ after }" class="w3-button">다음»</a>
				 </c:if>
			</div>
		</div>
  		<!-- 페이징 끝 -->
  		
  		
	</div>
	<!-- ##################### 풋터 부분 ##################### -->
	 <c:import url="../../footer/footer.jsp" /> 
	  <script>
	// 상세 페이지로 넘어가기
	 function detailform(p_Id){
	 	location.href="productDetail.do?p_Id="+p_Id;
	 }
	 </script>
</body>
</html>