<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.leftWrapArea{
	height: 100% !important;
}
.bodyArea {
	width: 1300px;
	background: white;
	height: 1300px;
	margin: 0 auto;
	margin-top: 5%;
}

.imgOne {
	width: 280px;
	height: 200px;
}

	border-radius: 15px;
	margin: 10px;
	text-align: center;
	/* 	border-top: 5px solid #13ae67;
	border-left: 5px solid #13ae67; */
}

.recipeAll {
	margin-left: 5%;
	width: 1000px;
}

.recipeDetail {
	margin-left: 15px;
	text-align: left;
}

.recipeTitle {
	font-size: 20px;
	font-weight: bold;
}

.recipeType {
	color: #303030;
}

.recipePrice {
	color: #ff8d00 !important;
}

.recipeOne:hover {
	/* 	border-bottom: 5px solid #13ae67;
	border-right: 5px solid #13ae67;
	transition:border-bottom 0.2s, border-right 0.2s; */
	cursor: pointer;
	border: 5px solid #13ae67;
}

.pagi {
	list-style:none;
	float:left;
	display:inline-block;
}
.pagi li {
	float:left;
}
.pagi li a {
	float:left;
	padding:4px;
	margin-right:3px;
	width:25px;
	color:#000;
	font:bold 12px tahoma;
	border:1px solid #eee;
	text-align:center;
	text-decoration:none;
}
.pagi li a:hover, .pagi li a:focus {
	color:#fff;
	border:1px solid #f40;
	background-color:#f40;
}
.unClick:hover, .unClick:focus{
	cursor: default !important;
	color: black !important;
	border:1px solid #eee !important;
	background-color: white !important;
}
.paging{
	width: 100%;
    text-align: center;
}
</style>
</head>
<body>
	<c:import url="../header/header.jsp" />
	<div class="bodyArea">
		<c:import url="../myPage/member/myPageLeft.jsp" />
		<div class="recipeAll" style="display:inline-block; float:left;">
			<c:if test="${!empty rList}">
				<div style="text-align:left;">
					<a>전체 (${listCount}개)</a>
				</div>
			</c:if>
			<c:if test="${empty rList}">
				회원님이 등록한 나만의 레시피가 없습니다.
			</c:if>
			<c:if test="${!empty rList }">
				<c:forEach items="${rList }" var="r" varStatus="sts">
					<div class="recipeOne">
						<div class="${r.mblId }">
							<img class="imgOne" src="resources/img/Recipe/${r.mblFileName }"><br>
							<div class="recipeDetail">
								<a class="recipeTitle">${r.mblTitle }</a><a class="recipeType"> (${r.mblType })</a><br>
								<c:if test="${r.mblType eq '4찬'}">
									<a class="recipePrice">4000원</a>
								</c:if>
								<c:if test="${r.mblType eq '5찬'}">
									<a class="recipePrice">5000원</a>
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<div class="paging">
			<div style="display: inline-block;">
				<ul class="pagi">
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="myOwnList.me">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<li><a href="${ before }"><</a></li>
					</c:if>
					<c:if test="${ pi.currentPage <= 1 }">
						<li><a class="unClick" href="#"><</a></li>
					</c:if>
				   	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq currentPage }">
							<li><a href="#">${ p }</a></li>
						</c:if>
						
						<c:if test="${ p ne currentPage }">
							<c:url var="pagination" value="myOwnList.me">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<li><a href="${ pagination }">${ p }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<li><a class="unClick" href="#">></a></li>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="myOwnList.me">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<li><a href="${ after }">></a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<c:import url="../footer/footer.jsp" />
	<script>
		$(function(){
			$(".recipeOne").click(function(){
				
				var mblId = $(this).children('div').attr('class');
				
				location.href="recipeDetailOne.me?mblId="+mblId;
			});
		});
		$('.unClick').click(function (e) {
			e.preventDefault();
		});
	</script>
</body>
</html>