<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/myPage/myPageInfo.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>
</head>
<body>
		<form id="updatePwdForm" action="updatePwd.me" method="post" onsubmit="return validate()">
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
							</td>
							<td></td>
						</tr>
						<tr>
							<th class="ta-l required" aria-required="true">현재 비밀번호</th>
							<td>
								<div class="txt-field hs" style="width: 350px;">
									<input name="password" id="password" class='text' type='password' maxlength="16" placeholder="비밀번호를 입력해 주세요.">
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th class="ta-l required" aria-required="true">새 비밀번호</th>
							<td>
								<div class="txt-field hs" style="width: 350px;">
									<input name="newPwd1" id="newPwd1" class='text' type='password' maxlength="16" placeholder="비밀번호를 입력해 주세요.">
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th class="ta-l required" aria-required="true">새 비밀번호 확인</th>
							<td>
								<div class="txt-field hs" style="width: 350px;">
									<input name="newPwd2" id="newPwd2" class='text' type='password' maxlength="16" placeholder="비밀번호를 입력해 주세요.">
								</div>
							</td>
							<td></td>
						</tr>
						
					</tbody>
			
				
				</table>
				<br><br>
				<div style="text-align:center">
					<div>
						<span><button id="bu" class='bu' onclick="return updatePwd();" style="width: auto;">변경하기</button></span>
					</div>
				</div>
			</div>
	</form>
	<script>
		function updatePwd(){
			var newPwd1 = $('input[name=newPwd1]').val();
			var newPwd2 = $('input[name=newPwd2]').val();
			
			if(newPwd1 == newPwd2){
				return true;
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		}

	</script>
</body>
</html>