<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.junwo.ockdong.member.model.vo.Member"%>
<%
%>
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
					<div class='nth-child1'>회원아이디</div>
					<div class='nth-child2'>
						<input name="userId" class='info_input bg_f3f4f6'
							 type='text' value="${ loginUser.getUserId() }" readonly/>
					</div>
				</div>
				<div>
					<div class='nth-child1 '>비밀번호 입력</div>
					<div class='nth-child2'>
						<input name="userPwd" id="userPwd" class='info_input red_focus' type='password' maxlength="16" />
					</div>
				</div>
				<div>
					<div class='nth-child1 '>비밀번호 확인</div>
					<div class='nth-child2'>
						<input name="userPwd2" id="userPwd2" class='info_input red_focus'
							type='password' maxlength="16" />
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

		   if($('#userPwd').val()==""){
			    alert("비밀번호를 입력 해 주세요");
			    $('#userPwd').focus();
			    return;	
		   }else if($('#userPwd2').val() != $('#userPwd').val()){
			    alert("입력하신 비밀번호를 확인 해 주세요");
			    $('#userPwd2').focus();
			    return;
		   }else{
			   	var trueBye = confirm("정말 탈퇴하시겠습니까?");
			   
			    if(trueBye == true){
			   
			    $("#MemberOutForm").submit();
				  
			    }
		   }

		}

	</script>

</body>
</html>