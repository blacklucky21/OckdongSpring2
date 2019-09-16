<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.junwo.ockdong.myOwn.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.wrapAddRecipe{
	margin-top: 5%;
	width:100%;
}
.wrapAddRecipe>div{
	margin-left: auto;
	margin-right: auto;
}
.addRecipe{
	width:100%;
	height: 1500px;
	text-align: center;
}
.imgArea{
	
}
.Ingredients th{
	width: 110px;
}
.imgIn>img{
	width:100px;
	height:80px;
}
.Ingredients>table{
	margin-left: auto;
	margin-right: auto;
	width: 550px;
}
.theadColor{
	background: #2ecc71;
	border: 1px solid #fff;
	font-weight: bold;
	color: #fff;
}
.buttons input[type=button], .buttons input[type=submit]{
	border-radius: 15px;
	background: #2ecc71;
	border: 1px solid #fff;
	text-transform: uppercase;
	font-weight: bold;
	color: #fff;
}

.buttons input[type=button]:hover, .buttons input[type=submit]:hover {
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
<link type="stylesheet" href="resources/css/bootstrap.css"/>
<body>
	<c:import url="../header/header.jsp" />
	<div class="wrapAddRecipe">
		<form id="formChange" action="myPagePaymentInsert.do" method="post">
			<div class="addRecipe">
				<div class="input-group mb-3" style="width: 40%; margin-left: auto; margin-right: auto;">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1" style="color:#fff; background: #2ecc71">제목 : </span>
					</div>
					<input type="text" id="racipeName" name="racipeName" value="${mblR.mblTitle }" class="form-control" placeholder="나만의 도시락의 제목을 적어주세요." aria-label="Username" aria-describedby="basic-addon1" style="background-color:white;" readonly>
				</div>
				<br clear="all">
				<div class="imgArea">
					<input type="hidden" name="fileName" id="fileName" value="${mblR.mblFileName }"/>
					<img src="resources/img/Recipe/${mblR.mblFileName }" style="width: 600px; height: 480px;"/>
					<% MBLRecipe mblR = (MBLRecipe)request.getAttribute("mblR");
					   System.out.println("화면으로 넘어온 fileName : " + mblR.getMblFileName());%>
				</div>
				<div class="Ingredients">
					<table class="table">
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
					<input class="myOwnInsertBtn" type="submit" onclick="return validate();" value="결제하기" style="width: 180px; height: 50px;" />
					<input class="myOwnBackBtn" type="button" value="뒤로가기" style="width: 100px; height: 50px;" />
				</div>
				<br clear="all">
			</div>
		</form>
	</div>
	<c:import url="../footer/footer.jsp" />
	<script>
		function validate(){
			if(confirm("결제하시겠습니까?")){
				return true;
			}
			return false;
		}
		$(function(){
			$(".myOwnBackBtn").click(function(){
				history.back();
			});
		});
		
		$(function(){
			
		});
	</script>
</body>
</html>