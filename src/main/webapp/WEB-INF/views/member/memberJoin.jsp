<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/member/memberJoin.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style type="text/css">
	span.guide{display: none; font-size: 12px; top: 12px; right: 10px;}
	span.guideNick{display: none; font-size: 12px; top: 12px; right: 10px;}
	span.ok{color: green}
	span.error{color: red;}
	span.nickOk{color: green}
	span.nickError{color: red;}
</style>
<title>Join</title>
</head>
<body>
	<c:import url="../header/header.jsp" />
	<br>
	<br>
	<br>
	<div class="loginForm">
		<!-- <a href="main.do"><img class="image"
			src="resources/img/mainlogo.png" id="logo" align="center"></a> -->
		<form id="joinForm" name="joinForm" action="memberJoin.me" method="post" onsubmit="return validate();">
			<span class="join-form">
				<fieldset id="fds-order-info">
					<legend></legend>
					<h3 align="center" style="font-size: 35px;">회원 가입</h3>
					<div class="table1 orderplz">
						<table>
							<colgroup>
								<col >
								<col>
							</colgroup>
							<tbody>
							
								<tr>
									<th class="ta-l required" aria-required="true">ID</th>
									<td>
										<div class="txt-field-id hs" style="width: 200px;">
											<input type="text" name="userId" id="userId" class="text" placeholder="띄어쓰기 없이  6-12자">
										</div>
									</td>
									<!-- ajax -->
									<td width="270px" style="padding-left: 10px">
										<div class="txt-field-id hs" style="width: 200px;">
											<span class="guide ok">이 아이디는 사용 가능합니다.</span>
											<span class="guide error">이 아이디는 사용 불가능합니다.</span>
												<input type="hidden" name="idDuplicateCheck" id="idDuplicateCheck" value="0">
										</div>
									</td>
								</tr>
								<tr>
									<th height="40px">비밀번호</th>
									<td>
										<div class="txt-field-id hs" style="width: 200px;">
											<input type="password" maxlength="13" id="password" name="password" class="text" placeholder="영문+숫자  조합으로 6-12자 ">
										</div>
									</td>
									<td></td>
								</tr>
								<tr>
									<th height="40px">비밀번호 확인</th>
									<td>
										<div class="txt-field-id hs" style="width: 200px;">
											<input type="password" maxlength="13" id="password2" name="password2" class="text">
										</div>
									</td>
									<td></td>
								</tr>
								<tr>
									<th width="120px" height="40px" float="left">이름</th>
									<td>
										<div class="txt-field-id hs" style="width: 200px;">
											<input type="text" maxlength="13" name="userName" id="userName" class="text">
										</div>
									</td>
									<td></td>
								</tr>
								<tr>
									<th width="120px" height="40px" float="left">닉네임</th>
									<td>
										<div class="txt-field-id hs" style="width: 200px;">
											<input type="text" maxlength="13" name="nickName" id="nickName" class="text">
										</div>
									</td>
									<!-- ajax -->
									<td width="150px" style="padding-left: 10px">
										<span class="guideNick nickOk">이 닉네임은 사용 가능합니다.</span>
										<span class="guideNick nickError">이 닉네임은 사용 불가능합니다.</span>
										<input type="hidden" name="nickDuplicateCheck" id="nickDuplicateCheck" value="0">
									</td>
								</tr>
								<tr>
									<th height="40px">휴대폰 번호</th>
									<td>
										<div class="txt-field-id hs" style="width: 200px;">
											<input type="text" id="phone" name="phone" style="width: 200px" class="text">
										</div>
									</td>
									<td></td>
								</tr>
								<tr>
									<th height="40px">이메일</th>
									<td>
										<div class="txt-field-id hs" style="width: 200px;">
											<input type="email" id="email" name="email" class="text" placeholder="example@naver.com">
										</div>
									</td>
									<td width="270px" style="padding-left: 10px"><span id="validEmail"></span></td>
								</tr>
								<tr>
									<th height="40px">우편번호</th>
									<td>
										<div class="txt-field-id hs" style="width: 200px;">
											<input type="text" name="post" id="post" class="text">
										</div>
									</td>
									<td style="padding-left: 10px">
										<div id="ckZip" style="display: table-cell; vertical-align: middle;" onclick="searchAdd()">
											<input type="button" class="bu" value="검색" />
										</div>
									</td>
								</tr>
								<tr>
									<th height="40px">주소</th>
									<td>
										<div class="txt-field-id hs" style="width: 200px;">
											<input type="text" name="address2" id="address2" class="text">
										</div>
									</td>
									<td></td>
								</tr>
								<tr>
									<th height="40px">주소</th>
									<td>
										<div class="txt-field-id hs" style="width: 200px;">
											<input type="text" name="address3" id="address3" class="text">
										</div>
									</td>
									<td></td>
								</tr>
								<tr>
									<th height="40px">상세주소</th>
									<td>
										<div class="txt-field-id hs" style="width: 200px;">
											<input type="text" name="address4" id="address4" class="text">
										</div>
									</td>
									<td></td>
								</tr>
							</tbody>
						</table>
						</div>
						<br>
						<div class="btns" align="center">
							<div id="goMain">
								<button onclick="goMain()" class="bu">메인으로</button>
								<button type="submit" onclick="return insertMember();" class="bu">가입하기</button>
							</div>
						</div>
						<script type="text/javascript">
							$(function() {
								$('#userId').on("keyup", function() {
									var userId = $(this).val().trim();
									if(userId.length < 2){
										$(".guide").hide();
										$("#idDuplicateCheck").val(0);
										
										return;
									}
									$.ajax({
										url: "dupid.do",
										data: {userId: userId},
										success: function(data) {
											console.log(123);
											console.log(data);
											if(data == 'true'){
												$(".guide.ok").show();
												$(".guide.error").hide();																				
												$("#idDuplicateCheck").val(1);																	
											}else {
												$(".guide.ok").hide();
												$(".guide.error").show();																				
												$("#idDuplicateCheck").val(0);
											}
										},
										error: function(jqxhr, textStatus, errorThrown) {
											console.log("AjaxError");
											console.log(jqxhr);
											console.log(textStatus);
											console.log(errorThrown);
										}
									});
								});
							});
						</script>
						<script type="text/javascript">
							$(function() {
								$('#nickName').on("keyup", function() {
									var nickName = $(this).val().trim();
									if(nickName.length < 2){
										$(".guideNick").hide();
										$("#nickDuplicateCheck").val(0);
										
										return;
									}
									$.ajax({
										url: "dupnick.do",
										data: {nickName: nickName},
										success: function(data) {
											if(data == 'true'){
												$(".guideNick.nickOk").show();
												$(".guideNick.nickError").hide();																				
												$("#nickDuplicateCheck").val(1);																	
											}else {
												$(".guideNick.nickOk").hide();
												$(".guideNick.nickError").show();																				
												$("#nickDuplicateCheck").val(0);
											}
										},
										error: function(jqxhr, textStatus, errorThrown) {
											console.log("AjaxError");
											console.log(jqxhr);
											console.log(textStatus);
											console.log(errorThrown);
										}
									});
								});
							});
						</script>
						<script>
			            function goMain(){
			               location.href="main.do";
			            }
			            
			            function searchAdd() {
			                    new daum.Postcode({
			                        oncomplete: function(data) {
			                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			                            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                            var addr = ''; // 주소 변수
			                            var extraAddr = ''; // 참고항목 변수
			            
			                            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                                addr = data.roadAddress;
			                            } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                                addr = data.jibunAddress;
			                            }
			            
			                            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                            if(data.userSelectedType === 'R'){
			                                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                                    extraAddr += data.bname;
			                                }
			                                // 건물명이 있고, 공동주택일 경우 추가한다.
			                                if(data.buildingName !== '' && data.apartment === 'Y'){
			                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                                }
			                                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                                if(extraAddr !== ''){
			                                    extraAddr = ' (' + extraAddr + ')';
			                                }
			                                // 조합된 참고항목을 해당 필드에 넣는다.
			                                document.getElementById("address3").value = extraAddr;
			                            
			                            } else {
			                                document.getElementById("address3").value = '';
			                            }
			                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                              document.getElementById('post').value = data.zonecode;
			                              document.getElementById("address2").value = addr;
			                            // 커서를 상세주소 필드로 이동한다.
			                             document.getElementById("address4").focus();
			                        }
			                    }).open();
			                }
			            
			            var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			    		var regPhone = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
			    		var regPwd = /^(?=.*[a-zA-Z]+)(?=.*[0-9]+).{6,12}$/;
			            
			            function insertMember() {
			            	
			            	if($('#idDuplicateCheck').val(0) == 0){
								alert("사용 가능한 아이디를 입력해 주세요");
								$("#userId").focus();
								return false;
							}else if ($('#nickDuplicateCheck').val(0) == 0) {
								alert("사용 가능한 닉네임를 입력해 주세요");
								$("#nickName").focus();
								return false;
							}
			            	/* else{
								$("#joinForm").submit();
							} */
			            	
			            	if(!regPhone.test($('#phone').val())){
			                	alert("비밀번호 형식에 맞지 않습니다.(ex)XXX(-)XXXX(-)XXXX)숫자만 가능");
			                	$('#phone').focus();
			                	return false;
			                }
			            	
			            	if(!regPwd.test($('#password').val())){
			     			   alert('영문+숫자  조합으로 6-12자를 입력해 주세요.');
			     			   $('#password').focus();
			     			   return false;
			     			}
			     			
			     			if(!regEmail.test($('#email').val())) {
			                     alert("이메일 주소가 유효하지 않습니다");
			                     $('#email').focus();
			                     return false;
			                }else{
			     				if($('#password').val()!="" && $('#password2').val() == $('#password').val() && $('#phone').val()!="" && $('#address3').val()!="" && $('#email').val()!=""){			
			     					alert("회원이 되신걸 환영합니다.");
			     					$("#joinForm").submit();
			     				}
			                }
						}
			            
			            $(function(){
			  			  $("#joinBtn").click(function(){
			  	
			  				   if($('#password').val()==""){
			  					    alert("비밀번호를 입력 해 주세요");
			  					    $('#password').focus();
			  					    return;	
			  				   }
			  				   
			  				   if($('#password2').val() != $('#password').val()){
			  					    alert("입력하신 비밀번호를 확인 해 주세요");
			  					    $('#password2').focus();
			  					    return;
			  				   }
			  				   
			  				   if($('#address3').val()==""){
			  					    alert("주소를 입력 해 주세요");
			  					    $('#address3').focus();
			  					    return;
			  				   }
			  				   
			  				   if($('#phone').val()==""){
			  					    alert("연락처를 입력 해 주세요");
			  					    $('#phone').focus();
			  					    return;
			  				   }
			  			   
			  				   if($('#email').val()==""){
			  					    alert("이메일을 입력 해 주세요");
			  					    $('#email').focus();
			  					    return;
			  				   }
			  				   
			  			});
			  		});

         </script>
		</form>
	</div>
	<br><br>
	<c:import url="../footer/footer.jsp" />
</body>
</html>