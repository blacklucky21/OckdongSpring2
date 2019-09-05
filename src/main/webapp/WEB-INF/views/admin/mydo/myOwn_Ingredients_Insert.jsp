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
<script type="text/javascript" src="resources/js/admin/productinsert.js"></script>
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
								<td class="sub"><input type="text" name="iName" id="iName"></td>
							</tr>
							<tr>
								<th class="head">도시락 타입</th>
								<td class="sub">
									<input type="radio" name="nCategory" class="lType" checked="checked" ><label>4찬</label>
									<input type="radio" name="nCategory" class="lType" ><label>5찬</label>
								</td>
							</tr>
							<tr class="typeResult">
								<th class="head"><span id="typeTitle">4찬<input type='hidden' id="nCategory" name='lType' value='4찬'/></span></th>
								<td class="sub">
									<select id="select4" name="selected4">
										<option id="4rice">밥</option>
										<option id="4main">메인</option>
										<option id="4sub1">서브1</option>
										<option id="4sub2">서브2</option>
									</select>
									<select id="select5" name="selected4">
										<option id="5rice">밥</option>
										<option id="5main">메인</option>
										<option id="5sub1">서브1</option>
										<option id="5sub2">서브2</option>
										<option id="soup">국</option>
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
								<th class="head">판매가</th>
								<td class="sub mi"><input type="text" name="sell" id="sell" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >&nbsp;원 <span><label id="hide">가격은 10원 단위로 입력이 가능합니다.</label></span></td>
							</tr>
							<tr>
								<th class="head">1인분 기준 양</th>
								<td class="sub mi"><input type="text" name="Inventory" id="Inventory" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">&nbsp;g</td>
							</tr>
							<tr style="height: 320px;">
								<th class="head">상품 이미지</th>
								<td class="sub mi">
									<img id="imgArea" name="imgArea" width="300" height="300" src="">
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="insert_middle">
					<input type="button" value="추가하기" onclick="return validate();"/>
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
				if (value.files && value.files[0]) {
					var reader = new FileReader();

					reader.onload = function(e) {$("#imgArea").attr("src", e.target.result);}

					reader.readAsDataURL(value.files[0]);
				}
			}
		
			$(function(){
				$("#select5").css("display","none");
				$(".lType").click(function(){
					console.log($(".lType"));
					console.log($(".lType")[0].checked);
					if($(".lType")[0].checked == "1"){
						$("#typeTitle").empty();
						$("#typeTitle").html("4찬<input type='hidden' id='nCategory' name='lType' value='4찬'/>");
			            $("#select4").css("display","block");
			            $("#select5").css("display","none");
			        }else if($(".lType")[0].checked == "0"){
			        	$("#typeTitle").empty();
						$("#typeTitle").html("5찬<input type='hidden' id='nCategory' name='lType' value='5찬'/>");
			        	$("#select4").css("display","none");
			        	$("#select5").css("display","block");
			        }
				});
			});
			
			function validate(){
				var iName = $("#iName").val();
				var nCategory = $("#nCategory").val();
				var sell = $("#sell").val();
				var inventory = $("#Inventory").val();
				var imgArea = $("#imgArea");
				
				if(iName != "" && nCategory != "" && sell != "" && inventory != "" && imgArea.attr("src") != ""){
					console.log("iName : " + iName + ", nCategory : " + nCategory + ", sell : " + sell + ", inventory : " + inventory);
					console.log("이미지 있음");
					return true;
				}
				
				
				return false;
			}
		</script>
	</div><!-- warp 끝 -->
</body>
</html>