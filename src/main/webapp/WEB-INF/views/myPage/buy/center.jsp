<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
	#tb{margin: auto; width: auto; border-collapse: collapse;}
	#tb th, #tb td{ vertical-align: middle;} 
	/* #tb tr td{width: auto; overflow: hidden;} */
	
	#tb thead tr th{width: 100px;}
	/* #tb tbody tr td{width: 100px;} */
	#buttonTab{border-left: hidden; border-right: hidden;}
</style>
</head>
<body>
	<h1 align="center">구매 내역</h1>
	
	<br>
	
	<table border="1" id="tb" style="width: auto;" class="table table-hover">
		<thead>
		<tr style="background-color: black; color: white;">
			<th>주문번호</th>
			<th style="width: 70px;">주문상태</th> 
			<th>상품명</th>
			<th>배달주소</th>			
			<th>결제금액</th>
			<th>배송날짜</th>
		</tr>
		</thead>
		<c:if test="${ !empty list }">
		<c:forEach var="buy" items="${ list }">
		<tbody>
		<tr>
			<td align="center">
				<a href="#" style="text-decoration: none;" class="buyDetailView" id="${ buy.p_id }">${ buy.p_id }</a>
			</td>
			<%-- <td align="center">${ buy.p_id }</td> --%>
			<%-- <td style="cursor: pointer" class="search" id="searchId">
				<a href="#" class="modalm" data-id="${ buy.p_id }" data-toggle="modal" data-target="#myModal">${ buy.p_id }</a>
			</td> --%>
			<c:if test="${buy.pstatus eq 'Y' }">
				<td>상품준비중</td> 
			</c:if>
			<c:if test="${buy.pstatus eq 'R' }">
				<td>배송중</td> 
			</c:if>
			<c:if test="${buy.pstatus eq 'E' }">
				<td>배송완료</td> 
			</c:if>
			<td align="center">${ buy.paytext }</td>
			<td align="center">${ buy.payaddress }</td>			
			<td align="center">${ buy.payprice }</td>
			<td align="center">${ buy.delivaryDate }</td>
		</tr>
		</tbody>
		</c:forEach>
		</c:if>
		<tr>
		<c:if test="${ empty list }">
		<tbody>
			<tr>
			<td colspan="6">구매내역이 없습니다.</td>
			</tr>
		</tbody>
		</c:if>
		</tr>
		
		<!-- 페이징 처리 -->
		<tr align="center" height="20" id="buttonTab">
			<td colspan="6">
			
				<!-- 이전 -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="view_history.me">
						<c:param name="page" value="${pi.currentPage - 1 }"/>
					</c:url>
					<a href="${before }">[이전]</a> &nbsp;
				</c:if>
				
				<!-- Page -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:if test="${ p eq currentPage }">
						<font color="red" size="4"><b>[${p }]</b></font>
					</c:if>
					<c:if test="${ p ne currentPage }">
						<c:url var="pagination" value="view_history.me">
							<c:param name="page" value="${p}"/>
						</c:url>
						<a href="${pagination }">${p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- 다음 -->
				<c:if test="${ pi.currentPage >=  pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="view_history.me">
						<c:param name="page" value="${pi.currentPage + 1 }"/>
					</c:url>
					<a href="${after }">[다음]</a>
				</c:if>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		$(".buyDetailView").click(function() {
			var p_id = $(this).attr("id");			
			window.open("buyDetail.me?p_id="+p_id,"Gooooood","width=1900, height=300");			
		})
	</script>
</body>
</html>