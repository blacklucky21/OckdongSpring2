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

</head>
<body>
	<div class="warp"><!-- 전체 감싸기  -->
		<c:import url="../adminheader.jsp" />
			<div id="content"> <!-- 전체 범위  -->
				<div class="content"><!-- nav 제외 범위 -->
				<form action="updatePo.do" method="post" enctype="Multipart/form-data" id="location" >
				<!-- action="updatePo.do" -->
				<!-- 상품 제목 -->
					<div class="page_title_wrap">
						<div class="page_tit">상품 수정</div>
					</div>
					
				<input type="hidden" value="${ p.p_Id }" name="p_Id">
					
				<!-- 제목 끝 -->
				<!-- 상품 등록 상 -->
				<div class="insert_top">
					<span class="mt">기본 정보</span>
					<div class="sub_top">
						<table>
							<tr>
								<th class="head" >상품명</th>
								<td class="sub"><input type="text" name="p_name" id="pname"  value="${p.p_name}" required></td>
							</tr>
							<tr>
								<th class="head" >상품번호</th>
								<td class="sub" >${ p.p_Id } </td>
								
							</tr>
							
							<tr>
								<c:choose>
								<c:when test="${p.p_lunchtype eq '도시락'}">
								<th class="head">카테고리</th>
								<td class="sub" >
									<input type="radio" name="p_lunchtype" id="pcategory" checked="checked" value="도시락" ><label>도시락</label>
									<input type="radio" name="p_lunchtype" id="pcategory" value="샐러드"><label>샐러드</label>
								</td>
								</c:when>
								<c:when test="${p.p_lunchtype eq '샐러드'}">
								<th class="head">카테고리</th>
								<td class="sub" >
									<input type="radio" name="p_lunchtype" id="pcategory"  value="도시락" ><label>도시락</label>
									<input type="radio" name="p_lunchtype" id="pcategory" checked="checked" value="샐러드"><label>샐러드</label>
								</td>
								</c:when>
								</c:choose>
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
								<td class="sub mi"><input type="text" name="p_price" id="sell" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required value="${p.p_price }">원 <span><label id="hide">가격은 10원 단위로 입력이 가능합니다.</label></span></td>
							</tr>
							<tr>
								<th class="head">상품 수량</th>
								<th class="sub mi"><input type="text" name="p_quantity" id="Inventory" placeholder="숫자만 입력" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${ p.p_quantity }" required >개</th>
							</tr>
							
							<tr class="heim">
								<th class="head one">상품 이미지</th>
								
							<c:forEach var="i" begin="0" end="${  pt.size()-1 }" step="1">
								<c:choose>
								
								<c:when test="${ i == 0 }"> <!-- 첫번재 사진만 있음  -->
									<td><div class="prim"><img id="titleImgArea" name="titleImg" src="resources/img/products/${ pt.get(i).pt_name } " style="width: 100%; height: 80%;" > <span id="m1" >대표이미지</span> </div></td>	
									<input type="hidden"   name="title_name" value="${ pt.get(i).pt_name }">
									<input type="hidden"   name="title_realname" value="${ pt.get(i).pt_realName }">
									<input type="hidden"   name="title_type" value="${ pt.get(i).pt_type }">
									
									
								</c:when>

								<c:when test="${ i == 1 }">
									<td><div class="prim"><img id="contentImgArea1" name="contentImg2" src="resources/img/products/${ pt.get(i).pt_name } " style="width: 100%; height: 80%;" onerror="delImg(this);"> <span id="s1" onclick="del(2);">삭제</span> </div></td>
									<input type="hidden" id="sub1_name"  name="sub1_name" value="${ pt.get(i).pt_name }">
									<input type="hidden" id="sub1_realname"  name="sub1_realname" value="${ pt.get(i).pt_realName  }">
									<input type="hidden" id="sub1_type"  name="sub1_type" value="${pt.get(i).pt_type }"> 
									
									
								</c:when>
								
								<c:when test="${ i == 2 }">
									<td><div class="prim"><img id="contentImgArea2" name="contentImg3" src="resources/img/products/${ pt.get(i).pt_name } " style="width: 100%; height: 80%;" onerror="delImg(this);"> <span id="s2" onclick="del(3);">삭제</span> </div></td>
								 	<input type="hidden"  id="sub2_name"   name="sub2_name" value="${ pt.get(i).pt_name }">
									<input type="hidden"  id="sub2_realname"  name="sub2_realname" value="${ pt.get(i).pt_realName  }">
									<input type="hidden"  id="sub2_type" name="sub2_type" value="${pt.get(i).pt_type }">
									
									
								</c:when>
								
								<c:when test="${ i == 3 }">
									<td><div class="prim"><img id="contentImgArea3" name="contentImg4" src="resources/img/products/${ pt.get(i).pt_name } " style="width: 100%; height: 80%;" onerror="delImg(this);"> <span id="s3" onclick="del(4);">삭제</span> </div></td>
														
								<input type="hidden"  id="sub3_name" name="sub3_name" value="${ pt.get(i).pt_name }">	
								<input type="hidden"   id="sub3_realname" name="sub3_realname" value="${ pt.get(i).pt_realName  }">
								<input type="hidden"  id="sub3_type" name="sub3_type" value="${ pt.get(i).pt_type }"> 
									
									
								</c:when>
								
								</c:choose>
							</c:forEach>
								
								
								
								
							 <c:forEach var="j" begin="1" end="${ 4-pt.size() }" step="1">
								<c:choose>
							
								<c:when test="${ j == 1 }">   <!-- 사진이 3개 들어 있을때 이거 추가되 -->
									<td><div class="prim"><img id="contentImgArea3" name="contentImg4"   style="width: 100%; height:80%;" onerror="delImg(this);"> <span id="s3" >추가이미지</span> </div></td>
								</c:when>	
									
									
								<c:when test="${ j == 2}">   
									<td><div class="prim"><img id="contentImgArea2" name="contentImg3"  style="width: 100%; height:80%;" onerror="delImg(this);"> <span id="s2" >추가이미지</span> </div></td>
							
								</c:when>	
							
								<c:when test="${ j == 3 }">   
									
									<td><div class="prim"><img id="contentImgArea1" name="contentImg2" style="width: 100%; height:80%;" onerror="delImg(this);"> <span id="s1" >추가이미지</span> </div></td>
							
								</c:when>	

									</c:choose>
								</c:forEach> 
						
							<%-- 
								 <td><div class="prim"><img id="contentImgArea1" name="contentImg2" src="resources/img/products/${ pt[1].pt_name }  " style="width: 100%; height:80%;"> <span id="s1" onclick="del(this)">추가이미지</span> </div></td>
							
								
								<td><div class="prim"><img id="contentImgArea2" name="contentImg3" src="resources/img/products/${ pt[2].pt_name }  " style="width: 100%; height:80%;"> <span id="s2" onclick="del(this)">추가이미지</span> </div></td>
								
								
								<td><div class="prim"><img id="contentImgArea3" name="contentImg4" src="resources/img/products/${ pt[3].pt_name }  " style="width: 100%; height:80%;"> <span id="s3" onclick="del(this)">추가이미지</span> </div></td>
						 	--%>
				 			</tr>
							
							<tr style="height: 364px;">
								<th class="head" >상품 상세</th>
								<td class="sub"><div><textarea rows="" cols="" name="p_content" >${ p.p_content }</textarea></div></td>
							</tr>
						</table>
					</div>
				</div>		
				<div>
							<input type="button" value="취소" class="bu" ><input type="submit" value="수정" class="bu" onclick="return validate();" >
				</div>		
			
				<!-- 상품등록 중 끝 -->
				<div id="fileArea">
					<div id="area0"><img alt="" src=""><button onclick="areaDelete();"></button></div>
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
function validate(){
	$("#thumbnailImg1").files = null;
	$("#thumbnailImg2").files = null;
	$("#thumbnailImg3").files = null;
	$("#thumbnailImg4").files = null;
	return true;
}

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
	
});




