<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin/PayList.css">
<style>

</style>
</head>
<body>

	<c:import url="../adminheader.jsp" />
<form id="SearchInputform" action="adminPaymentList2.do" method="post">
	<div style="margin-left: 250px">
		<h1>주문 통합 리스트</h1>


		<div  class="pay1">
			<div class="PayPlz">
			
				<table style='border-width: 1px; border-collapse: collapse;' class="searchBoard">
					<tr>
						<th>검색어</th>
						<td>
							<select id="searchForm" name="searchForm">
								<option value="allSearch">통합검색</option>
								<option value="Paynum">주문번호</option>
								<option value="PayName">상품명</option>
								<option value="PayId">주문자아이디</option>
								<option value="Payphone">주문자번호</option>
								<option value="PayUserName">주문자번호</option>
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
						<th>주문일자</th>
						<td class="dayBtn">

							<button type="button" class="today buttonSearch" id="today">오늘</button>
							<button type="button" class="today buttonSearch" id="3days">3일</button>
							<button type="button" class="today buttonSearch" id="7days">1주일</button>
							<button type="button" class="today buttonSearch" id="1month">1개월</button>
							<button type="button" class="today buttonSearch" id="1years">1년</button>
							<input type="date" class="startDatePicker" name ="startDatePicker"> ~ <input type="date" id="endDatePicker" name="endDatePicker" class="endDatePicker">
						</td>
					</tr>
					<tr>
						<th>주문 상태</th>
						<td>
							<div class="checkBox Item">
								<input type="radio" class="checkPay PayReady " name="check" value="ready">상품준비중 <input type="radio" class="checkPay PayDelivary" name="check" value="ing">배송중 <input type="radio" class="checkPay DelivaryEnd" name="check" value="end">배송완료 <input type="radio" class="checkPay PayEnd" name="check" value="buyend">구매확정
							</div>
						</td>
					</tr>
				</table>

			</div>



		</div>
		<div  class="pay2">

			<div class="content_bottom">
				<p>
					검색 결과 <span>${list.size()}</span>건
				</p>
			</div>


			<div style="height: 600px; overflow: auto">

			<div style="height: auto; width:auto; overflow: auto">

				<table class="tableResult " style="border-collapse: collapse;">
					<thead>
						<tr >

							<th nowrap style="min-height: 200px;" >주문번호</th>
							<th nowrap>주문자 아이디</th>
							<th nowrap>주문자명</th>
							<th nowrap>주문자 전화번호</th>
							<th nowrap>주문상태</th>
							<th nowrap>상품번호</th>
							<th nowrap>배달주소</th>
							<th nowrap>결제금액</th>
							<th nowrap>기사에게 남길말</th>
							<th nowrap>결제시간</th>
							<th nowrap>배송날짜</th>
							<th nowrap>판매수량</th>

						</tr>
					</thead>
					<tbody class="hover">
						<c:forEach var="p" items='${list }' varStatus="pay">

							<tr >
								<td nowrap style=" cursor:pointer" class="search" id="searchId" >${p.p_id}</td>
								<td nowrap>${p.userid }</td>
								<td nowrap> ${p.payname }</td>
								<td nowrap>${p.payphone }</td>
								<td nowrap>
								
								<select id="delivaryForm" class="delivaryForm" >
								<c:if test="${p.pstatus eq 'Y' }">
								<option class="Ready" value="Ready" selected>상품준비중</option>
								<option class="DelivaryIng"value="DelivaryIng">배송중</option>
								<option class="DelivaryEnd"value="DelivaryEnd">배송완료</option>
								</c:if>
								
								<c:if test="${p.pstatus eq 'R' }">
								<option class="Ready" value="Ready" >상품준비중</option>
								<option class="DelivaryIng"value="DelivaryIng" selected>배송중</option>
								<option class="DelivaryEnd"value="DelivaryEnd">배송완료</option>
								</c:if>
								
								<c:if test="${p.pstatus eq 'E' }">
								<option class="Ready" value="Ready" >상품준비중</option>
								<option class="DelivaryIng"value="DelivaryIng" >배송중</option>
								<option class="DelivaryEnd"value="DelivaryEnd" selected>배송완료</option>
								</c:if>
							</select></td>
								
								<td nowrap >${p.paytext }</td>
								<td nowrap >${p.payaddress }</td>
								<td nowrap>${p.payprice }</td>
								<td nowrap>${p.orderMemo }</td>
								<td nowrap>${p.paydate }</td>
								<td nowrap>${p.delivaryDate }</td>
								<td nowrap>${p.payrecipe }</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>
	
	</div>




</form>
	<script>

	
		$(document).ready(function() {
			  document.getElementById('endDatePicker').value= new Date().toISOString().substring(0, 10);
			  
		/* 	//최상단 체크박스 클릭
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
			});*/
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
		
	 	$('.delivaryForm').change(function () {
			
			var check = $(this).val();
			var id=$(this).parent().parent().children('#searchId').text();
			
			
			if(check == 'Ready'){
				check = 'Y';
			}else if(check=='DelivaryIng'){
				check = 'R';
			}else{
				check = 'E';
			}
			
			$.ajax({
				
				 url :"inputPid.do",
			        type: "POST",
			        data : {"id":id,"check":check},
			        success : function(data){
			        	
			        	
			        }
				
			});
				
		});  
/* 
		function inputPid(id){
			var check = ('.delivaryForm').val();
			alert(check);
			
			if(check == 'Ready'){
				check = 'Y';
			}else if(check=='DelivaryIng'){
				check = 'R';
			}else{
				check = 'E';
			}
			
			$.ajax({
				
				 url :"inputPid.do",
			        type: "POST",
			        data : {"id":id,"check":check},
			        success : function(data){
			        	
			        	
			        }
				
			});
			
		}  */
		
	</script>


</body>


</html>