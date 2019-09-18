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
			<td align="center">${ b.nwrite }</td>
			<td align="center">${ b.ndate }</td>
			<td align="center">${ b.ncount }</td>
		</tr>
		</c:forEach>
		</c:if>
		<c:if test="${ empty list }">
		<tr>
			<td colspan="5">게시글이 없습니다.</td>
		</tr>
		</c:if>
	</table>
</body>
</html>



