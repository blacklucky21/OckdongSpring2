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
.delBtn{
	color: red;
}
.delBtn:hover{
	cursor: pointer;
}
.detailBtn:hover{
	cursor: pointer !important;
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
					<div class="page_tit">도시락 재료 리스트</div>
				</div>
				<!-- 제목 끝 -->

				<!-- 리스트 뽑기 -->
				<div class="listContent">
					<div class="search_box search_field">
						<form class="search_form">

							<table class="tg">
								<tr>
									<th class="tg-0lax serarch_ti">검색어</th>
									<th class="tg-0lax">
										<span>
											<select id="select_code">
												<option>도시락 명</option>
												<option>작성자</option>
												<option>도시락 타입</option>
											</select>
										</span>
										<span>
											<input type="text" id="search_Content" class="search_content">
										</span>
									</th>
									<td>
										<input type="button" value="검색" class="bu" id="se" onclick="searchIn();">
										<input type="button" value="초기화" class="bu" id="can" onclick="replyIn();">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<!-- 리스트 윗 부분 끝 -->
				<div class="content_bottom">
					<p>
						검색 결과 <span class="countSpan">${rList.size() }</span>건
					</p>
					<!-- 상품 번호 p_Id -->
					<div class="list_bottom">
						<div class="table_list">
							<table class="list_table">
								<thead>
									<tr>
										<th>도시락 사진</th>
										<th>도시락 명</th>
										<th>등록자</th>
										<th>타입</th>
										<th>등록일</th>
										<th>상태</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody class="list_content">
									<!-- 리스트 가져 오기 -->
									<c:forEach var="i" items="${rList }" varStatus="num">
							 			<tr class="list${num.count}">
											<td class="py" id="py"><img src="resources/img/Recipe/${i.mblFileName }" width="100px" height="100px"/></td>
											<td class="pp detailBtn" onclick="detailBtn(${ i.mblId });">${i.mblTitle }</td>
											<td class="pp">${ i.userId }</td>
											<td class="pp">${ i.mblType }</td>
											<td class="pp">${ i.createDate }</td>
											<td class="pp">${ i.status }</td>
											<td class="py delBtn" id="deleted" onclick="deleteOne('list${num.count}','${ i.mblId }');" >[삭제]</td>
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
				function deleteOne(listNum, mblId){
					console.log("listNum : " + listNum + ", mblId : " + mblId);
					
					if(!confirm("삭제 하시겠습니까?")){
						console.log("삭제 안함");
						return false;
					}
					console.log("삭제 진행");
					$.ajax({
						url: "recipeDelete.do",
						data: {mblId : mblId},
						type: "post",
						success: function(data){
							alert("삭제에 성공하였습니다.");
							$('.'+listNum).remove();
							var count = $(".countSpan").html();
							count = count - 1;
							$(".countSpan").html(count);
						}, error: function(data){
							alert("삭제에 실패하였습니다.");
						}
					});
				}
				
				function searchIn(){
					var sContent = $("#search_Content").val();
					var select_code = $("#select_code").val();
					
					if(sContent.length > 0){
						$.ajax({
							url : "searchRecipe.do",
							data : {sContent:sContent,type:select_code},
							dataType : "json",
							success : function(data){
								if(data.length > 0){
									$(".list_content").empty();
									$(".countSpan").html(data.length);
									var count = 1;
									for(var i in data){
										$tr = $("<tr class='list" + count + "'>");
										$tdImg = $("<td class='py' id='py'><img src='resources/img/Recipe/" + decodeURIComponent(data[i].mblFileName.replace(/\+/g, ' ')) + "' width='100px' height='100px'/>");
										$tdTitle = $("<td class='pp detailBtn' onclick='detailBtn(" + data[i].mblId + ");'>").text(decodeURIComponent(data[i].mblTitle.replace(/\+/g, " ")));
										$tdUserId = $("<td class='pp'>").text(data[i].userId);
										$tdType = $("<td class='pp'>").text(decodeURIComponent(data[i].mblType.replace(/\+/g, " ")));
										$tdCreateDate = $("<td class='pp'>").text(data[i].createDate);
										$tdStatus = $("<td class='pp'>").text(data[i].status);
										$tdDelBtn = $("<td class='py delBtn' id='deleted' onclick=\"deleteOne('list" + count + "','" + data[i].mblId + "');\" >[삭제]</td>");
										
										count = count + 1;
										
										$tr.append($tdImg);
										$tr.append($tdTitle);
										$tr.append($tdUserId);
										$tr.append($tdType);
										$tr.append($tdCreateDate);
										$tr.append($tdStatus);
										$tr.append($tdDelBtn);
										$(".list_content").append($tr);
									}
								}else{
									alert("검색 결과가 없습니다.");									
								}
							}, error : function(data){
								alert("검색 결과가 없습니다.");
							}
						});
					}else{
						alert("검색어를 입력해 주세요.");
					}
				}
				
				function replyIn(){
					location.href="allRecipe.do";
				}
				
				function detailBtn(mblId){
					location.href="myRecipeDetail.do?mblId="+mblId;
				}
			</script>
		</div>
	</div>
</body>
</html>