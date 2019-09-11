<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.junwo.ockdong.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/myPage/myPageInfo.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>
<!-- <link rel="stylesheet" href="resources/css/myPage/memberOut.css"> -->
</head>
<body>
	<form id="MemberOutForm" action="memberOutView.me" method="post">
		<span class="join-form">
		<fieldset id="fds-order-info">
			<legend></legend>
			<h3>회원 탈퇴</h3>
			<div class="table1 orderplz">
				<table>
					<colgroup>
						<col style="width: 133px;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th class="ta-l required" aria-required="true">ID</th>
							<td>
								<div class="txt-field-id hs" style="width: 350px;">
									<input type="text" name="userId" value="${ loginUser.getUserId() }" class="text" readonly>
								</div>
								<td></td>
							</td>
						</tr>
						<tr>
							<th class="ta-l required" aria-required="true">비밀번호</th>
							<td>
								<div class="txt-field hs" style="width: 350px;">
									<input name="password" id="password" class='text' type='password' maxlength="16" placeholder="비밀번호를 입력해 주세요.">
								</div>
								<td></td>
							</td>
						</tr>
						<tr>
							<th class="ta-l required" aria-required="true">비밀번호 확인</th>
							<td>
								<div class="txt-field hs" style="width: 350px;">
									<input name="password2" id="password2" class='text' type='password' maxlength="16" placeholder="비밀번호를 입력해 주세요.">
								</div>
								<td></td>
							</td>
						</tr>
						
					</tbody>
			
				
				</table>
				<br><br>
				<div style="text-align:center">
					<div>
						<span><button id="bu" class='bu' onclick="ByeBye();" style="width: auto;">탈퇴하기</button></span>
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