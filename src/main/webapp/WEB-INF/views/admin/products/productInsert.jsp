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

</head>
<body>
	<div class="warp"><!-- 전체 감싸기  -->
		<c:import url="../adminheader.jsp" />
			<div id="content"> <!-- 전체 범위  -->
				<div class="content"><!-- nav 제외 범위 -->
				<form action="insertProduct.do" method="post" enctype="Multipart/form-data" >
				<!-- 상품 제목 -->
					<div class="page_title_wrap">
						<div class="page_tit">상품 등록</div>
					</div>
				<!-- 제목 끝 -->
				<!-- 상품 등록 상 -->
				<div class="insert_top">
					<span class="mt">기본 정보</span>
					<div class="sub_top">
						<table>
							<tr>
								<th class="head" >상품명</th>
								<td class="sub"><input type="text" name="p_name" id="pname"></td>
							</tr>
							<tr>
								<th class="head">카테고리</th>
								<td class="sub" >
									<input type="radio" name="p_lunchtype" id="pcategory" checked="checked" value="도시락" ><label>도시락</label>
									<input type="radio" name="p_lunchtype" id="pcategory" value="샐러드"><label>샐러드</label>
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
								<td class="sub mi"><input type="text" name="p_price" id="sell" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" >원 <span><label id="hide">가격은 10원 단위로 입력이 가능합니다.</label></span></td>
							</tr>
							<tr>
								<th class="head">재고 수량</th>
								<th class="sub mi"><input type="text" name="p_quantity" id="Inventory" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">개</th>
							</tr>
							
							<tr class="heim">
								<th class="head one">상품 이미지</th>
								<td><div class="prim"><img id="titleImgArea" name="titleImg" src="resources/img/admin/plus1.png" style="width: 88px; hegith:88px;"><span id="m1">대표이미지</span></div></td>
								<td><div class="prim"><img id="contentImgArea1" name="contentImg2" src="resources/img/admin/plus2.png" style="width: 88px; hegith:88px;"><span id="s1">추가이미지</span></div></td>
								<td><div class="prim"><img id="contentImgArea2" name="contentImg3" src="resources/img/admin/plus2.png" style="width: 88px; hegith:88px;"><span id="s2">추가이미지</span></div></td>
								<td><div class="prim"><img id="contentImgArea3" name="contentImg4" src="resources/img/admin/plus2.png" style="width: 88px; hegith:88px;"><span id="s3">추가이미지</span></div></td>
								<td> <div><input multiple="multiple" type="file" name="file" /></div><td>


							
							</tr>
							
							
							<tr style="height: 364px;">
								<th class="head" >상품 상세</th>
								<td class="sub"><div><textarea rows="" cols="" name="p_content"></textarea></div></td>
							</tr>
						</table>
					</div>
				</div>		
				<div>
							<input type="submit" value="등록" class="bu" onclick="check">
				</div>		
				<!-- 상품등록 중 끝 -->
				<div id="fileArea">
					<div id="area0"><img alt="" src=""><button onclick="areaDelete(0);"></button></div>
					<script type="text/javascript">
						function areaDelete(num){
							$('#area' + num).remove();
						}
					</script>
					
					
					<input type="file" id="thumbnailImg1" multiple="multiple"name="thumbnailImg1" onchange="LoadImg(this,1)">
					<input type="file" id="thumbnailImg2" multiple="multiple"name="thumbnailImg2" onchange="LoadImg(this,2)">
					<input type="file" id="thumbnailImg3" multiple="multiple"name="thumbnailImg3" onchange="LoadImg(this,3)">
					<input type="file" id="thumbnailImg4" multiple="multiple"name="thumbnailImg4" onchange="LoadImg(this,4)">
				</div>
			
			</form>
			</div><!-- nav 제외 범위 -->
		</div><!-- 전체 범위 부분 -->
	</div><!-- warp 끝 -->




</body>
<script>
$(function() {
	$("#fileArea").hide();

	$("#titleImgArea").click(function() {
		$("#thumbnailImg1").click();
		
	});
	$("#contentImgArea1").click(function() {
		$("#thumbnailImg2").click();
	});
	$("#contentImgArea2").click(function() {
		$("#thumbnailImg3").click();
	});
	$("#contentImgArea3").click(function() {
		$("#thumbnailImg4").click();
	});
	$("#contentImgArea4").click(function() {
		$("#thumbnailImg5").click();
	});
});


function LoadImg(value, num) {
	if (value.files && value.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			switch (num) {
			case 1:
				$("#titleImgArea").prop("src", e.target.result);
				break;
			case 2:
				$("#contentImgArea1").prop("src", e.target.result);
				break;
			case 3:
				$("#contentImgArea2").prop("src", e.target.result);
				break;
			case 4:
				$("#contentImgArea3").prop("src", e.target.result);
				break;
			}
		}

		reader.readAsDataURL(value.files[0]);
	}
}

// 등록 버튼이 눌렷을대 작동 하기
function check(){
	
}




</script>




</html>