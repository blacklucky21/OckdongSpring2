<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.bodyArea {
		text-align:center;
		width:1000px;
		background:white;
		height:1000px;
		margin:0 auto;
	}
</style>
</head>
<body>

<c:import url="../views/header/header.jsp"/>
<div class="bodyArea">
<c:import url="../views/myPage/myPageLeft.jsp"/>
<c:import url="../views/myPage/myPageInfo.jsp"/>
</div>
<c:import url="../views/footer/footer.jsp"/>
	


<style>
.bodyArea {
	text-align: center;
	width: 1000px;
	background: white;
	height: 1000px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<c:import url="../views/header/header.jsp" />
	<div class="bodyArea">
		<c:import url="../views/myPage/myPageLeft.jsp" />
		<c:import url="../views/myPage/myPageInfo.jsp" />
	</div>
	<c:import url="../views/footer/footer.jsp" />
</body>
</html>