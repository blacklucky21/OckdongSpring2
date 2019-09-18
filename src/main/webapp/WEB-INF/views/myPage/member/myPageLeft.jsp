<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/myPage/buyLeft.css">
</head>
<body>
	<div class="leftWrapArea">
		<h2>마이페이지</h2>

		<div class="myMenu_left">

			<br> <br>
			<div class="text" onclick="location.href='myPageView.me'">회원정보</div>
			<br>
			<div class="text" onclick="location.href='view_history.me'">구매내역</div>
			<br>
			<div class="text" onclick="location.href='reviewServletView.bo'">내가 쓴 게시물</div>
			<br>
			<div class="text" onclick="location.href='reviewListView.bo'">상품 문의</div>
			<br>
			<div class="text" onclick="location.href='myOwnList.me'">나만의 도시락</div>
			<br>
			<div class="text" onclick="location.href='updatePwd_myPage.me'">비밀번호 변경</div>
			<br>
			<div class="text" onclick="location.href='memberOutView.me'">회원 탈퇴</div>

			<br> <br> <br> <br>

			<div class='sub_text last-child'>
				<div class='first-child'>
					<div class='first-child text-bold'>고객센터</div>
					<div>
						<span class='sub_span'>평일</span> : AM 09:30 - PM 06:00
					</div>
					<div class='text-red'>일요일, 공휴일 휴무</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>