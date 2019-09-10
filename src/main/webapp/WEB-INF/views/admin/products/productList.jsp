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
<link rel="stylesheet" href="resources/css/admin/productList.css">
<!-- css 끝 -->

<!-- js 시작 -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="resources/js/admin/productList.js"></script>

<!-- js 끝 -->
</head>
<body>
<!-- 헤더 부름 -->

<!-- 헤더 끝 -->
	<div class="warp">
		<c:import url="../adminheader.jsp" />
			<div id="content">
				<div class="content">
				<!-- 상품 제목 -->
					<div class="page_title_wrap">
						<div class="page_tit">상품 리스트</div>
					</div>
				<!-- 제목 끝 -->
				
	<!-- 리스트 뽑기  -->
	<div class="listContent">
		<div class="content_top">
			<div class="products_summary search_tab">
				<table class="ncp_tbl">
					<tbody>		
						<tr>
							<td>전체 <span class="l1">${ list.size() }</span> 건</td>
							<td>판매중 <span class="l2">${ list2.size() }</span> 건</td>
							<td>품절 건 </td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="search_box search_field">
			<form class="search_form">

				<table class="tg">
  					<tr>
    					<th class="tg-0lax serarch_ti">검색어</th>
   						<th class="tg-0lax">
   							<span>
   							<select id="select_code" name="searchForm">
   								<option >상품번호</option>
   								<option >상품명</option>						
   							</select>
   							</span>
   							<span>	<input type="text" id="search_Content" class="search_content" name="search_content" required></span>
   						</th>
   					
    					<td >
    						<input type="button" value="검색" class="bu" id="se" onclick="searchIn();">
    						<input type="button" value="초기화" class="bu" id="can" onclick="replyIn();">	
    					</td>
  					</tr>  					
				</table>
			</form>
		</div>
	</div>
<!-- 리스트 윗 부분 끝 -->
				<div class="content_bottom">
					<p>
						검색 결과 <span class="countSpan">${ list.size() }</span>건
					</p>
			
					<!-- 상품 번호 p_Id -->
					<div class="list_bottom">
						<div class="table_list">
							<table class="list_table">
							<thead>
								<tr>
									<th>상품번호</th>
									<th>상품명 </th>
									<th>판매상태</th>
									<th>판매상태설정</th>
									<th>가격</th>
									
									<th>카테고리</th>
									<th>재고수량</th>
									<th>판매수량</th>
									<th>삭제</th>
								</tr>
								</thead>
								
								<tbody class="list_content">
									<!-- 리스트 가져 오기 -->
									<!-- list 크기 가져온 만큼 돌린다. 삭제 안됀 것만 가지고온다. -->
								<c:forEach var='p' items="${ list }" varStatus="num"> 
								
										<tr class="list${num.count }">
											<td class="py" id="py" onclick="updatePro(${p.p_Id});">${ p.p_Id}</td> <!-- 상품번호 -->
											<td class="pp">${ p.p_name }</td> <!-- 상품명 -->
											
											<c:if test="${p.p_sell eq 'Y'}">
											<td class="pp dd" id="result${p.p_Id}">판매중</td> <!-- 판매상태 -->
											</c:if>
											
											<c:if test="${p.p_sell eq 'N'}">
											<td class="pp dd" id="result${p.p_Id}">판매중지</td> <!-- 판매상태 -->
											</c:if>
											
											<!-- ------------------------------------------------------------- -->
											<td>
												<select class="select" id="select${p.p_Id}" onchange="change(${p.p_Id});"> <!-- 판매상태 설정 -->
													<c:if test="${p.p_sell eq 'Y'}">
														<option value="판매중" selected>판매중</option>
														<option value="판매중지">판매중지</option>
													</c:if>
													<c:if test="${p.p_sell eq 'N'}">
														<option value="판매중">판매중</option>
														<option value="판매중지" selected>판매중지</option>
													</c:if>
												</select>
											</td>
											<!-- ------------------------------------------------------------- -->
											
											<td class="pp">${ p.p_price }</td>										
											<td class="pp">${ p.p_lunchtype }</td>
											<td class="pp">${ p.p_quantity }</td>
											<td class="pp">${ p.p_count }</td><!-- 판매 수량 -->
											<td class="py deleted" id="de${num.count }"  onclick="deleted( ${num.count} ,${p.p_Id} );">[삭제]</td>
										</tr>  
									 </c:forEach> 
									
								</tbody>
							</table>

						</div>

					</div>
			
				</div>
				</div>

				<!-- 전체 부위 끝 -->
				</div>
			</div>
			
				

