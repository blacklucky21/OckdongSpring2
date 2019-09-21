<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.bodyArea {
	text-align: center;
	padding-left: 50px;
	padding-right: 50px;
	width: auto;
	background: white;
	height: 600px;
	margin: 0 auto;
	margin-bottom: 300px;
	
}
#gwangseong{
		visibility: hidden;
}
</style>
</head>
<body>
	<c:import url="../../header/header.jsp" />
	<div class="bodyArea">
		<c:import url="../buy/left.jsp" />
		<c:import url="../buy/center.jsp" />
	</div>
	<br>
	<c:import url="../../footer/footer.jsp" />
</body>
</html>