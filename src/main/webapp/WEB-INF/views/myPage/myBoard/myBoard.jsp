<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<style>
	#tb{margin: auto; width: 900px; border-collapse: collapse;}
	#tb tr td{padding: 5px;}
	#buttonTab{border-left: hidden; border-right: hidden;}
</style>
</head>
<body>
	<h1 align="center">내가 쓴 게시글</h1>
	
	<h3 align="center">총 게시글 갯수 : ${ pi.listCount }</h3>
	
	<table border="1" id="tb" style="">
		<tr style="background: yellowgreen;">
			<th>번호</th>
			<th width="300">제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:if test="${ !empty list }">
		<c:forEach var="b" items="${ list }">
		<tr>
			<td align="center">${ b.nno }</td>
			<td align="center">${ b.ntitle }</td>
			<td align="center">${ b.id }</td>
			<td align="center">${ b.ndate }</td>
			<td align="center">${ b.ncount }</td>
		</tr>
		</c:forEach>
		</c:if>
		<tr>
		<c:if test="${ empty list }">
		
			<td colspan="5">게시글이 없습니다.</td>
		
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
					<c:url var="before" value="nlist.do">
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
						<c:url var="pagination" value="nlist.do">
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
					<c:url var="after" value="nlist.do">
						<c:param name="page" value="${pi.currentPage + 1 }"/>
					</c:url>
					<a href="${after }">[다음]</a>
				</c:if>
			
			</td>
		</tr>
	</table>
</body>
</html>