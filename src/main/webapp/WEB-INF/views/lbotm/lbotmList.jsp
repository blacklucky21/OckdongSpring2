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
<!-- <div class="contest">
 <div class="contest1">
  <div class="gallery">
  <p class="text-green" style="font-size:40px;"><strong>나만의 도시락</strong></p> 
  
  <form action="">
  <table>
  <tr>
  <td>
    <div class="gallery-item" onclick="location.href='bdetail.do'">
      <div class="gallery-item-image">
        <img src="http://tong.joins.com/wp-content/uploads/sites/3/2017/05/2017-05-25-11.01.25-1_resized_.jpg" style="width:300px; height:300px;"></div>
      <div class="gallery-item-description">
        <h3 class="contest_title">재혁이네 도시락</h3><span>치킨메뉴가 위주인 도시락</span></div>아이디 / 제목 받아오기 
    </div>
    </td>
    
    <td>
    <div class="gallery-item">
      <div class="gallery-item-image">
        <img src="http://webzine.nfm.go.kr/wp-content/uploads/2019/04/1170x765_%EB%8F%84%EC%8B%9C%EB%9D%BD-%ED%99%95%EC%A0%95.jpg" style="width:300px; height:300px;"></div>
      <div class="gallery-item-description">
        <h3 class="contest_title">성훈이네 도시락</h3><span>옛날 학교에서 먹는 도시락이 생각나는 그 맛..!!</span></div>
    </div>
    </td>
    
    <td>
    <div class="gallery-item">
      <div class="gallery-item-image">
        <img src="http://www.mrbossam.co.kr/images/sub/menu8_1.jpg" style="width:300px; height:300px;"></div>
      <div class="gallery-item-description">
        <h3 class="contest_title">섭씨네 도시락</h3><span>한끼 식사 든든히 섭씨네 보쌈 도시락</span></div>
    </div>
    </td>
    
    <td>
    <div class="gallery-item">
      <div class="gallery-item-image">
        <img src="https://dispatch.cdnser.be/wp-content/uploads/2018/12/20181218160830_main2.jpg" style="width:300px; height:300px;"></div>
      <div class="gallery-item-description">
        <h3 class="contest_title">경천이네 도시락</h3><span>하나뿐인 소고기 도시락!!<br>부위별로 맛볼수 있는 도시락</span></div>
    </div>
    </td>
   </tr> 
   
    <tr>
  <td>
    <div class="gallery-item">
      <div class="gallery-item-image">
        <img src="http://tong.joins.com/wp-content/uploads/sites/3/2017/05/2017-05-25-11.01.25-1_resized_.jpg" style="width:300px; height:300px;"></div>
      <div class="gallery-item-description">
        <h3 class="contest_title">재혁이네 도시락</h3><span>치킨메뉴가 위주인 도시락</span></div>
    </div>
    </td>
    
    <td>
    <div class="gallery-item">
      <div class="gallery-item-image">
        <img src="http://webzine.nfm.go.kr/wp-content/uploads/2019/04/1170x765_%EB%8F%84%EC%8B%9C%EB%9D%BD-%ED%99%95%EC%A0%95.jpg" style="width:300px; height:300px;"></div>
      <div class="gallery-item-description">
        <h3 class="contest_title">성훈이네 도시락</h3><span>옛날 학교에서 먹는 도시락이 생각나는 그 맛..!!</span></div>
    </div>
    </td>
    
    <td>
    <div class="gallery-item">
      <div class="gallery-item-image">
        <img src="http://www.mrbossam.co.kr/images/sub/menu8_1.jpg" style="width:300px; height:300px;"></div>
      <div class="gallery-item-description">
        <h3 class="contest_title">섭씨네 도시락</h3><span>한끼 식사 든든히 섭씨네 보쌈 도시락</span></div>
    </div>
    </td>
    
    <td>
    <div class="gallery-item">
      <div class="gallery-item-image">
        <img src="https://dispatch.cdnser.be/wp-content/uploads/2018/12/20181218160830_main2.jpg" style="width:300px; height:300px;"></div>
      <div class="gallery-item-description">
        <h3 class="contest_title">경천이네 도시락</h3><span>하나뿐인 소고기 도시락!!<br>부위별로 맛볼수 있는 도시락</span></div>
    </div>
    </td>
   </tr> 
   
    </table>
  </form> -->
  
  <%-- <div class="album py-5 bg-light">
        <div class="container">
          <div class="row">
          
          	<c:forEach var="row" items="${map.list}">
            <div class="col-md-4">
              <div class="card mb-4 box-shadow">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" 
                src="${ B_src }" data-holder-rendered="true">
                
                <div class="card-body">
                  <p class="card-text"><input name="B_Content" value="${ B_Content }"></p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                      <c:if test="${sessionScope.loginUser.userId == pt.id }">
                      <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                      </c:if>
                    </div>
                    <small class="text-muted">${ userId }</small>
                  </div>
                </div>
              </div>
            </div>
			</c:forEach>
			
			            
             <div class="col-md-4">
              <div class="card mb-4 box-shadow">
                <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" style="height: 225px; width: 100%; display: block;" 
                src="http://i.froala.com/download/fbde574c5a1b63fd29d568bfc29cd8b134e57254.jpg?1568858509" data-holder-rendered="true">
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
            </div>
            
            
          </div>
        </div>
      </div> --%>
      
      <div class="clear" style="height: 40px; background: white;"></div>
	<div class="container">
		<div class="row">
			<div class="left">
				<jsp:include page="../common/banner.jsp" />
				<h2 class="title">도시락 자랑하기</h2>
				<hr class="boardHr">
				<div class="clear" style="height: 20px; background: white;"></div>
				
				<c:forEach items="${list}" var="list" end="8">
				<div class="list">
					<div class="grid_4" id="tips" onclick="location.href='home.do?nNo=' + ${list.bNo}">
						<div class="gall_block">
							<div class="maxheight">
								<a href="${pageContext.request.contextPath}${list.files_root}${list.files_change_title}" class="gall_item" ><img src="${pageContext.request.contextPath}${list.files_root}${list.files_change_title}" alt="" style="width:300px; height:170px;"></a>
								<div class="gall_bot">
									<div class="boxbox">
										<div class="text1">
											<a onclick="location.href='home.do?board_no= ' + ${list.board_no}">${list.board_title}</a>
										</div>
										<div id="fonts">
											<label>${list.board_date}</label>&nbsp;|&nbsp;
											조회수&nbsp;<label style="color: red">${list.board_count }</label><%-- &nbsp;|&nbsp;
											좋아요&nbsp;<label style="color: red">${list.board_good }</label> --%>
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
			<jsp:include page="../common/rightBoard.jsp" />
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
	</div>
  
  <!-- ############### 순서 버튼  ############### -->
   <div class="pagination p7">
      <ul>
        <a class="is-active" href="#" style="text-decoration:none"><li>Previous</li></a>
        <a href="#" style="text-decoration:none; color: #2ecc71;"><li>Next</li></a>
      </ul>
    </div>
  </div>
  	
  <!-- ############### 글쓰기 버튼 ###############  --> 
  <div class="container" id="btnwrite">
 <button class="btn btn-danger" id="btnwrite1">글쓰기</button> 
  </div>
  </div>
</div>

<!-- ##################### 풋터 부분 ##################### -->
<c:import url="../footer/footer.jsp"/>

<script>
	// 글쓰기 버튼 클릭시 
	$(document).ready(function(){
		$("#btnwrite1").click(function(){
			location.href = "${path}/board/binsert.do";
		});
	});
</script>

</body>
</html>