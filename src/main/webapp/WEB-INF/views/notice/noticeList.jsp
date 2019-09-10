<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<!-- Bootstrap CSS -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>board</title>

<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}

.searchForm{
	text-align: center;
}
</style>

<script>
	/*  $(document).ready( function() {
	    var jbExcerpt = $('.boardDay').text().substring( 0, 9 );
	      $('.boardDay').after('<th>' + jbExcerpt + '</th>' );
	 }); */
	
	/* function checkAll(){
		 if($("#noInput1").is(':checked')){
			 $("input[name=nNo]").prop("checked", true);
		 }else{
			 $("input[name=nNo]").prop("checked", false);
		 }
	 } 
	
	 var arrayParam = new Array();
	 
	 $("input:checkbox[name=nNo]:checked").each(function(){
		 arrayParam.push($(this).val());
	 });  */
	
</script>

</head>
<body>
	<!-- ############### 헤더 부분 ############### -->
	<c:import url="../header/header.jsp" />
	
	<!-- 게시판  -->	
	<h2 style="text-align: center">공지사항</h2>

	<h6 align="center">《《총 게시글 개수 : ${ pi.listCount }》》</h6>		
	<article>
		<div class="container">

			<div class="table-responsive">

				<table class="table table-striped table-sm">

					<colgroup>
						<col style="width: 5%;" />
						<col style="width: auto;" />
						<col style="width: 15%;" />
						<col style="width: 10%;" />
						<col style="width: 10%;" />
					</colgroup>

					<thead>

						<tr>
							<th class="nNo">NO</th>
							<th class="nTitle">글제목</th>
							<th class="nickName">작성자</th>
							<th class="nCount">조회수</th>
							<th class="nDate">작성일</th>
						</tr> 

					</thead>
					
					<tbody>
						<c:choose>
							<c:when test="${empty list }">
								<tr>
									<td colspan="5" align="center">데이터가 없습니다.</td>
								</tr>
							</c:when>
							<c:when test="${!empty list }">
								<c:forEach var="n" items="${ list }">
									<tr>
										<td>${ n.nNo }</td>
										<td>
										<c:url var="ndetail" value="ndetail.do">
											<c:param name="nNo" value="${ n.nNo }" />
											<c:param name="page" value="${ pi.currentPage }" />
										</c:url> 
										<a href="${ ndetail }" style=" text-decoration:none">${ n.nTitle }</a>
										<%-- <c:if test="${ empty loginUser }">
											${ n.nTitle }		
											</c:if> --%>
										</td>
										<td>${ n.id }</td>
										<td>${ n.nCount }</td>
										<td>${ n.nDate }</td>
									</tr>
								</c:forEach>
							</c:when> 
						</c:choose>
					</tbody>
				</table>
			</div> 
			
		
		<!-- 페이징 처리  -->
		<div class="w3-container" id="buttonTab">
			<div class="w3-bar"	style="text-align: center; text-decoration:none;">
			
				 <!-- «이전  -->
				 <c:if test="${ pi.currentPage <= 1 }">
 				 	«이전 &nbsp;
				 </c:if>
				 <c:if test="${ pi.currentPage > 1 }">
				 	<c:url var="before" value="nlist.do">
				 		<c:param name="page" value="${ pi.currentPage - 1 }"/>
				 	</c:url>				 
  				 <a href="${ before }" class="w3-button">«이전</a> &nbsp;
				 </c:if>
				 
				 <!-- 페이지 -->
				 <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				 	<c:if test="${ p eq cureentPage }">
				 		<font color="red" size="4"><a class="w3-button">${ p }</a></font>
				 	</c:if>
				 	
				 	<c:if test="${ p ne currentPage }">
				 		<c:url var="pagination" value="nlist.do">
				 			<c:param name="page" value="${ p }"/>
				 		</c:url>
				 		<a href="${ pagination }" class="w3-button">${ p }</a> &nbsp;
				 	</c:if>
				 </c:forEach>
				 
				 <!-- 다음» -->
				 <c:if test="${ pi.currentPage >= pi.maxPage }">
				 	&nbsp; 다음»
				 </c:if>
				 <c:if test="${ pi.currentPage < pi.maxPage }">
				 	<c:url var="after" value="nlist.do">
				 		<c:param name="page" value="${ pi.currentPage + 1 }"/>
				 	</c:url>
				 	<a href="${ after }" class="w3-button">다음»</a>
				 </c:if>
			</div>
		</div>

			<div>

				<button type="button" class="btn btn-sm btn-primary" id="boardWrite" onclick="location.href='boardWrite.do'">글쓰기</button>

			</div> 
			
			<!-- 검색  -->
			<form action="searchBoard.do" name="search" method="get" class="searchForm">
						<table>
							<tr>
								<td><select class="form-control input-xshort" name="searchType">
										<option value="nTitle">제목</option>
										<option value="nContent">내용</option>
										<option value="nickName">작성자</option>
								</select></td>
								<td><input id="boardInput" name="search"
									class="form-control input-short" type="text" placeholder="Search...">
								</td>
								<td><button id="boardBtn" type="submit"
										class="btn btn-primary">검색</button></td>
							</tr>
						</table>
					</form>
				</div>

	</article>



	<br>
	<br>

	<!-- ##################### 풋터 부분 ##################### -->
	<c:import url="../footer/footer.jsp" />
</body>
</html>



