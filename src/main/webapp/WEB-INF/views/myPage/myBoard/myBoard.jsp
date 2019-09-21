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
	<h1 align="center">내가 쓴 게시글</h1>
	
	<h3 align="center">총 게시글 갯수 : ${ pi.listCount }</h3>
	
	<table border="1" id="tb" style="width: auto;" class="table table-hover">
		<thead>
		<tr style="background-color: black; color: white;">
			<th>번호</th>
			<th width="300">제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<thead>
		<c:if test="${ !empty list }">
		<c:forEach var="b" items="${ list }">
		<tr>
			<td align="center">
				<a href="#" style="text-decoration: none;" class="myBoardDetailView" id="${ b.bNo }">${ b.bNo }</a>
			</td>
			<td align="center">${ b.b_Title }</td>
			<td align="center">${ b.userId }</td>
			<td align="center">${ b.b_Createdate }</td>
			<td align="center">${ b.b_Count }</td>
		</tr>
		</c:forEach>
		</c:if>
		<tbody>
		<tr>
		<c:if test="${ empty list }">
		
			<td colspan="5">게시글이 없습니다.</td>
		
		</c:if>
		</tr>
		</tbody>
		
		<!-- 페이징 처리 -->
		<tr align="center" height="20" id="buttonTab">
			<td colspan="5">
			
				<!-- 이전 -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="reviewServletView.bo">
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
						<c:url var="pagination" value="reviewServletView.bo">
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
					<c:url var="after" value="reviewServletView.bo">
						<c:param name="page" value="${pi.currentPage + 1 }"/>
					</c:url>
					<a href="${after }">[다음]</a>
				</c:if>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		$(".myBoardDetailView").click(function() {
			var bNo = $(this).attr("id");			
			/* window.open("myBoardDetailView.me?bNo="+bNo,"Gooooood","width=1900, height=300"); */			
			location.href="lbotmdetail.do?bNo="+bNo;
		})
	</script>
</body>
</html>