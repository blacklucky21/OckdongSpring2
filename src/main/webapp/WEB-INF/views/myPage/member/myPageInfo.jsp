<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="resources/css/myPage/myPageInfo.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>
<body>
</head>
	
	<form id="ModifyInfoForm" action="memberUpdate.me" method="post">
	<c:set var="m" value="${member}" />
	
	<span class="join-form">
	<fieldset id="fds-order-info">
	<legend>주문폼</legend>
			<h3>회원 정보</h3>
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
							<th class="ta-l required" aria-required="true">닉네임</th>
							<td>
								<div class="txt-field hs" style="width: 350px;">
									<input type="text" id="nickName" name="nickName" value="${ loginUser.getNickName() }" class="text">
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th class="ta-l required" aria-required="true">휴대폰 번호</th>
							<td>
								<span class="txt-field hs" style="width: 350px;">
									<input type="text" id="phone" name="phone" value="${ loginUser.getPhone() }" class="text">
								</span>
							</td>
							<td></td>
						</tr>
						<tr>
							<th class="ta-l required" aria-required="true">이메일</th>
							<td>
								<div class="email" style="display: inline">
									<span class="txt-field hs" style="width: 350px;"> 
										<input type="text" name="email" value="${ loginUser.getEmail() }" class="text">
									</span>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
						<%-- <input type="hidden" id = "add" value="${ loginUser.address}" style="width:100%"> --%>
						
							<th height="40px">우편번호</th>
							<td>
								<div class="txt-field-id hs" style="width: 350px;">
									<span class="txt-field hs" style="width: 350px;">
										<input type="text" name="post" id="post" class="text" value="">
									</span>
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
								<div class="txt-field-id hs" style="width: 350px;">
									<span class="txt-field hs" style="width: 350px;">
										<input type="text" name="address2" id="address2" class="text">
									</span>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th height="40px">주소</th>
							<td>
								<div class="txt-field-id hs" style="width: 350px;">
									<span class="txt-field hs" style="width: 350px;">
										<input type="text" name="address3" id="address3"class="text">
									</span>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<th height="40px">상세주소</th>
							<td>
								<div class="txt-field-id hs" style="width: 350px;">
									<span class="txt-field hs" style="width: 350px;">
										<input type="text" name="address4" id="address4" class="text">
									</span>
								</div>
							</td>
							<td></td>
						</tr>

					</tbody>
			
				
				</table>
				<br><br>
				<div style="text-align:center">
					<div>
						<span><button class='buSub'>취소</button></span>
						<span><button id="wSend" class='buSub' onclick="wSend();">변경</button></span>
					</div>
				</div>
			</div>
			
</form>
	
	<script>
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
		</script>
	
	<script>
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var regPhone = /^[0-9]+$/;

		function wSend() {
			if (!regPhone.test($('#phone').val())) {
				alert("숫자만 가능합니다.");
				$('#phone').focus();
				return;
			}

			if (!regEmail.test($('#email').val())) {
				alert("이메일 주소가 유효하지 않습니다");
				$('#email').focus();
			} else {
				if ($('#userPwd').val() != ""
						&& $('#phone').val() != ""
						&& $('#address3').val() != ""
						&& $('#email').val() != "") {
					alert("정보 수정이 완료되었습니다.");
					$("#ModifyInfoForm").submit();
				}
			}

		}

		$(function() {
			$("#wSend").click(function() {


				if ($('#address3').val() == "") {
					alert("주소를 입력 해 주세요");
					$('#address3').focus();
					return;
				}

				if ($('#phone').val() == "") {
					alert("연락처를 입력 해 주세요");
					$('#phone').focus();
					return;
				}

				if ($('#email').val() == "") {
					alert("이메일을 입력 해 주세요");
					$('#email').focus();
					return;
				}

			});
			
			/* 주소 정보 받아오기 */
			var address = '${ loginUser.address }';
			var addressArr = address.split('/', 4);
			console.log(addressArr);
			
			$("#post").val(addressArr[0]);
			$("#address2").val(addressArr[1]);
			$("#address3").val(addressArr[2]);
			$("#address4").val(addressArr[3]);
			
			/* 연락처 정보 받아오기 */
			var phone = document.getElementById("userPhone").value; + "";
			
			/* 이메일 정보 받아오기 */
			var email = document.getElementById("userEmail").value;
			$("#email").val(email);
			
			
			
		});
		
	
	</script>
</body>
</html>