</body>
<script>
 	function searchIn(){
		
 		var sContent = $("#search_Content").val(); // 검색어
 		var select_code = $("#select_code").val(); // 내용 
 		
 		// 검색어가 등록돼지 않앗으면
		if(sContent.length > 0){
			$.ajax({
				url : "searchProduct.do",
				data : {sContent:sContent, type:select_code}, // 타입과 내용을 보낸다.
				dataType : "json",
				success : function(data){
					console.log(data);
					
					var list = data;
				 	if(data.length > 0){
				 		$(".countSpan").empty();
				 		$(".countSpan").text(data.length);
				 		$(".list_content").empty(); // tobody 가 비움
						var count = 1;
						for(var i in data){
							
					$tr = $("<tr class='list" + count +  "'>");
					$tdNo = $("<td class='py' id='py' onclick='updatePro("+data[i].p_Id +" );' >").text(data[i].p_Id);
					$tdpname = $("<td class='pp'>").text(decodeURIComponent(data[i].p_name.replace(/\+/g, " ")));
					
					// 판매 상태
					if(data[i].p_sell == 'Y'){
					$tdpsell = $("<td class='pp' id='result" + data[i].p_Id+"'>").text("판매중");
						
					}else{
						$tdpsell = $("<td class='pp' id='result"+data[i].p_Id+"'>").text("판매중지");
						
					}
			
					// 판매 상태 변경
					//$tdselect = $("<td> <select class='select' id='select" + data[i].p_pId + "' onclick=\"change("+ data[i].p_pId + ");\" >  ");
					
					if(data[i].p_sell == 'Y'){
						$tdselect = $("<td>").html("<select class='select' id='select" + data[i].p_Id + "' onclick='change("+ data[i].p_Id + ");'><option value='판매중' selected>판매중</option><option value='판매중지'>판매중지</option></select>");
					}else{
						$tdselect = $("<td>").html("<select class='select' id='select" + data[i].p_Id + "' onclick='change("+ data[i].p_Id + ");'><option value='판매중'>판매중</option><option value='판매중지' selected>판매중지</option></select>");
						
					}
					
					
					$tdpprice = $("<td class='pp'>").text(data[i].p_price);
				
					$tdplunchtype = $("<td class='pp'>").text(decodeURIComponent(data[i].p_lunchtype.replace(/\+/g, " ")));
					$tdquantity = $("<td class='pp'>").text(data[i].p_quantity);
					
					$tdpcount =$("<td class='pp'>").text(data[i].p_count);
					$tddelete = $("<td class='py deleted' id='de' onclick='deleted(" + count + "," + data[i].p_Id + ");'>").text("[삭제]");
					
					count = count +1;
					
					$tr.append($tdNo);
					$tr.append($tdpname);
					$tr.append($tdpsell);
					$tr.append($tdselect);
					$tr.append($tdpprice);
					$tr.append($tdplunchtype);
					$tr.append($tdquantity);
					$tr.append($tdpcount);
					$tr.append($tddelete);
					$(".list_content").append($tr);
					
					} 
					
						}else{
							alert("검색 결과가 없습니다.");
						}
					
				}, error : function(data){
					alert("검색 결과가 없습니다.");
				}
			});
		}else{
			alert("검색어를 입력해주세요.");
		} 
		 
		
		
	}  
 	
 	// 초기화
	function replyIn(){
		location.href="productList.do";
	}
 	
// 삭제 버튼
function deleted(listNum , p_Id){
 		
	console.log("행 번호 : " + listNum);
	console.log("상품 번호 : " + p_Id);
	
	
	var key = confirm("선택한 상품을 삭제하겠습니까?");
	
	if(!key){
		console.log("삭제안함");
	}else{
		$.ajax({
 			url: "deletedProduct.do",
 			data : {p_Id:p_Id},
 			type:"post",
 			success:function(data){
 				$('.list'+listNum).remove();
 				alert("상품을 삭제 했습니다.");
 				var count = $(".l1").html(); // html 태그의 안에 등록
 				 count = count - 1;
 				
 				var sell = $(".dd").html(); // 판매 중인지 구분한다.
 				
 				 if(sell == "판매중지"){
 					var count2 = $(".l2").html();
 					count2 = count2 - 1;
 					 
 					$(".l2").html(count2);
 				 }
 				
 				$(".l1").html(count);
 				
 				/* 
 					$(".l1").empty();
 					$(".l1").text(count); 
 				*/
 			/* 
 				$(".l2").empty();
 				$(".l2").text(count);
 			 */	
 			 
 			 	
 			 
 			}, error:function(data){
 				alert("삭제에 실패하였습니다.");
 			}
 		});
	}
}
	
function updatePro(p_Id){
	location.href="updatePro.do?p_Id="+p_Id;
}
	

 	
 	
	
</script>



</html>