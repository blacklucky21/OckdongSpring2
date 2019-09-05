<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 시작 -->
<link rel="stylesheet" href="resources/css/admin/productInquiry.css">
<!-- css 끝 -->

<!-- js 시작 -->

<script type="text/javascript"
	src="resources/js/admin/productInquiry.js"></script>

<!-- js 끝 -->
</head>
<body>
	<div class="warp">
		<!-- 전체 감싸기  -->
		<c:import url="../adminheader.jsp" />
		<div id="content">
			<!-- 전체 범위  -->
			<div class="content">
				<!-- nav 제외 범위 -->
				<!-- 상품 제목 -->
				<div class="page_title_wrap">
					<div class="page_tit">상품 문의</div>
				</div>
				<!-- 제목 끝 -->
				<div class="listContent">
		
		
		<div class="search_box search_field">
			<form class="search_form">

				<table class="tg">
  					<tr>
    					<th class="tg-0lax serarch_ti">검색어</th>
   						<th class="tg-0lax">
   							<span>
   							<select id="select_code">
   								<option>상품번호</option>
   								<option>상품명</option>						
   							</select>
   							</span>
   							<span>	<input type="text" class="search_content"></span>
   						</th>
   					
    					<td >
    						<input type="button" value="검색" class="bu" id="se">
    						<input type="button" value="초기화" class="bu" id="can">	
    					</td>
  					</tr>  	
  					<!-- 날자 -->
  					<tr>
  					<tr>
						<th class="tg-0lax serarch_ti">주문일자</th>
						<td class="dayBtn">

						<button class="today buttonSearch" id="today">오늘</button>
							<button class="today buttonSearch" id="3days">3일</button>
							<button class="today buttonSearch" id="7days">1주일</button>
							<button class="today buttonSearch" id="1month">1개월</button>
							<button class="today buttonSearch" id="1years">1년</button>
							<input type="date" class="startDatePicker"> ~ <input type="date" id="endDatePicker" class="endDatePicker">
							
						</td>
					</tr>
  					
  					</tr>
  					
  									
				</table>
			</form>
		</div>
	</div>
	<!--  -->

	<div class="content_bottom">
					<p>
						검색 결과 <span>3</span>건
					</p>
					<!-- 상품 번호 p_Id -->
					<div class="list_bottom">
						<div class="table_list">
							<table class="list_table">
							<thead>
								<tr>
									<th>선택</th>
									<th>No</th>
									<th>답변상태 </th>
									<th>상품번호</th>
									<th>상품명</th>
									<th>문의유형</th>
									<th>작성자</th>
									<th>문의일시</th>
									<th>답변일시</th>
								</tr>
								</thead>
								<tbody class="list_content">
									<!-- 리스트 가져 오기 -->
									
									<c:forEach var="i" begin="1" end="30" varStatus="num">
									
							 			<tr class="list"+ ${num}>
											<td><input type="radio" id="sel" name="sel"></td>
											<td class="pp" id="py">${ i }</td>
											<td class="pp">답변대기중</td>
											<td class="pp">시퀀스번호겟지</td>
											<td class="pp">요모조모</td>
											<td class="pp">상품카테</td>
											<td class="pp">닉네임</td>
											<td class="pp">sysdate</td>
											<td class="pp">sysdate</td>
										</tr>  
									</c:forEach>
									
								</tbody>
							</table>

						</div>

					</div>
				</div>
				</div>


			</div>
			<!-- nav 제외 범위 -->
		</div>
		<!-- 전체 범위 부분 -->
	</div>
	<!-- warp 끝 -->


</body>
</html>