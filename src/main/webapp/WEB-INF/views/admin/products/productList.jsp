<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				
	<!-- 리스트 뽑기 -->
	<div class="listContent">
		<div class="content_top">
			<div class="products_summary search_tab">
				<table class="ncp_tbl">
					<tbody>		
						<tr>
							<td>전체<a></a>건</td>
							<td>판매중<a></a>건</td>
							<td>품절<a></a>건</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="search_box search_field">
			
		
		</div>
	</div>
				
				
				
				</div>
			</div>
	</div>
</body>
</html>