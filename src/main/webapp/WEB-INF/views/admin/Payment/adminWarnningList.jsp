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
								<option value="Paynum">닉네임</option>
								<option value="PayName">아이디</option>
								<option value="hhhh">도시락명</option>
								
							</select>

							<input type="text" value="222" style="">


						</td>
						<td rowspan="4">
							<button class="ResultBtn Search">검색</button>
							<br> <br>
							<button class="ResultBtn Rest">초기화</button>
						</td>
					</tr>

				</table>

			</div>



		</div>
		<div style="border: 1px solid black;  margin-top: 30px" class="pay1">
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
							<th>게시글 제목</th>
							<th>신고 상품</th>
							<th>신고자 아이디</th>
							<th>신고자 닉네임</th>
							<th>신고 사유</th>
							<th>신고 시간</th>
							<th>신고 횟수</th>
							

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
								<td>시벌</td>
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