<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" id="tb" style="width: auto;" class="table table-hover">
		<thead>
		<tr style="background-color: black; color: white;">
			<th>번호</th>
			<th nowrap>제목</th>
			<th nowrap>작성자</th>
			<th nowrap>날짜</th>
			<th style="width: 100px;" nowrap>내용</th>
			<th nowrap>닉네임</th>
		</tr>
		</thead>
		<c:if test="${ !empty list }">	
		<tbody>
		<tr>
			<td nowrap align="center">${ list.bNo }</td>
			<td nowrap align="center">${ list.userId }</td>
			<td nowrap align="center">${ list.b_Createdate }</td>
			<td nowrap align="center">${ list.b_Count }</td>
			<td nowrap align="center">${ list.b_Nickname }</td>
		</tr>
		</tbody>		
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
	</table>
</body>
</html>