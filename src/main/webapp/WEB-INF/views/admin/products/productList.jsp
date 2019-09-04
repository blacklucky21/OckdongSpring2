<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 시작 -->
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/admin/productList.css">
<!-- css 끝 -->

<!-- js 시작 -->

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/admin/productList.js"></script>

<!-- js 끝 -->
</head>
<body>
	<!-- 헤더 부름 -->

	<!-- 헤더 끝 -->
	<div class="warp">
		<c:import url="../adminheader.jsp" />
		<div id="content">
			<div class="content">
				<!-- 상품 제목 -->
				<div class="page_title_wrap">
					<div class="page_tit">상품 리스트</div>
				</div>
				<!-- 제목 끝 -->

				<!-- 리스트 뽑기 -->
				<div class="listContent">
					<div class="content_top">
						<div class="products_summary search_tab">
							<table class="ncp_tbl">
								<tbody>
									<tr>
										<td>전체<a></a>건
										</td>
										<td>판매중<a></a>건
										</td>
										<td>품절<a></a>건
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div class="search_box search_field">
						<form class="search_form">

							<table class="tg">
								<tr>
									<th class="tg-0lax serarch_ti">검색어</th>
									<th class="tg-0lax"><span> <select id="select_code">
												<option>상품번호</option>
												<option>상품명</option>
										</select>
									</span> <span> <input type="text" class="search_content"></span>
									</th>

									<td><input type="button" value="검색" class="bu" id="se">
										<input type="button" value="초기화" class="bu" id="can">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<!-- 리스트 윗 부분 끝 -->
				<div class="content_bottom">
					<p>
						검색 결과 <span>3</span>건
					</p>
					<div class="list_bottom">
						<div class="table_list">
							<table class="list_table">
							<thead>
								<tr>
									<th>상품번호</th>
									<th>상품명 </th>
									<th>판매상태</th>
									<th>판매상태설정</th>
									<th>가격</th>
									<th>수량</th>
									<th>카테고리</th>
									<th>재고수량</th>
									<th>판매수량</th>
									<th>삭제</th>
								</tr>
								</thead>
							</table>


							<div>
							<table>
								<tbody>
									<!-- 리스트 가져 오기 -->
									<c:forEach var="i" begin="1" end="15">
									 <tr>
											<th style="width: 131px;" class="plist">${ i }</th>
											<th style="width: 107px;" class="sh">상품명이 얼마나 늘어날지 나도 모르는 일이다.</th>
										
											<th style="width: 131px;" class="sh">판매상태</th>
											
											<th style="width: 189px;" class="sh">판매상태 설정</th>
											<th style="width: 82px;" class="sh">${ i }</th>
											<th style="width: 82px;" class="sh">${ i }</th>
											<th style="width: 132px;" class="sh">카테고리</th>
											<th style="width: 132px;" class="sh">${ i }</th>
											<th style="width: 132px;" class="sh">${ i }</th>
											<th style="width: 83px;" class="plist"id="deleteList" >삭제</th>
										</tr> 
								<%-- 	<tr>
											<td>${ i }</td>
											<td>상품명이 이게 맞나?</td>
											<td>판매상태 설정</td>
											<td>판매상태 설정</td>
											<td>${ i }</td>
											<td>${ i }</td>
											<td>카테고리</td>
											<td>${ i }</td>
											<td>${ i }</td>
											<td>삭제</td>
											
										</tr>  --%>
									</c:forEach>
									
								</tbody>
							</table>
</div>
						</div>
					</div>
				</div>

				<!-- 전체 부위 끝 -->
			</div>
		</div>
	</div>
</body>
</html>