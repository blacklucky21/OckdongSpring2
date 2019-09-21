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
          
            <!--  <div class="col-md-4">
              <div class="card mb-4 box-shadow">
               <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" 
                src="http://www.siminsori.com/news/photo/201908/215448_64500_521.jpg" data-holder-rendered="true"> 
                <div class="card-body">
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                    </div>
                    <small class="text-muted">아이디1</small>
                  </div>
                </div>
              </div>
            </div> -->
            
            <c:forEach var="l" items="${ list }">
             <div class="col-md-4">
              <div class="card mb-4 box-shadow">
              
              <c:if test="${ l.b_Src != null}">
               <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" 
                src="${l.b_Src }" data-holder-rendered="true"> 
               </c:if>
               
                <c:if test="${ l.b_Src == null}">
               <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" 
                src="http://camstech.co.kr/core/image/board/noimage.gif" data-holder-rendered="true"> 
               </c:if>
               
                <div class="card-body">
                  <p class="card-text">${ l.b_Title }</p><br>
                  
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                    
                    <c:url var="lbotmdetail" value="lbotmdetail.do">
                      <c:param name="bNo" value="${ l.bNo }"/>	
                      <c:param name="page" value="${ pi.currentPage }"/>
                      <c:param name="userId" value="${ userId }"/>
                    </c:url>  
                      <!-- <button type="button" class="btn btn-sm btn-outline-secondary" onclick="location.href='lbotmdetail.do'">View</button> -->
                      <a href="${ lbotmdetail }">
                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                      </a>
                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                    </div>
                    <small class="text-muted"><a style="font-weight:bold;">닉네임</a>${ l.b_Nickname }</small>
                    <small class="text-muted"><a style="font-weight:bold;">조회수</a>${ l.b_Count }</small>
                  </div>
                </div>
              </div>
            </div>
			</c:forEach>
            
            
          </div>
        </div>
        <!-- ############### 순서 버튼  ############### -->
   <div class="pagination p7">
      <ul style="margin-left:700px;">
        <a class="is-active" href="#" style="text-decoration:none"><li>Previous</li></a>
        <a href="#" style="text-decoration:none; color: #2ecc71;"><li>Next</li></a>
      </ul>
   </div>
  	
  <!-- ############### 글쓰기 버튼 ###############  --> 
  <div class="container" id="btnwrite">
 <button class="btn btn-danger" id="btnwrite1" onclick="location.href='lbotmWrite.do'">글쓰기</button> 
  </div>
      </div> 
      
      <script>
      </script>
      
      <%-- <div class="clear" style="height: 40px; background: white;"></div>
	<div class="container">
		<div class="row">
			<div class="left">
				<h2 class="title">도시락 자랑하기</h2>
				<hr class="boardHr">
				<div class="clear" style="height: 20px; background: white;"></div>
				
				<c:forEach items="${list}" var="list" end="8">
				<div class="list">
					<div class="grid_4" id="tips" onclick="location.href='home.do?nNo=' + ${list.bNo}">
						<div class="gall_block">
							<div class="maxheight">
								<a href="${pageContext.request.contextPath}${list.files_root}${list.files_change_title}" class="gall_item" >
								<img src="${pageContext.request.contextPath}${list.files_root}${list.files_change_title}" alt="" style="width:300px; height:170px;">
								</a>
								<div class="gall_bot">
									<div class="boxbox">
										<div class="text1">
											<a onclick="location.href='home.do?board_no= ' + ${list.board_no}">${list.board_title}</a>
										</div>
										<div id="fonts">
											<label>${list.board_date}</label>&nbsp;|&nbsp;
											조회수&nbsp;<label style="color: red">${list.board_count }</label>&nbsp;|&nbsp;
											좋아요&nbsp;<label style="color: red">${list.board_good }</label>
										</div>
										<img src="<%=request.getContextPath()%>/resources/images/boardImg/woman.png" style="width: 25px; height: 25px; border-radius: 20px">
										<a id="ba_font">홈트레이닝</a> <br> <a onclick="location.href='view.do?board_no=' + ${list.board_no}" class="btn">more</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		<div class="pagi">
						<c:if test="${ pi.currentPage <= 1 }">
							[이전] &nbsp;
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="blistBack" value="home.do">
								<c:param name="currentPage" value="${ pi.currentPage -1 }"/>
								<c:param name="writing_type" value="${writing_type}"/>
							</c:url>
							<a href="${ blistBack }">[이전]</a>
						</c:if>
						
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<font color="red" size="4"><b>[${ p }]</b></font>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="blistCheck" value="home.do">
									<c:param name="currentPage" value="${ p }"/>
									<c:param name="writing_type" value="${writing_type}"/>
								</c:url>
								<a href="${ blistCheck }">${ p }</a>
							</c:if>
						</c:forEach>
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							&nbsp; [다음]
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage}">
							<c:url var="blistEnd" value="home.do">
								<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
								<c:param name="writing_type" value="${writing_type}"/>
							</c:url>
							&nbsp; 
							<a href="${ blistEnd }">[다음]</a>
						</c:if>
					</div>
	</div> --%>

<!-- ##################### 풋터 부분 ##################### -->
<c:import url="../footer/footer.jsp"/>

</body>
</html>