<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.junwo.ockdong.member.model.vo.Member"%>
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
	<input type="hidden" id="userAddress" value="${ loginUser.getAddress() }"> <!-- 주소 불러오기용 -->
	<input type="hidden" id="userPhone" value="${ loginUser.getPhone() }"> <!-- 연락처 불러오기용 -->
	<input type="hidden" id="userEmail" value="${ loginUser.getEmail() }"> <!-- 이메일 불러오기용 -->
	
	<form id="ModifyInfoForm" action="ModifyInfo.me" method="post">
	<div class="centerWrapArea">
		<div class="section">
			<div class='figure'>
				<div class="center_top_title" align="left">회원정보수정</div>
				<div>
					<div class='nth-child1'>회원아이디</div>
					<div class='nth-child2'>
						<input name="userId" class='info_input bg_f3f4f6'
							 type='text' value="${ loginUser.getUserId() }" readonly/>
					</div>
				</div>

				<div>
					<div class='nth-child1'>이름</div>
					<div class='nth-child2'>
						<input name="userName" class='info_input bg_f3f4f6' type='text' value="${ loginUser.getUserName() }" readonly/>
					</div>
				</div>


				<div>
					<div class='nth-child1'>비밀번호 입력</div>
					<div class='nth-child2'>
						<input name="userPwd" id="userPwd" class='info_input red_focus'
							type='password' maxlength="16" />
					</div>
				</div>

				<div>
					<div class='nth-child1'>비밀번호 확인</div>
					<div class='nth-child2'>
						<input name="userPwd2" id="userPwd2" class='info_input red_focus'
							type='password' maxlength="16" />
					</div>
				</div>

				<div>
					<div class='nth-child1 vtop'>회원주소</div>
					<div class='nth-child2'>

						<div>
							<input type="text" name="post"  id="post" class="info_input sub_input1_1" readonly>
							<input type="text" name="address2" id="address2" class="info_input sub_input1_2" readonly>
							<input type="text" name="address3" id="address3" class="info_input sub_input1_3">
							<input type="text" name="address4" id="address4" class="info_input sub_input1_3">
							
							<span class='btn_124_bg_blue' onclick="searchAdd();">검색</span>
						</div>

					</div>
				</div>

				<div>
					<div class='nth-child1'>연락처</div>
					<div class='nth-child2' align="left">
						<input type="text" id="phone" name="phone" style="width:60px" class="info_input sub_input2"> 
					</div>
				</div>
				<div>
					<div class='nth-child1'>이메일</div>
					<div class='nth-child2'>
						<div class='info_mail'>
							<input type='text' id="email" name="email" class='info_mail_1'>
						</div>
						<span class='btn_124_bg_blue ml10' id="emailCheck2">중복확인</span>
						<input type="hidden" name="id_overlab_chk_flag" id="id_overlab_chk_flag">
					</div>
				</div>
			</div>
				<br><br>
				<div class='btn_box'>
					<a href="/"><span class='btn_140_red'>취소</span></a>
					<span id="wSend" class='btn_140_bg_red' onclick="wSend();">변경</span>
				</div>

			</div>

		</div>

	</form>
	
	<script>
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var regPhone = /^[0-9]+$/;
		var regPwd = /^(?=.*[a-zA-Z]+)(?=.*[0-9]+).{6,12}$/;
		
		function wSend(){	
			if(!regPhone.test($('#phone1').val())){
            	alert("숫자만 가능합니다.");
            	$('#phone1').focus();
            	return;
            }
			if(!regPhone.test($('#phone2').val())){
            	alert("숫자만 가능합니다.");
            	$('#phone2').focus();
            	return;
            }
			if(!regPhone.test($('#phone3').val())){
            	alert("숫자만 가능합니다.");
            	$('#phone3').focus();
            	return;
            }

			if(!regPwd.test($('#userPwd').val())){
			   alert('영문+숫자  조합으로 6-12자를 입력해 주세요.');
			   $('#userPwd').focus();
			   return;
			}
			
			if(!regEmail.test($('#email').val())) {
                alert("이메일 주소가 유효하지 않습니다");
                $('#email').focus();            
            }else{
				if($('#userPwd').val()!="" && $('#userPwd2').val() == $('#userPwd').val() && $('#phone').val()!="" && $('#address3').val()!="" && $('#email').val()!=""){			
					alert("정보 수정이 완료되었습니다.");
					$("#ModifyInfoForm").submit();
				}
            }
			
		}
		
		$(function(){
			  $("#wSend").click(function(){
	
				   if($('#userPwd').val()==""){
					    alert("비밀번호를 입력 해 주세요");
					    $('#userPwd').focus();
					    return;	
				   }
				   
				   if($('#userPwd2').val() != $('#userPwd').val()){
					    alert("입력하신 비밀번호를 확인 해 주세요");
					    $('#userPwd2').focus();
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
		
		$("#emailCheck2").click(function(){
			
			var email = $("#email").val();
			
			if(!regEmail.test(email)) {
	               alert('사용할 수 없는 이메일입니다.');
	               email.focus();
	               return false;
	           }
			
			$.ajax({
				
				url:"<%=request.getContextPath()%>/emailCheck.do",
				data:{email:email},
				type:"get",
				success:function(data){
					if(data == 0){
						alert("사용 가능한 이메일입니다.");
						checkValue2 = 1;
					}else{
						alert("사용 중인 이메일입니다.");
					}
				}
			});
		});
	
	</script>
		
		
	<script>
		function searchAdd() {
			 new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		 
		                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
		 
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
		                if(fullRoadAddr !== ''){
		                    fullRoadAddr += extraRoadAddr;
		                }
		 
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('address1').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('address2').value = fullRoadAddr;
		                /* document.getElementById('address3').value = data.jibunAddress; */
	
		                
		            }
		        }).open();
		    }
		</script>
		
	
		<script> 
		
		/* 이메일 정보 받아오기 */
		var address = document.getElementById("userAddress").value; + "";
		var addressArr = address.split('|', 4);
		
		$("#post").val(addressArr[0]);
		$("#address2").val(addressArr[1]);
		$("#address3").val(addressArr[2]);
		$("#address4").val(addressArr[3]);
		
		/* 연락처 정보 받아오기 */
		var phone = document.getElementById("userPhone").value; + "";
		
		/* 이메일 정보 받아오기 */
		var email = document.getElementById("userEmail").value;
		$("#email").val(email);

	</script>

</body>
</html>