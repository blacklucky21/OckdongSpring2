<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/boast/boastListView.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/album/">
<!-- <link href="album.css" rel="stylesheet"/> -->
<!-- <link type="text/css" rel="stylesheet" charset="UTF-8" href="https://translate.googleapis.com/translate_static/css/translateelement.css"/> -->
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<style>
#tips {
	width: 250px;
	height: 360px;
	margin-left: 10px;
}

[class*="grid_"] {
	float: left;
	min-height: 1px;
	margin-left: 10px;
}

.gall_block {
	width: 250px;
	height: 350px;
}

.boxbox {
	margin-top: -10px;
}

#fonts {
	font-size: 11px;
}
.list{width:110%}
.pagi{
	width: 70%;
    text-align: center;
    margin-top: 10px;
}
#homeBtn:hover{
	cursor:pointer;
	color : #aaccaa;
}
.text1{
	text-overflow: ellipsis;
    overflow: hidden;
    width: 100%;
    height: 20px;
    white-space: nowrap;
}
.pageWriteBtn{
	float:right; margin-right: -47px; width:70px; height:28px;
}
.title{font-weight: bold; margin-left: 8px;}
.boardHr{margin-left: 8px; 	width: 105%; border-top: 1.5px solid black;}
.right{margin-left: 100px !important; }
.gall_block:hover{
	box-shadow:2px 2px 4px #888;
	cursor: pointer;
}
</style>
<title>나만의 게시판</title>
</head>
<body>
<!-- ############### 헤더 부분 ############### -->
<c:import url="../header/header.jsp"/>
 
<!-- ############### 게시판 내용 ############### -->

	<div class="album py-5 bg-light">
		<div class="container">
			<div class="row">

				<c:forEach var="l" items="${ list }">
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">

							<c:if test="${ l.b_Src != null}">
								<img class="card-img-top"
									data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
									alt="Thumbnail [100%x225]"
									style="height: 225px; width: 100%; display: block;"
									src="${l.b_Src }" data-holder-rendered="true">
							</c:if>

							<c:if test="${ l.b_Src == null}">
								<img class="card-img-top"
									data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail"
									alt="Thumbnail [100%x225]"
									style="height: 225px; width: 100%; display: block;"
									src="http://camstech.co.kr/core/image/board/noimage.gif"
									data-holder-rendered="true">
							</c:if>

							<div class="card-body">
								<p class="card-text">${ l.b_Title }</p>
								<br>

								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">

										<c:url var="lbotmdetail" value="lbotmdetail.do">
											<c:param name="bNo" value="${ l.bNo }" />
											<c:param name="page" value="${ pi.currentPage }" />
											<c:param name="userId" value="${ userId }" />
										</c:url>
										<!-- <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='lbotmdetail.do'">View</button> -->
										<a href="${ lbotmdetail }">
											<button type="button"
												class="btn btn-sm btn-outline-secondary">View</button>
										</a>
										
										<c:if test="${sessionScope.loginUser.userId =='lbotm.userId' }">	
										<button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='lbotmUpdate.do'">Edit</button>
										</c:if>
									</div>
									<small class="text-muted"><a style="font-weight: bold;">닉네임</a>${ l.b_Nickname }</small>
									<small class="text-muted"><a style="font-weight: bold;">조회수</a>${ l.b_Count }</small>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>


			</div>
		</div>
		</div>
		
		<!-- ############### 순서 버튼  ############### -->
		<div class="w3-container" id="buttonTab">
			<div class="w3-bar"	style="text-align: center; text-decoration:none;">
			
				<c:if test="${ empty search }">
				
				 <!-- «이전  -->
				 <c:if test="${ pi.currentPage <= 1 }">
 				 	«이전 &nbsp;
				 </c:if>
				 <c:if test="${ pi.currentPage > 1 }">
				 	<c:url var="before" value="lbotmlist.do">
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
				 		<c:url var="pagination" value="lbotmlist.do">
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
				 	<c:url var="after" value="lbotmlist.do">
				 		<c:param name="page" value="${ pi.currentPage + 1 }"/>
				 	</c:url>
				 	<a href="${ after }" class="w3-button">다음»</a>
				 </c:if>
				</c:if>
			</div>
		<!-- ############### 글쓰기 버튼 ###############  -->
		<c:if test="${! empty sessionScope.loginUser}">
		<div class="container" id="btnwrite">
			<button class="btn btn-danger" id="btnwrite1"
				onclick="location.href='lbotmWrite.do'">글쓰기</button>
		</div>
		</c:if>
	</div>

	<!-- ##################### 풋터 부분 ##################### -->
<c:import url="../footer/footer.jsp"/>

</body>
</html>