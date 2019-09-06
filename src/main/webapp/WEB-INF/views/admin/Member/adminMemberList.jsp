<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin/PayList.css">

</head>
<body>

	<c:import url="../adminheader.jsp" />

	<div style="margin-left: 250px">
		<h1>회원 리스트 </h1>


		<div style="border: 0.5px radius 15deg black; height: 300px;" class="pay1">
			<div class="PayPlz">
				<form id="SearchInputform" action="adminMemberList2.do" method="post">
				<table style='border-width: 1px; border-collapse: collapse;' class="searchBoard">
				
					<tr>
						<th>검색어</th>
						<td>
						
					
							<select id="searchForm" name="searchForm">
								<option value="allSearch">통합검색</option>
								<option value="Paynum">아이디</option>
								<option value="PayName">이름</option>
								<option value="PayNickName">닉네임</option>
							
							</select>

							<input type="text" placeholder="검색어를 입력해주세요" class="SearchInput" name="searchInput">


						</td>
						<td rowspan="4">
							<button class="ResultBtn Search">검색</button>
							<br> <br>
							<button type="button" class="ResultBtn Rest">초기화</button>
						</td>
					</tr>

					<tr>
						<th>가입 일자</th>
						<td class="dayBtn">

							<button type="button" class="today buttonSearch" id="today" >오늘</button>
							<button  type="button" class="today buttonSearch" id="3days">3일</button>
							<button  type="button" class="today buttonSearch" id="7days">1주일</button>
							<button type="button" class="today buttonSearch" id="1month">1개월</button>
							<button type="button" class="today buttonSearch" id="1years">1년</button>
							<input type="date" class="startDatePicker" name ="startDatePicker"> ~ <input type="date" id="endDatePicker" name="endDatePicker" class="endDatePicker">
						</td>
					</tr>
				
				</table>
	</form>
			</div>



		</div>
		<div  class="pay2">

			<div class="content_bottom">
				<p>
					검색 결과 <span><c:set var="listcount" value='${listCount}'/>
					${list.size()}</span>건
				</p>
			</div>


			<div style="min-width: 600px; overflow: auto">

			<div style="height: 600px; overflow: auto">

				<table class="tableResult">
					<thead>
						<tr>

							<th>순번</th>
							<th>아이디</th>
							<th>닉네임</th>
							<th>이름</th>
							<th>전화번호</th>
							<th>이메일</th>
							<th>주소</th>
							<th>가입날짜</th>
							<th>상태</th>
						

						</tr>
					</thead>
					<tbody>
						<c:forEach var="m" items="${ list }">

							<tr class="mCheck">
								
								<td>${m.mNum }</td>
								<td >${m.userId}</td>
								<td>${m.nickName}</td>
								<td>${m.userName}</td>
								<td>${m.phone}</td>
								<td>${m.email}</td>
								<td>${m.address}</td>
								<td>${m.enroll_Date}</td>
								<td>
								<c:if test="${m.status eq 'Y' && m.userId ne 'admin' }">
								회원
								</c:if>
								
								<c:if test="${m.userId eq 'admin' }">
								
								관리자</c:if>
								<input type="hidden" class="userId" value="${m.userId}">
								</td>
								
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>

</div>
<form name="deleteAdminMember" action="deleteAdminMem.del" method="post">
	<input type="hidden" name="MemId">

</form>


	<script>

	
		$(document).ready(function() {
			  document.getElementById('endDatePicker').value= new Date().toISOString().substring(0, 10);
			  
			//최상단 체크박스 클릭
			$(".SelectAll").click(function() {
				//클릭되었으면
				if ($(".SelectAll").prop("checked")) {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
					$("input[name=check]").prop("checked", true);
					//클릭이 안되있으면
				} else {
					//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
					$("input[name=check]").prop("checked", false);
				}
			});
		});
		
		
		$(document).ready(function(){
			
			
			$('.dayBtn :button').click(function(){
				
				var checkDay = $(this).attr('id');
				
				console.log(checkDay);
				console.log(lastWeek());
				switch(checkDay){
				case 'today':$('.startDatePicker').val(today());break;	
				case '3days': $('.startDatePicker').val(days3Ago());break;
				case '7days': $('.startDatePicker').val(lastWeek());break;
				case '1month': $('.startDatePicker').val(lastMonth());break;
				case '1years':  $('.startDatePicker').val(lastYear());break;
				}
				
			});
		});

		
		
		/* 날짜 객체 받아서 문자열로 리턴하는 함수 */
		function getDateStr(myDate){
			var d =new Date();
			
		
				d = (myDate.getFullYear() + '-' + ('0'+(myDate.getMonth() + 1)).slice(-2) + '-' +('0'+ myDate.getDate()).slice(-2));
			
		
			return d;
		}

		/* 오늘 날짜를 문자열로 반환 */
		function today() {
		  var d = new Date();
		  return getDateStr(d);
		}
		
		/* 오늘로부터 3일전 날짜 반환 */
		function days3Ago() {
		  var d = new Date()
		  var dayOfMonth = d.getDate()
		  d.setDate(dayOfMonth - 3)
		  return getDateStr(d)
		}


		/* 오늘로부터 1주일전 날짜 반환 */
		function lastWeek() {
		  var d = new Date()
		  var dayOfMonth = d.getDate()
		  d.setDate(dayOfMonth - 7)
		  return getDateStr(d)
		}
	

		/* 오늘로부터 1개월전 날짜 반환 */
		function lastMonth() {
		  var d = new Date()
		  var monthOfYear = d.getMonth()
		  d.setMonth(monthOfYear - 1)
		  return getDateStr(d)
		}
		
		/* 오늘로부터 1년전 날짜 반환 */
		function lastYear() {
		  var d = new Date()
		  var Year = d.getFullYear()
		  console.log(Year);
		  d.setYear(Year - 1)
		  return getDateStr(d);
		}
		
		
		//row행 블랙
		$('.mCheck').click(function(){
			
			
			var tr = $(this);
	        var td = tr.children();
	 		


		var userid =td.eq(1).text();
			
		alert(userid);
			
			
			var bool = confirm("회원 "+userid+"를 정말로 블랙 시키겠습니까?");
			
			if(bool){
				var delMem = document.deleteAdminMember;	
				
				delMem.MemId.value = userid;
				delMem.submit();
				
/* 				location.href='deleteAdminMember.aa'; */
<%-- 				location.href='<%= request.getContextPath( )%>/deletereply.bo?bid=<%=board.getBid() %>&no='+num; --%>
				<%-- location.href='<%= request.getContextPath( )%>/deletereply.bo?no='+number+&bid=<%=board.getBid() %>; --%>	
			}
		});
	</script>


</body>


</html>