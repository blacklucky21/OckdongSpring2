<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0" />
<title>도시락 자랑하기 - 글쓰기</title>
<style>
body {
	text-align: left;
}

div#editor {
	width: 100%;
	margin: auto;
	text-align: left;
	border: 1px solid #e4dbdbb5;
	border-top: none;
	margin-top: -31px;
}

.class1 {
	border-radius: 10%;
	border: 2px solid #efefef;
}

.class2 {
	opacity: 0.5;
}

.fr-element {
	height: 500px;
}

.table-striped {
	border-right: 1px solid #e4dbdbb5;
	border-left: 1px solid #e4dbdbb5;
}

.fr-top {
	border-top: 1px solid #e4dbdbb5;
}
.cateTd{width: 150px;}
.hrline {
	border-top: 1px solid #313131;
	margin-bottom: 4px;
}
#form_control {width: 150px; float:left;}
#board_content{height: 470px; width: 700px; margin-top: 20px;}
#froala-editor{{height: 470px; width: 700px; margin-top: 20px;}}
.fr-box{border: 1px solid #dee2e6; margin-top: -16px;}
.boardC{height: 500px; width: 730px; margin-top: -18px; border: 1px solid #dee2e6;}
.boardWriteBtn{text-align: center;}
.text-left{font-weight: bold;}

</style>

</head>

<body>
	<!-- ############### 헤더 부분 ############### -->
	<c:import url="../header/header.jsp" />

	<jsp:include page="../board/floalaResources.jsp"/>
	
	<!---------------------------------- 게시글 작성 페이지(글쓰기) ---------------------------------->
		<div class="container">
				<!------------------------------------------------------------------------------------------>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<h2 class="text-left">글쓰기</h2>
						<hr class="hrline"><br>
						<p></p>
						<!------------------------------ 카테고리 ------------------------------>
						<form action="lbotminsert.do" method="post" name="form1" enctype="multipart/form-data">
							<div class="table table-responsive">
								<table class="table table-striped">
									<!-- <tr>
										<td class="cateTd">카테고리</td>
										<td>
											<select name="writing_type" id="form_control" class="form-control input-xshort">
												<option value="11">공지사항</option>
												<option value="12">자유게시판</option>
											</select>
										</td>
									</tr> -->
									<!------------------------------ 글 제목 ------------------------------>
									<tr>
										<th id="title">제목</th>
										<td>
											<input id="b_Title" name="nTitle" type="text" class="form-control">
										</td>
										<th>작성자</th>
										<td>
											<input type="text" name="id" readonly value="${ loginUser.userId }">
										</td>
									</tr>

								</table>
								<!------------------------------ 글작성 공간 (froala editor) ------------------------------>
								<textarea id="edit" name="b_Content"></textarea>
								
							</div>
						<div class="boardWriteBtn">
							<input id="btnSave" type="button" value="작성하기" class="btn btn-success">
							<input type="button" value="취소" class="btn btn-warning" onclick="location.href='lbotmlist.do'">
						</div>
						</form>
						<!------------------------------ 작성완료, 취소 버튼 ------------------------------>
					</div>
				</div>
				<!------------------------------------------------------------------------------------------>
			</div>
			<br><br><br><br><br><br><br><br><br>
	<!-- ##################### 풋터 부분 ##################### -->
	<c:import url="../footer/footer.jsp" />

	<script>
		/* froala editor를 textarea에 적용 */	
	  	$('#edit').froalaEditor({   
	  		imageUploadURL:'http://i.froala.com/upload'});
		
		/* 전송 버튼 클릭시 해당 컨트롤러로 전송 */
		$(document).ready(function(){
			$("#btnSave").click(function(){
				var title = $("#nTitle").val();
				var content = $("#edit").val();
				if(title == ""){
					alert("제목을 입력하세요.");
					document.getElementById('title').focus();
					return;
				}
				if(content == ""){
					alert("내용을 입력하세요.");
					document.getElementById('edit').focus();
					return;
				}
				document.form1.submit();
			});
		});
	</script>
	
</body>
</html>





























