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
						<p>
							검색 결과 <span class="countSpan">${qnaList.size() }</span>건
						</p>
						<table class="tg">
							<tr>
								<th class="tg-0lax serarch_ti">처리상태</th>
								<th class="tg-0lax"><span> <select id="select_code">
											<option>답변중</option>
											<option>답변완료</option>
									</select>
								</span>
								</th>

								<td><input type="button" value="검색" class="bu" id="se" onclick="searchIn();">
									<input type="button" value="초기화" class="bu" id="can" onclick="replyIn();">
								</td>
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
									<th>답변상태</th>
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
								<c:forEach var="i" items="${qnaList }" varStatus="num">
									<tr class="list${num.count}">
										<td><input type="radio" id="sel" name="sel"></td>
										<td class="pp" id="py">${num.count}</td>
										<c:if test="${i.qna_answer eq 'N'}">
											<td class="pp">답변대기중</td>
										</c:if>
										<c:if test="${i.qna_answer eq 'Y'}">
											<td class="pp">답변완료</td>
										</c:if>
										<td class="pp">${ i.p_Id }</td>
										<td class="pp">${ i.p_title }</td>
										<td class="pp">${ i.p_lunchType }</td>
										<td class="pp">${ i.qna_user }</td>
										<td class="pp">${i.qna_createDate }</td>
										<td class="pp">${i.qna_answerDate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		function searchIn(){
			var select_code = $("#select_code").val();
			
			$.ajax({
				url : "adminSearchQnA.do",
				data : {type:select_code},
				dataType : "json",
				success : function(data){
					if(data.length > 0){
						$(".list_content").empty();
						$(".countSpan").html(data.length);
						var count = 1;
						for(var i in data){
							$tr = $("<tr class='list" + count + "'>");
							
							$tdRadio = $("<td><input type='radio' id='sel' name='sel'>");
							$tdNo = $("<td class='pp' id='py'>").text(count);
							$tdAnOk = "";
							if(data[i].qna_answer == 'Y'){
								$tdAnOk = $("<td class='pp'>").text("답변완료");
							}else{
								$tdAnOk = $("<td class='pp'>").text("답변중");
							}
							
							$tdPId = $("<td class='pp'>").text(data[i].p_Id);
							$tdPT = $("<td class='pp'>").text(decodeURIComponent(data[i].p_title.replace(/\+/g, " ")));
							$tdPL = $("<td class='pp'>").text(decodeURIComponent(data[i].p_lunchType.replace(/\+/g, " ")));
							$tdUser = $("<td class='pp'>").text(decodeURIComponent(data[i].qna_user.replace(/\+/g, " ")));
							$tdCD = $("<td class='pp'>").text(data[i].qna_createDate);
							$tdAD = $("<td class='pp'>").text(data[i].qna_answerDate);
							
							count = count + 1;
							
							$tr.append($tdRadio);
							$tr.append($tdNo);
							$tr.append($tdAnOk);
							$tr.append($tdPId);
							$tr.append($tdPT);
							$tr.append($tdPL);
							$tr.append($tdUser);
							$tr.append($tdCD);
							$tr.append($tdAD);
							$(".list_content").append($tr);
							
						}
						
					}else{
						alert("검색 결과가 없습니다.");									
					}
				}, error : function(data){
					alert("검색 결과가 없습니다.");
				}
			});
		}
		function replyIn(){
			location.href="productInquiry.do";
		}
	</script>
</div>
</body>
</html>