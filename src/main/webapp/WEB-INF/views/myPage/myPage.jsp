<%@page import="com.junwo.ockdong.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	Member m = (Member) request.getSession().getAttribute("loginUser");
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myPageCheck</title>
<script type="text/javascript" src="/resource/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="/resource/css/mypage_css/myPageCheck.css">
<link rel="stylesheet" href="/resource/css/mypage_css/mypage.css">
<script>
$(function(){
	if('<%=msg%>' != 'null'){
		alert('<%=msg%>');
	}
});
</script>
</head>
<body>
	<!-- header부분 입니다. -->
	<c:import url="../header/header.jsp"/>
	<br clear="all">

	



	<!-- footer부분입니다. -->
	<c:import url="../footer/footer.jsp"/>



</body>
</html>