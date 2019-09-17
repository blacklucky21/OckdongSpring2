<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!--[if lt IE 9]>
 <div style=' clear: both; text-align:center; position: relative;'>
   <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
     <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
   </a>
</div>
<script src="js/html5shiv.js"></script>
<link rel="stylesheet" media="screen" href="css/ie.css">
<![endif]-->
<style>
.boardName {
	display: block;
	font-size: 24px;
	padding-bottom: 8px;
	margin-bottom: 20px;
	border-bottom: 2px solid #5d5d5d;
	line-height: 1.3em;
	color: #2e2e2e;
	font-weight: 600;
}

.page1 h2 {
    padding-top: 31px;
    margin-bottom: 20px;
}

.boardSubject {
	font-size: 17px;
	font-weight: bold;
}
.view_text {
	width: 80%;
}
.proic {
	width: 35px;
	height: 35px;
}
.nick_em {
	display: inline-block;
}
.inner_nick_box {
	margin-top: 8px;
}

.date_menu li.da01 span {
	background:
		<%-- url("<%=request.getContextPath()%>/resources/img/boardImg/ico_time.gif") --%>
		url("${pageContext.request.contextPath}/resources/img/boardImg/ico_time.gif")
		no-repeat left 1px;
}

.date_menu li.da02 span {
	background:
		<%-- url("<%=request.getContextPath()%>/resources/img/boardImg/ico_eye.gif") --%>
		url("${pageContext.request.contextPath}/resources/img/boardImg/ico_eye.gif")
		no-repeat left 1px;
	color: #ff2626;
}

.date_menu li.da03 span {
	background:
		<%-- url("<%=request.getContextPath()%>/resources/img/boardImg/ico_balloon.gif") --%>
		url("${pageContext.request.contextPath}/resources/img/boardImg/ico_balloon.gif")
		no-repeat left 1px;
	color: #ff2626;
}

.date_menu li {
	background:
		<%-- url("<%=request.getContextPath()%>/resources/img/boardImg/bar_9.gif") --%>
		url("${pageContext.request.contextPath}/resources/img/boardImg/bar_9.gif")
		no-repeat left center;
	padding-left: 9px;
	margin-left: 0px;
}

.date_menu li span {
	display: inline-block;
	padding-left: 18px;
	margin-right: 12px;
}

.date_menu li:first-child {
	margin-left: 0;
	padding-left: 0;
	background: none;
}

.date_menu li {
	display: inline-block;
	color: #a1a0a0;
	font-size: 12px;
	line-height: 14px;
	font-weight: normal;
}

.group_inner {
	display: inline-block;
	margin-top: 10px;
	float: right;
}

.allmark {
	text-align: center;
	margin-top: 50px;
}

.allmark .bmark {
	background:
		<%-- url("<%=request.getContextPath()%>/resources/img/boardImg/bg_heart.gif") --%>
		url("${pageContext.request.contextPath}/resources/img/boardImg/bg_heart.gif") no-repeat;
	width: 150px;
	height: 50px;
	display: inline-block;
	line-height: 50px;
}

.allmark .bmark span {
	display: inline-block;
	padding-left: 32px;
	background:
		<%-- url("<%=request.getContextPath()%>/resources/img/boardImg/ico_bmark_off.png") --%>
		url("${pageContext.request.contextPath}/resources/img/boardImg/ico_bmark_off.png")
		no-repeat left center;
	font-weight: bold;
	font-size: 15px;
	color: #323232;
	font-weight: bold;
	vertical-align: top;
}
.allmark .bmark1 {
	background:
		<%-- url("<%=request.getContextPath()%>/resources/img/boardImg/bg_heart.gif") --%>
		url("${pageContext.request.contextPath}/resources/img/boardImg/bg_heart.gif")
		no-repeat;
	width: 150px;
	height: 50px;
	display: inline-block;
	line-height: 50px;
}
.allmark .bmark1 span {
	display: inline-block;
	padding-left: 32px;
	background:
		<%-- url("<%=request.getContextPath()%>/resources/img/boardImg/ico_bmark_on.png") --%>
		url("${pageContext.request.contextPath}/resources/img/boardImg/ico_bmark_on.png")
		no-repeat left center;
	font-weight: bold;
	font-size: 15px;
	color: #323232;
	font-weight: bold;
	vertical-align: top;
}
.allmark .heart {
	background:
		<%-- url("<%=request.getContextPath()%>/resources/img/boardImg/bg_heart.gif") --%>
		url("${pageContext.request.contextPath}/resources/img/boardImg/bg_heart.gif")
		no-repeat;
	width: 150px;
	height: 50px;
	display: inline-block;
	line-height: 50px;
	margin-left: 20px;
}

