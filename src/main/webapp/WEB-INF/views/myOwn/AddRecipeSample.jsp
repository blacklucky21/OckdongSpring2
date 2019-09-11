<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	width:80%;
	margin-left:10%;
	height: 1500px;
	text-align: center;
	max-width: 1200px;
	min-width: 1200px;
}
.imgArea{
	display:inline-block;
	float: left;
	width: 450px;
	margin-left: 5%;
    margin-top: 3%;
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
</style>
<link type="stylesheet" href="resources/css/bootstrap.css"/>
<body>
	<c:import url="../header/header.jsp" />
	<div class="wrapAddRecipe">
		<div class="addRecipe" style="border: 1px solid black;">
			<!-- <label for="RecipeTitle"> 제목 : </label><input id="RecipeTitle" type="text" name="RecipeTitle" value=""/> -->
			<br clear="all">
			<div class="imgArea">
				<img src="resources/img/Recipe/${fileName }.png"/>
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
								<img name="sub2" src="resources/img/myOwn/5찬/${soup.inType}/${soup.inRenameFile }"/>
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
			
			<br clear="all">
			
			<div>
				
				
			</div>
			
		</div>
	</div>
	<c:import url="../footer/footer.jsp" />
</body>
</html>