function LoadImg(value, num) {
	if (value.files && value.files[0]) {
		var reader = new FileReader();

		reader.onload = function(e) {
			switch (num) {
			case 1:
				$("#titleImgArea").prop("src", e.target.result);
				$('#m1').html("삭제");
				break;
			case 2:
				$("#contentImgArea1").prop("src", e.target.result);
				$('#s1').html("삭제");
				break;
			case 3:
				$("#contentImgArea2").prop("src", e.target.result);
				$('#s2').html("삭제");
				break;
			case 4:
				$("#contentImgArea3").prop("src", e.target.result);
				$('#s3').html("삭제");
				break;
			}
		}

		reader.readAsDataURL(value.files[0]);
	}
}


$(function(){
	$('#s1').click(function(){
		$('#contentImgArea1').attr("src","");
		$("#s1").html("추가 이미지");
		$('#contentImgArea1').files = null;
		$('#sub1_realname').val("c")
		
	});
	$('#s2').click(function(){
		$('#contentImgArea2').attr("src","");
		$("#s2").html("추가 이미지");
		$('#contentImgArea2').files = null;
		$('#sub2_realname').val("c")
		
	});
	$('#s3').click(function(){
		$('#contentImgArea3').attr("src","");
		$("#s3").html("추가 이미지");
		$('#contentImgArea3').files = null;
		$('#sub3_realname').val("c")
		
	});
	
});

$(function(){
	var st ;
	
	$('.sub_middle').find('img').each(function(){
		$(this).attr('src');
		console.log($(this).attr('src'));
		st += 	$(this).attr('src');
		
	});
	var name = st.split('undefined');
	console.log(name);
	
	var re = name[1];
	console.log(re);
	
	var re1 = name[1].split('resources/img/products/');
	console.log(re1);
	

	var title = re1[0];
	var sub1 = re1[1];
	var sub2 = re1[2];
	var sub3 = re1[3];
	
	console.log(title);
	console.log(sub1);
	console.log(sub2);
	console.log(sub3);
	
});


function delImg(value){
	value.src="resources/img/admin/plus2.png";
	console.log(value);
	console.log(this);
	$(this).val("");
	
	$('#contentImgArea1').files = null;
}
	
</script>




</html>