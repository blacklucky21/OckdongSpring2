<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0" />
<title>공지사항 - 수정하기</title>
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


</style>

</head>

<body>

	<!-- ############### 헤더 부분 ############### -->
	<c:import url="../header/header.jsp" />
	<jsp:include page="../board/floalaResources.jsp"/>
	<br>

	<!---------------------------------- 게시글 작성 페이지(글쓰기) ---------------------------------->
		<div class="container">
				<!------------------------------------------------------------------------------------------>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<h2 class="text-left">수정하기</h2>
						<hr class="hrline"><br>
						<p></p>
						<!------------------------------ 카테고리 ------------------------------>
						<form action="updateNotice.do" method="post" name="form1" enctype="multipart/form-data">
						<input type="hidden" name="page" value="${ page }">
						<input type="hidden" name="nNo" value="${ notice.nNo }">
							<div class="table table-responsive">
								<table class="table table-striped">
									<!------------------------------ 글 제목 ------------------------------>
									<tr>
										<td>제목</td>
										<td><input type="text" class="form-control"
											name="nTitle" value= "${notice.nTitle}"></td>
										<td>
											<input type="hidden" name = "nNo" value = "${notice.nNo}" />
										</td>
									</tr>

								</table>
								<!------------------------------ 글작성 공간 (froala editor) ------------------------------>
								<textarea id="edit" name="nContent">${notice.nContent}</textarea>
								<!-- <div id="editor" >
									<div id='edit' style="margin-top: 30px;">
									</div>
								</div> -->
								<!-- <div class="boardC">
									<textarea id="board_content" name="board_content" rows="2" cols="40"></textarea>
								</div> -->
								
								<!-- <div id="editor">
									<div id='edit' style="margin-top: 30px;">
										
									</div>
								</div> -->
								
							</div>
						<div class="boardWriteBtn">
							<input id="btnSave" type="submit" value="작성하기" class="btn btn-success">
							<input type="button" value="취소" class="btn btn-warning" onclick="history.back();">
						</div>
						</form>
						<!------------------------------ 작성완료, 취소 버튼 ------------------------------>
					</div>
				</div>
				<!------------------------------------------------------------------------------------------>
			</div>
			<br><br><br><br><br><br><br><br><br>

	<script>
		/* froala editor를 textarea에 적용 */
	  	$(function(){
    		  $('#edit').froalaEditor()
   		 });
		/* 
		$(function() {
			$('#edit').froalaEditor().on(
					'froalaEditor.image.beforeUpload',
					function(e, editor, files) {
						if (files.length) {
							var reader = new FileReader();
							reader.onload = function(e) {
								var result = e.target.result;

								editor.image.insert(result, null, null,
										editor.image.get());
							};

							reader.readAsDataURL(files[0]);
						}

						return false;
					})
		}); */
		
		/* 전송 버튼 클릭시 해당 컨트롤러로 전송 */
		$(document).ready(function(){
			$("#btnSave").click(function(){
				var title = $("#nTitle").val();
				if(title == ""){
					alert("제목을 입력하세요.");
					location.href="${path}/ockdong/write.do";
					document.form1.title.focus();
				}
			});
		});
	</script>
	
	<c:if test="${empty sessionScope.loginUser}">
		<script>
			alert("로그인 후 이용해주세요.");
			location.href="${path}/ockdong/nlist.do";
		</script>
	</c:if>
</body>
</html>

