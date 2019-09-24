<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.junwo.ockdong.myOwn.model.vo.Ingredient" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String[] str = new String[9];
	Ingredient in = (Ingredient)request.getAttribute("ingredient");
	switch(in.getInType()){
		case "1_밥":
			str[0] = "selected";
			break;
		case "2_서브1":
			str[1] = "selected";
			break;
		case "3_서브2":
			str[2] = "selected";
			break;
		case "4_메인":
			str[3] = "selected";
			break;
		case "5_밥":
			str[4] = "selected";
			break;
		case "6_메인":
			str[5] = "selected";
			break;
		case "7_서브1":
			str[6] = "selected";
			break;
		case "8_서브2":
			str[7] = "selected";
			break;
		case "9_수프":
			str[8] = "selected";
			break;
	}
	
	String[] cateType = new String[2];
	String oldCate = "";
	switch(in.getInType()){
		case "1_밥": case "2_서브1": case "3_서브2": case "4_메인":
			cateType[0] = "checked";
			oldCate = "4찬\\\\" + in.getInType();
			break;
		case "5_밥": case "6_메인": case "7_서브1": case "8_서브2": case "9_수프":
			cateType[1] = "checked";
			oldCate = "5찬\\\\" + in.getInType();
			break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 시작 -->
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/admin/productinsert.css">
<!-- css 끝 -->

<!-- js 시작 -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
.insert_middle, .insert_top{
	border: 0px solid white;
	margin-left: 10px;
}
.insert_middle{
	margin-top : 0px;
}
.sub > input[type='text'] {
    width: 300px;
}
.imgArea{
	border: 1px solid black;
}
.deleteImg{
	position: relative;
	right: 38px;
    bottom: 15px;
    width: 30px;
    height: 30px;
    margin-bottom: 70%;
}
.deleteImg:hover{
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="warp"><!-- 전체 감싸기  -->
		<c:import url="../adminheader.jsp" />
			<div id="content"> <!-- 전체 범위  -->
				<div class="content"><!-- nav 제외 범위 -->
				<form action="Ingredients_Update.do" method="post" enctype="Multipart/form-data">
				<!-- 상품 제목 -->
					<div class="page_title_wrap">
						<div class="page_tit">재료 수정</div>
					</div>
				<!-- 제목 끝 -->
				<!-- 상품 등록 상 -->
				<div class="insert_top">
					<span class="mt">기본 정보</span>
					<div class="sub_top">
						<table>
							<tr>
								<th class="head">재료명<input type="hidden" name="inNo" id="inNo" value="${ingredient.inNo}"></th>
								<td class="sub"><input type="text" name="inName" id="inName" value="${ingredient.inName}"></td>
								
							</tr>
							<tr>
								<th class="head">도시락 타입</th>
								<td class="sub">
									<input type="hidden" name="nOldCateAndType" value="<%=oldCate%>"/>
									<input type="radio" name="nCategory" class="lType" <%=cateType[0]%>><label>4찬</label>
									<input type="radio" name="nCategory" class="lType" <%=cateType[1]%>><label>5찬</label>
								</td>
							</tr>
							<tr class="typeResult">
								<c:if test="${fn:contains(ingredient.inType, '1_밥') || fn:contains(ingredient.inType, '2_서브1') || fn:contains(ingredient.inType, '3_서브2') || fn:contains(ingredient.inType, '4_메인')}">
									<th class="head"><span id="typeTitle">4찬<input type='hidden' id="inCategory" name="inCategory" value="4찬"/></span></th>
									<td class="sub">
										<select id="select4" name="selected4">
												<option id="4rice" <%=str[0] %>>1_밥</option>
												<option id="4sub1" <%=str[1] %>>2_서브1</option>
												<option id="4sub2" <%=str[2] %>>3_서브2</option>
												<option id="4main" <%=str[3] %>>4_메인</option>
										</select>
										<select id="select5" name="selected5" style="display:none;">
											<option id="5rice">5_밥</option>
											<option id="5main">6_메인</option>
											<option id="5sub1">7_서브1</option>
											<option id="5sub2">8_서브2</option>
											<option id="soup">9_수프</option>
										</select>
									</td>
								</c:if>
								<c:if test="${fn:contains(ingredient.inType, '5_밥') || fn:contains(ingredient.inType, '6_메인') || fn:contains(ingredient.inType, '7_서브1') || fn:contains(ingredient.inType, '8_서브2') || fn:contains(ingredient.inType, '9_수프')}">
									<th class="head"><span id="typeTitle">5찬<input type='hidden' id="inCategory" name="inCategory" value="5찬"/></span></th>
									<td class="sub">
										<select id="select4" name="selected4" style="display:none;">
											<option id="4rice">1_밥</option>
											<option id="4sub1">2_서브1</option>
											<option id="4sub2">3_서브2</option>
											<option id="4main">4_메인</option>
										</select>
										<select id="select5" name="selected5">
											<option id="5rice" <%=str[4] %>>5_밥</option>
											<option id="5main" <%=str[5] %>>6_메인</option>
											<option id="5sub1" <%=str[6] %>>7_서브1</option>
											<option id="5sub2" <%=str[7] %>>8_서브2</option>
											<option id="soup" <%=str[8] %>>9_수프</option>
										</select>
									</td>
								</c:if>
							</tr>
						</table>
					</div>
				</div>
				<!-- 상품등록 상 끝  -->
				<!-- 상품등록 중 -->
				<div class="insert_middle">
					<span class="mt">판매 정보</span>
					<div class="sub_middle">
						<table>
							<tr>
								<th class="head">1인분 기준 양</th>
								<td class="sub mi"><input type="text" name="inGram" id="inGram" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${ingredient.inGram}">&nbsp;g</td>
							</tr>
							<tr style="height: 320px;">
								<th class="head">상품 이미지</th> 
								<td class="sub mi">
									<div style="float: left;">
										<c:if test="${fn:contains(ingredient.inType, '1_밥') || fn:contains(ingredient.inType, '2_서브1') || fn:contains(ingredient.inType, '3_서브2') || fn:contains(ingredient.inType, '4_메인')}">
											<img id="imgArea" class="imgArea" name="imgArea" width="300" height="300" onerror="delImg(this);" src="resources/img/myOwn/4찬/${ingredient.inType}/${ingredient.inRenameFile}">
										</c:if>
										<c:if test="${fn:contains(ingredient.inType, '5_밥') || fn:contains(ingredient.inType, '6_메인') || fn:contains(ingredient.inType, '7_서브1') || fn:contains(ingredient.inType, '8_서브2') || fn:contains(ingredient.inType, '9_수프')}">
											<img id="imgArea" class="imgArea" name="imgArea" width="300" height="300" onerror="delImg(this);" src="resources/img/myOwn/5찬/${ingredient.inType}/${ingredient.inRenameFile}">
										</c:if>
										<img id="deleteImg" class="deleteImg" src="resources/img/myOwn/del-logo.png"/>
										<input type="hidden" name="inOriginalFile" value="${ingredient.inOriginalFile }"/>
										<input type="hidden" name="inRenameFile" value="${ingredient.inRenameFile}"/>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="insert_middle">
					<input type="submit" value="수정하기" onclick="return validate();"/>
					<input class="backBtn" type="button" value="뒤로가기"/>
				</div>
				<div style="display:none;">
					<input type="file" id="ingredientImg" multiple="multiple" name="ingredientImg" onchange="LoadImg(this);">
				</div>
				<!-- 상품등록 중 끝 -->
			</form>
			</div><!-- nav 제외 범위 -->
		</div><!-- 전체 범위 부분 -->
		<script>
			$(function(){
				$("#imgArea").click(function() {
					$("#ingredientImg").click();
				});
			});
			
			$(function(){
				$("#ingredientImg").click();
			});
			
			function LoadImg(value) {
				console.log(value);
				if (value.files && value.files[0]) {
					var reader = new FileReader();

					reader.onload = function(e) {
						$("#imgArea").attr("src", e.target.result);
					}

					reader.readAsDataURL(value.files[0]);
					
					$("#deleteImg").css("display","block");
					$("#deleteImg").css({"right": -267, "bottom": 298});
				}
			}
		
			$(function(){
				$(".lType").click(function(){
					console.log($(".lType"));
					console.log($(".lType")[0].checked);
					if($(".lType")[0].checked == "1"){
						$("#typeTitle").empty();
						$("#typeTitle").html("4찬<input type='hidden' id='inCategory' name='inCategory' value='4찬'/>");
			            $("#select4").css("display","block");
			            $("#select5").css("display","none");
			        }else if($(".lType")[0].checked == "0"){
			        	$("#typeTitle").empty();
						$("#typeTitle").html("5찬<input type='hidden' id='inCategory' name='inCategory' value='5찬'/>");
			        	$("#select4").css("display","none");
			        	$("#select5").css("display","block");
			        }
				});
				
				
				$(".backBtn").click(function(){
					history.back();
				});
			});
			
			function validate(){
				
				if(!confirm("수정하시겠습니까?")){
					return false;
				}
				var inName = $("#inName").val();
				var inCategory = $("#inCategory").val();
				var inGram = $("#inGram").val();
				var imgArea = $("#imgArea");
				
				if(inName != "" && inCategory != ""&& inGram != "" && imgArea.attr("src") != "" && imgArea.attr("src") != "resources/img/myOwn/Plus-Add.png"){
					console.log("inName : " + inName + ", inCategory : " + inCategory + ", inGram : " + inGram);
					console.log("이미지 있음");
					return true;
				}
				
				
				alert("빈 칸이 있습니다. 전부 채워주세요...");
				
				
				return false;
			}
			
			$(function(){
				$("#deleteImg").click(function(){
					$("#imgArea").attr("src","");
					$("#deleteImg").css("display","none");
					$("#ingredientImg").files = null;
				});
			});
			
			function delImg(value){
				value.src="resources/img/myOwn/Plus-Add.png";
				console.log(value);
				$("#ingredientImg").val("");
				$("#imgArea").css("border","1px solid black");
			}
		</script>
	</div><!-- warp 끝 -->
</body>
</html>