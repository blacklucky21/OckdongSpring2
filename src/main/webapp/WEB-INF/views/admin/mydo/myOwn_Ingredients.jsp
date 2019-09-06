<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도시락 제료 리스트</title>
<!-- css 시작 -->
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/admin/productList.css">
<!-- css 끝 -->

<!-- js 시작 -->

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/admin/productList.js"></script>

<!-- js 끝 -->
<style type="text/css">
.delButton:hover{
	cursor: pointer;
}
</style>
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
					<div class="page_tit">도시락 제료 리스트</div>
				</div>
				<!-- 제목 끝 -->

				<!-- 리스트 뽑기 -->
				<div class="listContent">
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
					<!-- 상품 번호 p_Id -->
					<div class="list_bottom">
						<div class="table_list">
							<table class="list_table">
								<thead>
									<tr>
										<th>재료번호</th>
										<th>재료명</th>
										<th>가격</th>
										<th>용량(g)</th>
										<th>등록일</th>
										<th>판매상태</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody class="list_content">
									<!-- 리스트 가져 오기 -->
										<c:forEach var="i" items="${inList }" varStatus="num">
									
							 			<tr class="list${num.count}">
											<td class="py" id="py">${ i.inNo }</td>
											<td class="pp">${i.inName }</td>
											<td class="pp">${ i.inPrice }</td>
											<td class="pp">${ i.inGram }</td>
											<td class="pp">${ i.inType }</td>
											<td class="pp">${ i.inCreateDate }</td>
											<td class="py" class="delButton" id="deleted" onclick="deleteOne('list${num.count}','${ i.inNo }');" >삭제</td>
										</tr>  
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 전체 부위 끝 -->
			<script>
				function deleteOne(listNum, inNo){
					console.log("listNum : " + listNum + ", inNo : " + inNo);
					
					if(!confirm("삭제 하시겠습니까?")){
						console.log("삭제 안함");
						return false;
					}
					console.log("삭제 진행");
					/* $.ajax({
						url: "ingredientDelete",
						data: {inNo : inNo},
						type: post,
						success: function(data){
							alert("삭제에 성공하였습니다.");
							$('.'+listNum).remove();
						}, error: function(data){
							alert("삭제에 실패하였습니다.");
						}
					}); */
				}
			</script>
		</div>
	</div>
</body>
</html>