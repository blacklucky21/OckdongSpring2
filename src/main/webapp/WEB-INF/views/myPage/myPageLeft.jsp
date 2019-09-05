<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/myPage/myPageLeft.css">
<title>myPage</title>
</head>
<body>
	<div class="leftWrapArea">
		<h2>마이페이지</h2>

		<div class="myMenu_left">

			<br> <br>
			<div class="text" onclick="location.href='views/mypage/member/myPage.jsp'">회원정보</div>
			<br>
			<div class="text"
				onclick="location.href='<%= request.getContextPath() %>/view_history'">구매내역</div>
			<br>
			<div class="text" onclick="location.href='<%=request.getContextPath()%>/SelectCartList.swy'">장바구니</div>
			<br>
			<div class="text"
				onclick="location.href='<%=request.getContextPath()%>/ReviewServlet'">내가 쓴 게시물</div>
			<br>
			<div class="text" onclick="location.href='<%=request.getContextPath() %>/views/mypage/member/myPage2.jsp'">회원 탈퇴</div>
				
				<br>
				<br>

			<div class='sub_text last-child'>
				<div class='first-child'>
					<div class='first-child text-bold'>고객센터</div>
					<div>
						<span class='sub_span'>평일</span> : AM 09:30 - PM 06:00
					</div>
					<div>
						토요일 : <span class='text-red'>휴무</span>
					</div>
					<div class='text-red'>일요일, 공휴일 휴무</div>
				</div>
			</div>





		</div>
	</div>
</body>
</html>