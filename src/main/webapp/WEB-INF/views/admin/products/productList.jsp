<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
				
	<!-- 리스트 뽑기  -->
	<div class="listContent">
		<div class="content_top">
			<div class="products_summary search_tab">
				<table class="ncp_tbl">
					<tbody>		
						<tr>
							<td>전체 ${ list.size() } 건</td>
							<td>판매중 ${ list2.size() } 건</td>
							<td>품절<a></a>건</td>
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
				</table>
			</form>
		</div>
	</div>
<!-- 리스트 윗 부분 끝 -->
				<div class="content_bottom">
					<p>
						검색 결과 <span>${ list.size() }</span>건
					</p>
					<!-- 상품 번호 p_Id -->
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
									
									<th>카테고리</th>
									<th>재고수량</th>
									<th>판매수량</th>
									<th>삭제</th>
								</tr>
								</thead>
								<tbody class="list_content">
									<!-- 리스트 가져 오기 -->
									
								<c:forEach var='p' items="${ list }"> 
										<tr class="${p.p_Id}">
											<td class="py" id="py">${ p.p_Id}</td> <!-- 상품번호 -->
											<td class="pp">${ p.p_name }</td> <!-- 상품명 -->
											
											<c:if test="${p.p_sell eq 'Y'}">
											<td class="pp" id="result${p.p_Id}">판매중</td> <!-- 판매상태 -->
											</c:if>
											
											<c:if test="${p.p_sell eq 'N'}">
											<td class="pp" id="result${p.p_Id}">판매중지</td> <!-- 판매상태 -->
											</c:if>
											
											
											<td>
												<select class="select" id="select${p.p_Id}" onchange="change(${p.p_Id});"> <!-- 판매상태 설정 -->
													<c:if test="${p.p_sell eq 'Y'}">
														<option value="판매중" selected>판매중</option>
														<option value="판매중지">판매중지</option>
													</c:if>
													<c:if test="${p.p_sell eq 'N'}">
														<option value="판매중">판매중</option>
														<option value="판매중지" selected>판매중지</option>
													</c:if>
												</select>
											</td>
											
											<td class="pp">${ p.p_price }</td>										
											<td class="pp">${ p.p_lunchtype }</td>
											<td class="pp">${ p.p_quantity }</td>
											<td class="pp"></td><!-- 판매 수량 -->
											<td class="py deleted" onclick="deleted('Select${p.p_Id}');" >삭제</td>
											
										</tr>  
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

</body>
<script>



</script>



</html>