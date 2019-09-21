<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역 상세보기</title>
</head>
<body>
	<table border="1" id="tb" style="width: auto;" class="table table-hover">
		<thead>
		<tr style="background-color: black; color: white;">
			<th>주문번호</th>
			<th nowrap>주문자 아이디</th>
			<th nowrap>주문자명</th>
			<th nowrap>주문자 전화번호</th>
			<th style="width: 100px;" nowrap>주문상태</th>
			<th nowrap>상품명</th>
			<th nowrap>상품번호</th>
			
			<th nowrap>배달주소</th>
			<th nowrap>결제금액</th>
			<th nowrap>기사에게 남길말</th>
			<th nowrap>결제시간</th>
			<th nowrap>배송날짜</th>
		</tr>
		</thead>
		<c:if test="${ !empty list }">	
		<tbody>
		<tr>
			<td nowrap align="center">${ list.p_id }</td>
			<td nowrap align="center">${ list.userid }</td>
			<td nowrap align="center">${ list.payname }</td>
			<td nowrap align="center">${ list.payphone }</td>
			
			<c:if test="${list.pstatus eq 'Y' }">
				<td align="center">상품준비중</td> 
			</c:if>
			<c:if test="${list.pstatus eq 'R' }">
				<td align="center">배송중</td> 
			</c:if>
			<c:if test="${list.pstatus eq 'E' }">
				<td align="center">배송완료</td> 
			</c:if>			
			
			<td nowrap align="center">${list.paytext }</td>
			<td nowrap align="center">${list.p_num }</td>
			<td nowrap align="center">${list.payaddress }</td>
			<td nowrap align="center">${list.payprice }</td>
			<td nowrap align="center">${list.orderMemo }</td>
			<td nowrap align="center">${list.paydate }</td>
			<td nowrap align="center">${list.delivaryDate }</td>
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