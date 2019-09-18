<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.boayArea{
	text-align: center;
	padding-left: 150px;
	padding-right: 150px;
	width: auto;
	background: white;
	height: 600px;
	margin: 0 auto;
	margin-bottom: 300px;
}
</style>
</head>
<body>
	<c:import url="../../header/header.jsp"/>
	<div class="boayArea">
		<c:import url="../member/myPageLeft.jsp" />
		<c:import url="../updatePwd/updatePwdForm.jsp" />
	</div>
	<c:import url="../../footer/footer.jsp" />
</body>
</html>