.allmark .heart span {
	display: inline-block;
	padding-left: 35px;
	background:
		<%-- url("<%=request.getContextPath()%>/resources/img/boardImg/ico_heart.png") --%>
		url(/webapp/resources/img/boardImg/ico_heart.png) no-repeat left center;
	font-weight: bold;
	font-size: 15px;
	color: #323232;
	font-weight: bold;
	vertical-align: top;
}

.allmark .heart1 {
	background:
		url("<%=request.getContextPath()%>/resources/img/boardImg/bg_heart.gif")
		no-repeat;
	width: 150px;
	height: 50px;
	display: inline-block;
	line-height: 50px;
	margin-left: 20px;
}
.allmark .heart1 span {
	display: inline-block;
	padding-left: 35px;
	background:
		<%-- url("<%=request.getContextPath()%>/resources/img/boardImg/ico_heartch.png") --%>
		url("${pageContext.request.contextPath}/resources/img/boardImg/ico_heartch.png")
		no-repeat left center;
	font-weight: bold;
	font-size: 15px;
	color: #323232;
	font-weight: bold;
	vertical-align: top;
}
.btn_ar {
	float: right;
	margin-top: 50px;
}
.tit_comment {
	margin-top: 130px;
}
.comment-write {
	background: #f9f9f9;
	border: 1px solid #ececec;
	padding: 15px;
	position: relative;
	margin-top: 12px;
}
-write textarea {
	width: 88%;
	height: 120px;
}

