<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.junwo.ockdong.myOwn.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myOwn_Recipe_detail</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/admin/productinsert.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.content{
	margin-left:220px;
	margin-top:50px;
	text-align:center;
}
.imgArea{
	width:300px;
	height:300px;
}
table{
	width:600px;
	margin-left: auto;
	margin-right: auto;
}
.theadColor{
	background: #2ecc71;
	border: 1px solid #fff;
	font-weight: bold;
	color: #fff;
}
.imgIn>img{
	width:100px;
	height:100px;
}
.tableDiv{
	text-align:center;
}
nav.mo_slide_menu {
	height:110% !important;
}
.buttons{
	margin-top: 3%;
}
.buttons input[type=button]{
	border-radius: 15px;
	background: #2ecc71;
	border: 1px solid #fff;
	text-transform: uppercase;
	font-weight: bold;
	color: #fff;
}

.buttons input[type=button]:hover {
	color: #2ecc71;
	background: #fff;
	border: 1px solid #2ecc71;
	transition-duration: 1s;
	transform-origin: top left;
	-webkit-transition: all 1s;
	-moz-transition: all 1s;
	-o-transition: all 1s;
	transition: all 1s;
}
</style>
</head>
<body>
<div class="warp"><!-- 전체 감싸기  -->
	<c:import url="../adminheader.jsp" />
	
	<div class="content">
		<div class="imgAreaContent">
			<input type="hidden" id="mblId" value="${mbl.mblId }"/>
			<img class="imgArea" src="resources/img/Recipe/${mbl.mblFileName }">
		</div>
		<div class="tableDiv">
			<table>
				<thead class="theadColor">
					<tr>
						<th scope="col"></th>
						<th scope="col">재료 타입</th>
						<th scope="col">재료 명</th>
						<th scope="col">재료 양(g)</th>
					</tr>
				</thead>
				<tr>
					<td class="imgIn" scope="row">
						<input type="hidden" name="riceNo" value="${rice.inNo }"/>
						<c:if test="${rice.inType eq '1_밥'}">
							<img name="rice" src="resources/img/myOwn/4찬/${rice.inType}/${rice.inRenameFile }"/>
						</c:if>
						<c:if test="${rice.inType eq '5_밥' }">
							<img name="rice" src="resources/img/myOwn/5찬/${rice.inType}/${rice.inRenameFile }"/>
						</c:if>
					</td>
					<td>
						${rice.inType }
					</td>
					<td>
						${rice.inName }
					</td>
					<td>
						${rice.inGram }
					</td>
				</tr>
				<tr>
					<td class="imgIn" scope="row">
						<input type="hidden" name="mainNo" value="${main.inNo }"/>
						<c:if test="${main.inType eq '4_메인'}">
							<img name="main" src="resources/img/myOwn/4찬/${main.inType}/${main.inRenameFile }"/>
						</c:if>
						<c:if test="${main.inType eq '6_메인' }">
							<img name="main" src="resources/img/myOwn/5찬/${main.inType}/${main.inRenameFile }"/>
						</c:if>
					</td>
					<td>
						${main.inType }
					</td>
					<td>
						${main.inName }
					</td>
					<td>
						${main.inGram }
					</td>
				</tr>
				<tr>
					<td class="imgIn" scope="row">
						<input type="hidden" name="sub1No" value="${sub1.inNo }"/>
						<c:if test="${sub1.inType eq '2_서브1'}">
							<img name="sub1" src="resources/img/myOwn/4찬/${sub1.inType}/${sub1.inRenameFile }"/>
						</c:if>
						<c:if test="${sub1.inType eq '7_서브1' }">
							<img name="sub1" src="resources/img/myOwn/5찬/${sub1.inType}/${sub1.inRenameFile }"/>
						</c:if>
					</td>
					<td>
						${sub1.inType }
					</td>
					<td>
						${sub1.inName }
					</td>
					<td>
						${sub1.inGram }
					</td>
				</tr>
				<tr>
					<td class="imgIn" scope="row">
						<input type="hidden" name="sub2No" value="${sub2.inNo }"/>
						<c:if test="${sub2.inType eq '3_서브2'}">
							<img name="sub2" src="resources/img/myOwn/4찬/${sub2.inType}/${sub2.inRenameFile }"/>
						</c:if>
						<c:if test="${sub2.inType eq '8_서브2' }">
							<img name="sub2" src="resources/img/myOwn/5찬/${sub2.inType}/${sub2.inRenameFile }"/>
						</c:if>
					</td>
					<td>
						${sub2.inType }
					</td>
					<td>
						${sub2.inName }
					</td>
					<td>
						${sub2.inGram }
					</td>
				</tr>
				<c:if test="${soup.inType eq '9_수프'}">
					<tr>
						<td class="imgIn" scope="row">
							<input type="hidden" name="soupNo" value="${soup.inNo }"/>
							<img name="soup" src="resources/img/myOwn/5찬/${soup.inType}/${soup.inRenameFile }"/>
						</td>
						<td>
							${soup.inType }
						</td>
						<td>
							${soup.inName }
						</td>
						<td>
							${soup.inGram }
						</td>
					</tr>
				</c:if>
			</table>
		</div>
		<div class="buttons">
			<input class="myOwnDeleteBtn" type="button" value="삭제하기" style="width: 100px; height: 50px;" />
			<input class="myOwnBackBtn" type="button" value="뒤로가기" style="width: 100px; height: 50px;" />
		</div>
	</div>
</div><!-- 전체 범위 부분 -->
<script>
	$(function(){
		$(".myOwnBackBtn").click(function(){
			history.back();
		});
		
		$(".myOwnDeleteBtn").click(function(){
			
			if(confirm("레시피를 삭제하시겠습니까?")){
				var mblId = $("#mblId").val();
				location.href="myOwnRecipeDel.do?mblId=" + mblId;
			}
		});
	});
</script>
</body>
</html>