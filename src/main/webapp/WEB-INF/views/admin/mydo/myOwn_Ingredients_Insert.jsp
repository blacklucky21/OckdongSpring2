<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
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
	background-image: url("resources/img/myOwn/Plus-Add.png");
	background-repeat: no-repeat;
	background-size: cover;
	border: 1px solid black;
}
.deleteImg{
	position: relative;
    right: -267px;
    bottom: 298px;
    width: 30px;
    height: 30px;
    margin-bottom: 70%;
    display: none;
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
				<form action="Ingredients_Insert.do" method="post" enctype="Multipart/form-data">
				<!-- 상품 제목 -->
					<div class="page_title_wrap">
						<div class="page_tit">재료 등록</div>
					</div>
				<!-- 제목 끝 -->
				<!-- 상품 등록 상 -->
				<div class="insert_top">
					<span class="mt">기본 정보</span>
					<div class="sub_top">
						<table>
							<tr>
								<th class="head">재료명</th>
								<td class="sub"><input type="text" name="inName" id="inName"></td>
							</tr>
							<tr>
								<th class="head">도시락 타입</th>
								<td class="sub">
									<input type="radio" name="nCategory" class="lType" checked="checked" ><label>4찬</label>
									<input type="radio" name="nCategory" class="lType" ><label>5찬</label>
								</td>
							</tr>
							<tr class="typeResult">
								<th class="head"><span id="typeTitle">4찬<input type='hidden' id="inCategory" name="inCategory" value="4찬"/></span></th>
								<td class="sub">
									<select id="select4" name="selected4">
										<option id="4rice">1_밥</option>
										<option id="4sub1">2_서브1</option>
										<option id="4sub2">3_서브2</option>
										<option id="4main">4_메인</option>
									</select>
									<select id="select5" name="selected5">
										<option id="5rice">5_밥</option>
										<option id="5main">6_메인</option>
										<option id="5sub1">7_서브1</option>
										<option id="5sub2">8_서브2</option>
										<option id="soup">9_수프</option>
									</select>
								</td>
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
								<td class="sub mi"><input type="text" name="inGram" id="inGram" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">&nbsp;g</td>
							</tr>
							<tr style="height: 320px;">
								<th class="head">상품 이미지</th>
								<td class="sub mi">
									<div style="float: left;">
										<img id="imgArea" class="imgArea" name="imgArea" width="300" height="300" onerror="delImg(this);">
										<img id="deleteImg" class="deleteImg" src="resources/img/myOwn/del-logo.png"/>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="insert_middle">
					<input type="submit" value="추가하기" onclick="return validate();"/>
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
			function LoadImg(value) {
				console.log(value);
				if (value.files && value.files[0]) {
					var reader = new FileReader();

					reader.onload = function(e) {$("#imgArea").attr("src", e.target.result);}

					reader.readAsDataURL(value.files[0]);
					
					$("#deleteImg").css("display","block");
				}
			}
		
			$(function(){
				$("#select5").css("display","none");
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
			});
			
			function validate(){
				var inName = $("#inName").val();
				var inCategory = $("#inCategory").val();
				var inGram = $("#inGram").val();
				var imgArea = $("#imgArea");
				
				if(inName != "" && inCategory != "" && inGram != "" && imgArea.attr("src") != "" && imgArea.attr("src") != "resources/img/myOwn/Plus-Add.png"){
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
				$("#imgArea").css("border","1px solid black");
				$("#ingredientImg").val("");
			}
		</script>
	</div><!-- warp 끝 -->
</body>
</html>