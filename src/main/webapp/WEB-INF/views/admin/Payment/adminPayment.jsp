<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.searchBoard {
	margin: 5%;
}

.PayPlz td {
	margin-bottom: 5%;
	padding: 15px;
}

tr {
	margin: 5%;
}

.buttonSearch {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 30px;
	width: 70px;
	font-size: 13px;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

.buttonSearch:hover {
	background: #fff;
	color: #1AAB8A;
}

.buttonSearch:before, .buttonSearch:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

.buttonSearch:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.buttonSearch:hover:before, .buttonSearch:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

.tableResult {
	margin: 5%;
	border: 0.5px solid gray;
}

.tableResult tbody{
	overflow:scroll;
    height: 200px;
    width:400px;

}

.tableResult th {
	text-align: center;
	padding: 5px;
	margin-right: 30px;
	font-size: 13px;
	border: 0.5px solid gray;
	background-color: #bdb7b7;
}

.tableResult td {
	text-align: center;
	padding: 5px;
	border: thin solid gray;
}
</style>
</head>
<body>

	<c:import url="../adminheader.jsp" />

	<div style="margin-left: 250px">
		<h1>주문 통합 리스트</h1>


		<div style="border: 0.5px solid black; width: 100%; height: 300px;">
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
						<td>

							<button class="today buttonSearch">오늘</button>
							<button class="today buttonSearch">3일</button>
							<button class="today buttonSearch">1주일</button>
							<button class="today buttonSearch">1개월</button>

							<input type="date" class="startDatePicker"> ~ <input type="date" class="endDatePicker">
						</td>
					</tr>
					<tr>
						<th>주문 상태</th>
						<td>
							<div class="checkBox Item">
								<input type="checkBox" class="checkPay SelectAll ">전체선택 <input type="checkBox" class="checkPay PayConfirm" name="check">결제완료 <input type="checkBox" class="checkPay PayReady " name="check">상품준비중 <input type="checkBox" class="checkPay PayDelivary" name="check">배송중 <input type="checkBox" class="checkPay DelivaryEnd" name="check">배송완료 <input type="checkBox" class="checkPay PayEnd" name="check">구매확정
							</div>
						</td>
					</tr>
				</table>

			</div>



		</div>
		<div style="border: 1px solid black; width: 100%; height: auto; margin-top: 30px">
			<div style="width:100%; height:200px; overflow:auto">
				<table class="tableResult" width="100%" border="0" cellspacing="0" cellpadding="0">
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
	</script>


</body>


</html>