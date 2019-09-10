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

	<div style="margin-left: 250px">
		<h1>결제 완료 리스트</h1>


		<div style="border: 0.5px radius 15deg black; " class="pay1">
			<div class="PayPlz">
				<table style='border-width: 1px; border-collapse: collapse;' class="searchBoard">
					<tr>
						<th>검색어</th>
						<td>
							<select id="searchForm">
								<option value="allSearch">통합검색</option>
								<option value="Paynum">상품번호</option>
								<option value="PayName">상품명</option>
								<option value="hhhh">주문자아이디</option>
								<option value="audi">주문자번호</option>
							</select>

							<input type="text" value="222" style="">


						</td>
						<td rowspan="4">
							<button class="ResultBtn Search">검색</button>
							<br> <br>
							<button class="ResultBtn Rest">초기화</button>
						</td>
					</tr>

					<tr>
						<th>주문일자</th>
						<td class="dayBtn">

						<button class="today buttonSearch" id="today">오늘</button>
							<button class="today buttonSearch" id="3days">3일</button>
							<button class="today buttonSearch" id="7days">1주일</button>
							<button class="today buttonSearch" id="1month">1개월</button>
							<button class="today buttonSearch" id="1years">1년</button>
							<input type="date" class="startDatePicker"> ~ <input type="date" id="endDatePicker" class="endDatePicker">
							
						</td>
					</tr>
				<!-- 	<tr>
						<th>주문 상태</th>
						<td>
							<div class="checkBox Item">
								<input type="checkBox" class="checkPay SelectAll ">전체선택 <input type="checkBox" class="checkPay PayConfirm" name="check">결제완료 <input type="checkBox" class="checkPay PayReady " name="check">상품준비중 <input type="checkBox" class="checkPay PayDelivary" name="check">배송중 <input type="checkBox" class="checkPay DelivaryEnd" name="check">배송완료 <input type="checkBox" class="checkPay PayEnd" name="check">구매확정
							</div>
						</td>
					</tr> -->
				</table>

			</div>



		</div>
		<div  class="pay2">
						<div class="content_bottom">
				<p>
					검색 결과 <span>0</span>건
				</p>
			</div>
			<div style=" height:600px; overflow:auto">
				<table class="tableResult" >
					<thead>
						<tr>

							<th style="min-height: 200px;">주문번호</th>
							<th>주문자명</th>
							<th>주문자 전화번호</th>
							<th>주문상태</th>
							<th>상품번호</th>
							<th>상품명</th>
							<th>재료명</th>
							<th>결제금액</th>
							<th>기사에게 남길말</th>
							<th>결제시간</th>
							<th>카테고리</th>
							<th>판매수량</th>

						</tr>
					</thead>
							<tbody>
					<c:forEach var="i" begin="0" end="20">
				
							<tr>
								<td>1231231231</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
								<td>6</td>
								<td>7</td>
								<td>8</td>
								<td>9</td>
								<td>10</td>
								<td>11</td>
								<td>12</td>
							</tr>
					
					</c:forEach>
						</tbody>
				</table>
			</div>
		</div>

</div>





	<script>
		$(document).ready(function() {
			document.getElementById('endDatePicker').value= new Date().toISOString().substring(0, 10);
			//최상단 체크박스 클릭
			$(".SelectAll").click(function() {
				 
				//클릭되었으면
				if ($(".SelectAll").prop("checked")) {
			
					$("input[name=check]").prop("checked", true);
					//클릭이 안되있으면
				} else {
				
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
	</script>


</body>


</html>