<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.junwo.ockdong.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>
<link rel="stylesheet" href="resources/css/myPage/memberOut.css">
</head>
<body>
	<form id="MemberOutForm" action="MemberOut.me" method="post">
	<div class="centerWrapArea">
		<div class="section">
			<div class='figure'>
				<div class="center_top_title" align="left">회원 탈퇴</div>
				<div>
					<div class='nth-child1'>
						회원아이디<br>
						<span>'${loginUser.getUserId() }'</span>
					</div>
					<div class='nth-child2'>
						<c:url var="mdelete" value="mdelete.me">
							<c:param name = "userId" value="${ loginUser.getUserId() }"/>
						</c:url>
					</div>
				</div>
				<div>
					<div class='nth-child1 '>비밀번호 입력</div>
					<div class='nth-child2'>
						<input name="password" id="password" class='info_input red_focus' type='password' maxlength="16" />
					</div>
				</div>
				<div>
					<div class='nth-child1 '>비밀번호 확인</div>
					<div class='nth-child2'>
						<input name="password2" id="password2" class='info_input red_focus' type='password' maxlength="16" />
					</div>
				</div>
			</div>
				<br><br>
				<div class='btn_box'>
					<span class='btn_140_bg_red' onclick="ByeBye();">탈퇴</span>
				</div>
			</div>
		</div>
	</form>
	<script>
		function ByeBye(){

		   if($('#password').val()==""){
			    alert("비밀번호를 입력 해 주세요");
			    $('#password').focus();
			    return;	
		   }else if($('#password2').val() != $('#password').val()){
			    alert("입력하신 비밀번호를 확인 해 주세요");
			    $('#password2').focus();
			    return;
		   }else{
			   	var trueBye = confirm("정말 탈퇴하시겠습니까?");
			   
			    if(trueBye == true){
			    	location.href="${ mdelete }"
			    }
		   }

		}

	</script>

</body>
</html>