.btncmm1 {
	position: absolute;
	right: 10px;
	top: -9px; 
	width: 90px;
	height: 120px;
	margin-top: 25px;
}
#btncmm2 {
	position: absolute;
	right: 21px;
	top: -9px;
	width: 90px;
	height: 120px;
}
.hrline {
	border-top: 1px solid #cecece;
}
.comment-count {
	border-bottom: 1px solid #cecece;
	margin-top: 35px;
}
.comment-count-1 {
	display: inline-block;
	color: #383838;
	font-size: 13px;
}
.comment-count-2 {
	display: inline-block;
	font-size: 13px;
	color: #fa111a;
}
.comment-txt {
	display: inline-block;
	padding-left: 15px;
	width: 93%;
}
.comment-pic {
	display: inline-block;
}
.comment-list-li {
	padding-top: 15px;
}
#ptxt {
	padding-top: 7px;
}
.comment-txt tbody {
	padding-left: 10px;
}
.btn-re {
	padding-left: 70px;
	color: #545050;
}
.balist1 {
	margin-top: 30px;
}
.belist1, .aflist1 {
	color: #423f3f;
}
.belist2, .aflist2 {
	display: inline-block;
	padding-left: 18px;
}
.belist3, .aflist3 {
	display: inline-block;
	float: right;
	font-size: 14px;
	color: #9e9e9e;
	font-size: 15px;
}
.belist3{margin-right: -2px;}
.listpic {
	padding-left: 10px;
	padding-right: 10px;
}
.listpic1{
	float: right;
    margin-top: 24px;
    padding-left: 10px;
	padding-right: 10px;
	
}
.bSubject{font-size: 17px; font-weight: bold;}
.pageWriteBtn{margin-right: 12px;}
.pageWriteBtn:hover{cursor: pointer;}
.commentPro{width: 50px; height: 50px;}
.aflistp{display: inline-block;}
.re{padding-top: 10px;}
.modifyB, .deleteB{font-weight: 400; font-size:13px; float:right;	color:#9c9c9cbf; padding-top:13px;}
.modifyB:hover, .deleteB:hover{cursor: pointer;}
.remd{display: inline-block; float: right;}
.listpic2{padding-left: 10px; padding-bottom: 8px;}
.modifyB2, .deleteB2{font-weight: 400; font-size:13px;color:#9c9c9cbf;}
.modifyB2:hover, .deleteB2:hover{cursor: pointer;}
.paging-numbers a.on{background:#f13d3d;}
.container1{margin: auto; width:75%;}
#boardList:hover {cursor: pointer;}
.reportBoard{
width:85px;height: 30px; float:right; margin-top: -25px; text-align: center;
cursor: pointer; background: #f72e36; color: white; padding-top: 4px; border-radius: 4px; font-size: 15px;}
#reportContent{display:none;}
#rPopup{width: 260px; margin-left: 880px; margin-top: -170px; box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.5);}
#report{-webkit-appearance: radio !important;}
#closePopup{float:right; color:blue;}
#report{border-bottom: 1px solid #eee; margin-left: -150px;}
.pop_check{float: left;
    position: absolute;
    left: 1408px;
    margin-top: 5px;
    vertical-align: middle;}
#rli{cursor:pointer; margin-left: 34px;}
#rli:hover{background-color:#e4e4e4;}
#report:hover{cursor:pointer;}

</style>
<body>
	<!-- ############### 헤더 부분 ############### -->
	<c:import url="../header/header.jsp" />
	<br>
	<!---------------------------------- 게시글 상세페이지 ---------------------------------->
	
	<!--===================== Content======================-->
	
		<div class="container">
			<div class="row">
				<!---------------------------------------------------------------------------------------------------------------------------------------------->
				<div class="container1">
					<!-- 게시판 명 -->
					<%-- <c:if test="${detail.WRITING_TYPE == 1}">
						<h2 class="boardName">자유게시판				
					</c:if> --%>
					<h2 class="boardName">공지사항</h2>

					<!------------------------ 게시물 수정, 삭제 (로그인시 적용(해당 게시물 작성자만 가능하도록 설정)) ------------------------>
					<c:if test="${sessionScope.loginUser.userId == notice.id}">
					<c:url var="updateNoticePage" value="updateNoticePage.do">
						<c:param name="nNo" value="${ notice.nNo }"/>
						<c:param name="page" value="${ page }"/>
					</c:url>
					
					<span class="modifyB" onClick="location.href='${ updateNoticePage }'">수정</span>
					<%-- <span class="modifyB" onClick="location.href='${path}/ockdong/updateNoticePage.do?nNo=${notice.nNo}'">수정</span> --%>
					<img src="${pageContext.request.contextPath}/resources/img/boardImg/bar_9.gif" class="listpic1"> 
					<span class="deleteB" id="deleteB" onClick="location.href='${path}/ockdong/deleteNotice.do?nNo=${notice.nNo}'">삭제</span>
					</c:if>
					
					<td>
					<input type="hidden" name="id" value="${ notice.nNo }">
					</td>
					
					<!-- 게시글 제목 -->
					<div>
						<span class="bSubject">${ notice.nTitle }</span>
					</div>
					<hr class="hrline">
					<div class="boardInfo">
						<span class="inner">
						<span class="ico_wrap">
						<a href="#">
							<%-- <img src="<%=request.getContextPath()%>/resources/images/boardImg/img_male.gif" class="proic"> --%>
							<%-- <img src="${pageContext.request.contextPath}${detail.FILES_ROOT}${detail.FILES_CHANGE_TITLE}" class="proic"> --%>
							<img src="${pageContext.request.contextPath}/resources/img/boardImg/lee.jpg" class="proic">
						</a>
						
						</span>
							<!------------------------------------ 게시글 작성자명 ------------------------------------>
								<em class="nick_em">
								<div class="inner_nick_box">
									<p class="inner_nick">${ notice.nickName }</p>
								</div>
						</em> <!------------------------------------ 게시글 날짜, 조회수, 댓글수 ------------------------------------>
							<div class="group_inner">
								<ul class="date_menu">
									<li class="da01"><span>${ fn:substring(notice.nDate, 0, 16) }</span></li>
									<li class="da02"><span>${ notice.nCount }</span></li>
									<!-- 댓글 카운트  -->
 									<%--<li class="da03"><span>${detail.COMMENTS_COUNT}</span></li> --%>
									<li class="da03"><span id="rCount1"></span></li>
								</ul>
							</div>
						</span>
					</div>
					<hr class="hrline">

					<!------------------------------------ 게시글 내용 ------------------------------------>
					<div class="viewContent">
						<p class="view_text">${notice.nContent}</p>
					</div>

					<!------------------------------------ 북마크, 좋아요------------------------------------>
					<div class="allmark">
					<c:if test="${! empty sessionScope.loginUser}">
						<c:if test="${check1 == 0}">
						<a href="bookMark.do?board_no=${detail.BOARD_NO}" class="bmark"> <span>북마크</span></a>
						</c:if>
						<c:if test="${check1 != 0}">
						<a href="bookMark.do?board_no=${detail.BOARD_NO}" class="bmark1"> <span>북마크</span></a>
						</c:if>
						<c:if test="${check2 == 0}">
						<a href="like.do?board_no=${detail.BOARD_NO}" class="heart"><span>${likeCount} 3</span></a>
						</c:if>
						<c:if test="${check2 != 0}">
						<a href="like.do?board_no=${detail.BOARD_NO}" class="heart1"><span>${likeCount} 3</span></a>
						</c:if>
					</c:if>
					<c:if test="${empty sessionScope.loginUser}">
						<a href="#" class="bmark login" data-toggle="modal" data-target="#login-modal"> <span>북마크</span></a>
						<a href="#" class="heart login" data-toggle="modal" data-target="#login-modal"> <span>${likeCount}</span></a>
					</c:if>
					</div>
					
					<!------------------------------------ 글쓰기, 목록 ------------------------------------>
					<c:if test="${! empty sessionScope.loginUser}">
					<div class="btn_ar">
						<img id="writeBtn" class="pageWriteBtn" onclick="location.href='boardWrite.do'" src="${pageContext.request.contextPath}/resources/img/boardImg/btn_write2.gif">
						<img id="boardList" class="boardList" onclick="history.back();" src="${pageContext.request.contextPath}/resources/img/boardImg/btn_list.gif">	
					</div>
					</c:if>
					<c:if test="${empty sessionScope.loginUser}">
					<div class="btn_ar">
						<img id="writeBtn login" class="pageWriteBtn login" src="${pageContext.request.contextPath}/resources/img/boardImg/btn_write2.gif"
						 data-toggle="modal" data-target="#login-modal">
						<img id="boardList" class="boardList" onclick="history.back();" src="${pageContext.request.contextPath}/resources/img/boardImg/btn_list.gif">
					</div>
					</c:if>
					<div id="commList">
						<p class="tit_comment">
							<img src="<%=request.getContextPath()%>/resources/img/boardImg//tit_cmt_write.png">
						</p>
						<c:if test="${!empty sessionScope.loginUser}">
							<a href="javascript:" onClick="reportPopup('open')"> <span class="reportBoard" id="reportBoard">신고하기</span></a>
						</c:if>
						<c:if test="${empty sessionScope.loginUser}">
							<a data-toggle="modal" data-target="#login-modal"> <span class="reportBoard" id="reportBoard">신고하기</span></a>
						</c:if>
						<div id="reportContent">
							<div id="rPopup">
							<a href="javascript:" onClick="reportPopup('close')">
				            	<span id="closePopup">닫기</span>
        					</a>
								<ul class="reportWrap">
									<li onclick="choiceReport('${detail.BOARD_NO}', '광고/상업성 게시글 ', '${detail.MEMBER_NO }');" id="rli">광고/상업성 게시글 <input id="report" type="radio" value="1" class="pop_check"></li>
									<li onclick="choiceReport('${detail.BOARD_NO}', '비방/욕설 게시글', '${detail.MEMBER_NO }');" id="rli">비방/욕설 게시글 <input id="report" type="radio" value="2" class="pop_check"></li>
									<li onclick="choiceReport('${detail.BOARD_NO}', '개인정보 유출 게시글 ', '${detail.MEMBER_NO }');" id="rli">개인정보 유출 게시글 <input id="report" type="radio" value="3" class="pop_check"></li>
									<li onclick="choiceReport('${detail.BOARD_NO}', '청소년 유해(음란) 게시글 ', '${detail.MEMBER_NO }');" id="rli">청소년 유해(음란) 게시글 <input id="report" type="radio" value="4" class="pop_check"></li>
									<li onclick="choiceReport('${detail.BOARD_NO}', '명예훼손/저작권 침해 게시글 ', '${detail.MEMBER_NO }');" id="rli">명예훼손/저작권 침해 게시글 <input id="report" type="radio" value="5" class="pop_check"></li>	
									<li onclick="choiceReport('${detail.BOARD_NO}', '도배성 게시글 ', '${detail.MEMBER_NO }');" id="rli">도배성 게시글 <input type="radio"id="report" value="6" class="pop_check"></li>		
									<li onclick="choiceReport('${detail.BOARD_NO}', '불명확/추측성 게시글 ', '${detail.MEMBER_NO }');" id="rli">불명확/추측성 게시글 <input id="report" type="radio" value="7" class="pop_check"></li>		
								</ul>
							</div>
						</div>
						
						<!-- 
						---------------------------------- 댓글 작성 폼 ----------------------------------
						<div id="comment-write" class="comment-write">
							<form action="insertComment.do" name="form1" method="post">
								<textarea name="Comments_Content" id="Comments_Content" class="txtarea r5 placeholder" placeholder="댓글 등록 시 상대에 대한 비방이나 욕설 등은 피해주시고, 따뜻한 격려와 응원을 보내주세요~ 댓글에 대한 신고가 접수될 경우, 내용에 따라 즉시 삭제될 수 있습니다."
									onfocus="setFlag();"></textarea>
									
									<button type="submit" id="btncmm1" class="btn btn-primary">입력</button>
							</form>
						</div>	
					</div>

					---------------------------------- 게시글에 작성된 댓글 수 ----------------------------------
					<div class="comment-count">
						<p class="comment-count-1">댓글</p>
						<p class="comment-count-2" id="nCount"></p>
					</div>
 	
 				댓글 목록 보기 
				<table class="replyTable" id="rtb">
					<thead>
						<tr>
							<td colspan="2"><b id="rCount"></b></td>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				 -->

				<!-- 댓글 등록 부분 -->
				<div id="comment-write" class="comment-write">
				<table class="replyTable">
					<tr>
						<td><textarea cols="98" rows="5" id="Comments_Content" name="COMMENTS_CONTENT" class="txtarea r5 placeholder" placeholder="댓글 등록" onfocus="setFlag();" style="border: none;"></textarea></td>
						<td><button id="rSubmit" class="btn btn-primary btncmm1">입력</button></td>
					</tr>
				</table>
				</div>

				<!-- 댓글 목록 보기  -->
				<table class="comment-list" id="rtb">
					<thead class="comment-list-li">
						<tr class="comment-count">			
							<td colspan="2" class="comment-count-1"><b id="rCount" class="comment-count-2"></b></td>
						</tr>
					</thead>
					<tbody class="comment-txts"></tbody>
				</table>
				
				<script>
					$(function(){
						getCommentList();
						
						setInterval(function(){
							getCommentList();
						}, 10000);
					});
					
					// 댓글 등록 ajax
					$("#rSubmit").on("click", function(){
			         var Comments_Content = $("#Comments_Content").val();
			         var nNo = ${ notice.nNo };
			         
			         $.ajax({
			            url: "insertComment.do",
			            data: {Comments_Content: Comments_Content, nNo:nNo},
			            type: "post",
			            success: function(data){
			               if(data == "success"){
			            	   getCommentList();
			            	   $("#Comments_Content").val("");
			               }
			            }
			         });
			      });
					
					// 댓글 리스트 ajax
					function getCommentList(){
						var nNo = ${ notice.nNo };
						
						$.ajax({
							url: "commentList.do",
							data: {nNo:nNo},
							dataType: "json",
							success: function(data){ 	
								$tableBody = $("#rtb tbody");
								$tableBody.html("");
								
								var $tr;
								var $UserId;
								var $Comments_Content;
								var $Comments_Date;
								
								$("#rCount").text("댓글 (" + data.length + ")");
								$("#rCount1").text(data.length);
								
								if(data.length > 0){
									for(var i in data){
										$tr = $("<tr>");
										$UserId = $("<td class='comment-txt' style='font-weight: bold;'>").text(data[i].UserId);
										$Comments_Content = $("<td class='ptxt'>").text(decodeURIComponent(data[i].Comments_Content.replace(/\+/g, " ")));
										$Comments_Date = $("<td width='100' >").text(data[i].Comments_Date);
									
										
										$tr.append($UserId);
										$tr.append($Comments_Content);
										$tr.append($Comments_Date);
										$tableBody.append($tr);
									}
									
									} else {
										$tr = $("<tr>");
										$Comments_Content = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
										
										$tr.append($Comments_Content);
										$tableBody.append($tr);
									}
								}	
						});
					}
					
				</script>

				<!---------------------------------- 댓글 페이징 처리 ---------------------------------->
					<div class="paginate">
						<c:if test="${ pi.currentPage <= 1 }">
							[이전] &nbsp;
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="blistBack" value="view.do">
								<c:param name="currentPage" value="${ pi.currentPage -1 }"/>
								<c:param name="board_no" value="${detail.BOARD_NO}"/>
							</c:url>
							<a href="${ blistBack }">[이전]</a>
						</c:if>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<font color="red" size="4"><b>[${ p }]</b></font>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="blistCheck" value="view.do">
									<c:param name="currentPage" value="${ p }"/>
									<c:param name="board_no" value="${detail.BOARD_NO}"/>
								</c:url>
								<a href="${ blistCheck }">${ p }</a>
							</c:if>
						</c:forEach>
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							&nbsp; [다음]
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage}">
							<c:url var="blistEnd" value="view.do">
								<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
								<c:param name="board_no" value="${detail.BOARD_NO}"/>
							</c:url>
							&nbsp; 
							<a href="${ blistEnd }">[다음]</a>
						</c:if>
					</div>

					<hr class="hrline">
					<!------------------------------------ 다음글 제목, 날짜, 조회수 ------------------------------------>
					<%-- <div class="balist1">
						<a href="#" class="aflist1">다음글 ▲
							<p class="aflist2">저녁추천좀요</p>
						</a>
						<div class="aflist3">
							<p class="aflistp">17:30</p>
							<img src="<%=request.getContextPath()%>/resources/images/boardImg/bar_9.gif" class="listpic">
							<p class="aflistp">조회수 10</p>
						</div>
					</div>
					<!------------------------------------ 이전글 제목, 날짜, 조회수 ------------------------------------>
					<div>
						<a href="#" class="belist1">이전글 ▼
							<p class="belist2">오늘 먹은 점심임니다</p>
						</a>
						<div class="belist3">
							<p class="aflistp">13:30</p>
							<img src="<%=request.getContextPath()%>/resources/images/boardImg/bar_9.gif" class="listpic">
							<p class="aflistp">조회수 32</p>
						</div>
					</div> --%>
				</div>
				<!-------------------------------------------------------------------------->
			</div>
		</div>
	
<script>
	$(document).ready(function(){
		$().UItoTop({ easingType: 'easeOutQuart' });
		$('#stuck_container').tmStickUp({});
		$('.gallery .gall_item').touchTouch();
	}); 

	//목록 버튼
	/* $(document).ready(function(){
		$("#boardList").click(function(){
			location.href="${path}/baraonda/list.do?writing_type=${detail.WRITING_TYPE}";
		});
	});	 */
	
	//게시물 삭제 버튼 (취소눌르면 삭제되고 400에러뜬다)
	$(document).ready(function(){
		$("#deleteB").click(function(){
			if(confirm("삭제하시겠습니까?") == true){
				document.form.submit();
			}else{ //취소
				/* location.href="${path}/baraonda/view.do?board_no=${detail.BOARD_NO}"; */
				location.href="${path}/ockdong/ndetail.do?nNo=${notice.nNo}";
			}
		});
	});
	
	//댓글 삭제 버튼
	$(document).ready(function(){
		$(".deleteB2").click(function(){
			if(confirm("삭제하시겠습니까?") == true){
				document.form.submit();
			}else{ //취소
				location.href="${path}/baraonda/view.do?board_no=${detail.BOARD_NO}";
			}
		});
	});
	
	//댓글 내용 입력 체크
	$(document).ready(function(){
		$("#btncmm1").click(function(){
			var comment = $("#comment").val();
			if(comment == ""){
				alert("내용을 입력하세요.");
				document.getElementById('comment').focus();
				return false;
			}
			document.form1.submit();
		});
	});
	
	//신고하기 팝업
	function reportPopup(type){
		if(type == 'open'){
			$("#reportContent").attr('style', 'display:inline');
		}else if(type == 'close'){
			$("#reportContent").attr('style', 'display:none');
		}
	}
	
	//신고하기 버튼 이벤트
	function choiceReport(board_no, report_comment, report_get_no){
		if(confirm("해당 게시글을 신고하시겠습니까?") == true){
			$.ajax({
				url:"report.do",
				rype:"post",
				data:{board_no:board_no, report_comment:report_comment, report_get_no:report_get_no}
			});
			alert("신고가 완료되었습니다.");
			$("#reportContent").attr('style', 'display:none');
		}else{
			$("#reportContent").attr('style', 'display:none');
		}
	}
	
</script>

	<!-- ##################### 풋터 부분 ##################### -->
	<c:import url="../footer/footer.jsp" />
	
</body>
</html>