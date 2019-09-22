<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/member/findPass.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<br><br><br>
	
	
	
	<div class="loginForm">
	<a href="main.do"><img class="image" src="resources/img/mainlogo.png" id="logo" align="center"></a>
	<form id="passFindForm" action="passFindResult.me" method="post">
	<table align="center" class="findd">
		<tr>
			<td colspan="3">
			<input type="text" id="userId" name="userId" class="form-control" placeholder="아이디를 입력해주세요" style="font-size:13px;">
			</td>
			<td rowspan="2">
			<input type="button" id="bu" class="bu" name="bu" style="padding:0px" value="확인">
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<input type="text" id="email" name="email" class="form-control" placeholder="회원정보에 등록된 이메일을 입력해주세요" style="font-size:13px;">
			</td>
		</tr>
		<tr>
			<td>　</td>
			<td>　</td>
		</tr>
		<tr class="find">
			<td colspan="4">
				<a href="idFind.me" >아이디 찾기 │</a>
				<a href="passFind.me" style="color:black">비밀번호 찾기 │</a>
				<a href="enrollView.me">회원가입 │</a>
				<a href="loginView.me">로그인</a>
			</td>
		</tr>
	</table>
	</form>
	</div>
	<br><br><br><br>
	<script>
		$(function() {
			$('#bu').click(function() {
				var userId = $("#userId").val();
				var email = $("#email").val();
				
				$.ajax({
					url: "passFindResult.me",
		              data: {userId : userId, email : email},
		              type: "POST",
		              success: function(data){
		                 if(data != null){
		                	 location.href = 'findPassBefore.me';
		                 } else{
		                    alert("실패!");
		                 }
		              }, error : function(jqxhr, textStatus, errorThrown){
		                 console.log("메일 전송 실패");
		                 console.log(jqxhr);
		                 console.log(textStatus);
		                 console.log(errorThrown);
		              }
				});
			})
		})
	</script>
</body>
</html>