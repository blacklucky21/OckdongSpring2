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
	width: 1000px;
	background: white;
	height: 1000px;
	margin: 0 auto;
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
		<c:import url="../myBoard/myBoard.jsp" />
	</div>
	<c:import url="../../footer/footer.jsp" />
</body>
</html>