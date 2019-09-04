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
<link rel="stylesheet" href="resources/css/admin/productinsert.css">
<!-- css 끝 -->

<!-- js 시작 -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/admin/productinsert.js"></script>

</head>
<body>
	<div class="warp"><!-- 전체 감싸기  -->
		<c:import url="../adminheader.jsp" />
			<div id="content"> <!-- 전체 범위  -->
				<div class="content"><!-- nav 제외 범위 -->
				<form action="insertP" method="post" enctype="Multipart/form-data">
				<!-- 상품 제목 -->
					<div class="page_title_wrap">
						<div class="page_tit">상품 등록</div>
					</div>
				<!-- 제목 끝 -->
				<!-- 상품 등록 상 -->
				<div class="insert_top">
					<span class="mt">기본 정보</span>
					<div class="sub_top">
						<table>
							<tr>
								<th class="head">상품명</th>
								<td class="sub"><input type="text" name="pname" id="pname"></td>
							</tr>
							<tr>
								<th class="head">카테고리</th>
								<td class="sub">
									<input type="radio" name="pcategory" id="pcategory" checked="checked" ><label>도시락</label>
									<input type="radio" name="pcategory" id="pcategory" ><label>샐러드</label>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- 상품등록 상 끝  -->
				
				<!-- 상품등록 중 -->
				<div class="insert_middle">
					<span class="mt">판매 정보</span>
					<div class="sub_middle">
						<table>
							<tr>
								<th class="head">판매가</th>
								<td class="sub mi"><input type="text" name="sell" id="sell" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >원 <span><label id="hide">가격은 10원 단위로 입력이 가능합니다.</label></span></td>
							</tr>
							<tr>
								<th class="head">재고 수량</th>
								<th class="sub mi"><input type="text" name="Inventory" id="Inventory" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">개</th>
							</tr>
							<tr>
								<th class="head">상품 이미지</th>
								<td></td>
							</tr>
							
						</table>
					</div>
				</div>				
				<!-- 상품등록 중 끝 -->
						
			
			</form>
			</div><!-- nav 제외 범위 -->
		</div><!-- 전체 범위 부분 -->
	</div><!-- warp 끝 -->













</body>
</html>