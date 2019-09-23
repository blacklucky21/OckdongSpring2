<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css 시작 -->
<link rel="stylesheet" href="resources/css/product/productDetail.css">
<link rel="stylesheet" href="resources/css/bootstrap.css">

<!-- css 끝 -->

<!-- js 시작 -->

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- js 끝 -->

<style>
</style>

</head>
<body>
	<!-- ############### 헤더 부분 ############### -->
	<c:import url="../../header/header.jsp" />
	<!-- 윗부분 -->
	<!-- 전체 감싸기 -->
	<!-- ▼▼▼▼ main ▼▼▼▼ -->
<div class="shCMSshop">
		<div class="shopView">
	   <form action="payinsert.pay"  method="post" id="CartandPaymentForm">
			<div class="viewHeader">
				<!-- 상품이미지 -->
				<div class="productImg">
					<div class="mainImg">
						<img id = "mainim" src=" resources/img/products/${ pt[0].pt_name } " alt="메인사진" style="width:500px; height: 500px;">
					</div>
					<!-- 판매중지 상태 일대 나온다. -->
					<c:if test="${p.p_sell eq 'N'}">
					<div class="exhibition_vis_line">
						<img src="resources/img/stop.png" alt="판매중지 표시" class="i_p"style="width: 84px; height: 30px;">
					</div>
					</c:if>
					<!-- 사이드 이미지 -->					
					<ul class="subImg">
					 <c:forEach var="i" begin="0" end="${  pt.size()-1 }" step="1" varStatus ="num">
						<li><img src="resources/img/products/${ pt.get(i).pt_name } " alt="서브 이미지1" style="width:100px; height:100px;" onclick="side('resources/img/products/${pt.get(i).pt_name}')"></li>
						</c:forEach>
					</ul>
				</div>
				<!-- 상품 설명 -->
				<div class="productInfo">
					<h3>${ p.p_name }</h3>
					<div class="price">
						<span class="sale-price comm"  > ${p.p_price} 원</span>
					</div>
					<c:if test="${ p.p_sell ne 'N' }">
						<input type="hidden" id="standard" value="${p.p_price }"/>
						<div class="categori">분류           <span>${ p.p_lunchtype }</span></div>
						<div class="manufact">배송비       <span id="del">2500 원 </span>           <span style="font-size: x-small;">20000원 이상 무료 배송</span></div>
						<div class="origin">수량           <div class="amount"><button type="button"class="decrease" onclick="cntSet('minus')">-</button><input id="orderCnt" class="input-normal" type="text" maxlength="8" autocomplete="off"  value="1" onblur="buyCountInputCheck(this)" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"><button class="increase" type="button"  onclick="cntSet('plus')">+</button></div></div>
						<div class="items">
					</div>
					<div class="all-price">총 상품금액        <span class="commPrice">${p.p_price}</span>원</div>
					<div class="btn">
						<a id="cart">장바구니</a>
						<a id="order_buy">구매하기</a>
					</div>
					</c:if>	
					
					<c:if test="${ p.p_sell eq 'N' }">
					<div class="btn">
						<button class="nosell">구매불가</button>
						</div>
					</c:if>
					 
				</div>
			</div>
		
		<!-- 구매 -->
			<input type="hidden" name = "p_img" value="resources/img/products/${ pt[0].pt_name }" ><!-- 메인사진 -->
			<input type="hidden" name = "payprice" class="p_price" value="${p.p_price }" ><!-- 총가격 -->
			<input type="hidden" name = "p_num" value="${p.p_Id}" ><!-- 상품번호 -->
			<input type="hidden" name = "" value="${p.p_price }" ><!-- 개별 -->
			<input type="hidden" name = "" class = "p_count" value="1"  >
			<input type="hidden" name = "paytext" class = "p_name" value="${p.p_name }" ><!-- 상품 이름 -->	
		<!-- 카트 -->
			<input type="hidden" name = "c_img" value="resources/img/products/${ pt[0].pt_name }" ><!-- 메인사진 -->
			<input type="hidden" name = "" class="p_price" value="${p.p_price }" ><!-- 총가격 -->
			<input type="hidden" name = "p_id" value="${p.p_Id}" ><!-- 상품번호 -->
			<input type="hidden" name = "cPrice" value="${p.p_price }" ><!-- 개별 -->
			<input type="hidden" name = "cAmount" class = "p_count" value="1" >
			<input type="hidden" name = "cName" class = "p_name" value="${p.p_name }" ><!-- 상품 이름 -->	
			</form>
			
<!-- ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼  -->				
<!-- 하단의 탭부분 시작 -->
			<div class="viewBody">
				<ul class="contentNav">
					<li class="active"><a href="">상품 정보</a></li>
					<li><a href="">상품 후기<span>(<span class="count" id="pvcount"></span>)</span></a></li>
					<li><a href="">Q & A <span>(<span id = "qacount"></span>)</span></a></li>
					<li><a href="">반품 / 교환</a></li>
				</ul>
				<!-- 탭부분 끝 -->
				<!-- 상품정보 -->
				<div class="tproduct-info active" id="contentin">
					<h2>상세 내용</h2>
					<p id="productinfo" class="productinfo">${ p.p_content }</p>
					<img src="resources/img/detail01.jpg" id = "intro"class="productinfo" style="margin-bottom: 40px;">
				</div>
					<table class="tproduct-info active">
					<tr>
					</tr>
						<tr>
							<td>제품명</td>
							<td>${p.p_name }</td>
							<td>식품의 유형</td>
							<td>즉석조리식품(가열하여 섭취하는 냉동식품)
							</td>
						</tr>
						<tr>
							<td>용량</td>
							<td>상세페이지 참조</td>
							<td>제조사</td>
							<td>상세페이지 참조</td>
						</tr>
						<tr>
							<td>제조년월일</td>
							<td>상시제조 제품,정확한 제조연월일 안내가 어려우나 유통기한이 1/2이상 남은 제품으로 보내 드립니다.</td>
							<td>품질유지기한</td>
							<td>냉동보관시 제조일로부터 6개월</td>
						</tr>
						<tr>
							<td>보관방법</td>
							<td colspan="3">[유통기한]냉동보관시 제조일로부터 6개월</td>
						</tr>
						<tr>
							<td>원재료명 및 함량</td>
							<td colspan="3">상세페이지 참고</td>
						</tr>
					</table>
		
				<!-- 상품 후기 -->
				<!-- 댓글 게시판 -->
				<table class="tproduct-review">
					<thead>
					<tr style="background: none;">
						<td style="background: none;">작성자  ${ loginUser.nickName }</td>
						<td><textarea cols="100" rows="4" id=pv_reviewContent style="resize: none;width: 639px;" onclick="chname('${loginUser.nickName}');"></textarea><td>
					<c:if test="${ !empty sessionScope.loginUser }">	
						<td><button id="rSubmit">등록하기</button></td>
					</c:if>
					</tr>
						<tr>
							<td>작성자</td>
							<td>내용</td>
							<td>작성일</td>
							<td></td>
						</tr>
					</thead>
					<!-- 여기서 내용 나온다. -->
								
					<!-- 여기가 댓글 리스트 읽어 오는 것  -->
					<tbody id="pvList">
					<tr>
						<td></td>
						<td class="tcontent"><span></span></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="detail-content">
						<td></td>
						<td></td>
						<td></td>
						<!-- 댓글 작성자와 로그인한 상태가 같으면 수정 삭제 기능 -->
				<c:if test="${ pv.pv_user eq loginUser.nickName }">
						<td><button class="btn ctrl">수정</button><button class="btn ctrl">삭제</button></td>
				</c:if>
					</tr>
					
					</tbody>
				</table>
<!-- ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ -->					
<!-- ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼  -->				
				<!-- Q & A  -->
				
				<div class="tquestion" id="qn">
					<div class="con-consultation" style="display: block;">
						<div class="consultation-text">
							<form id="formInquiry" action="">
								<h2>
									<strong>상품문의</strong> <span>상품에 관한 문의사항을 입력해주세요.</span>
								</h2>
								<div class="text-wrap">
									<div class="textarea">
										<textarea class="textarea-normal textarea_inquiriy"
											name="content" id="qna_content" cols="30" rows="10"
											maxlength="1000" onkeydown="updateLength('inquiriy')"
											onkeypress="updateLength('inquiriy')"
											onkeyup="updateLength('inquiriy')"
											onchange="updateLength('inquiriy')"></textarea>
										<p class="textarea-limit length_inquiriy">
											<span>0</span>자 / 1000자
										</p>
									</div>
								</div>
								<div class="secret cf">
									<dl class="txt">
										<dt>
											<div class="qa-checkbox">
												<p class="checkbox-normal"
													style="display: inline-block; vertical-align: middle;">
													<input id="secretedCheckBox" type="checkbox"><label></label>
												</p>
												<span class="ico-lock">lock</span><label
													for="secretedCheckBox">비밀글 문의</label>
											</div>
										</dt>
										<dd></dd>
									</dl>
									<p class="btn-row">
									 <c:if test="${ !empty sessionScope.loginUser }">
										<button type="button" class="btn black style-3-1" id="qSubmit">등록하기</button>
										</c:if>
									</p>
								</div>
							</form>
						</div>
						<!-- 여기서 상품 문의가 있다면 -->
						<div class="history">
							<div class="history_wrap">
								<div id="proInquiry" style="border-top: 1px solid #ababab;">
									<div>
										<ul id="inquiry" class="inquiry">
											<li id="content" class="txt_wrap">
												<!-- 상품문의 -->
												<div class="con-qa">
													<div class="info_top">
														<span class="name"></span> <span
															class="date">2019-09-15 13:19:31</span>
													</div>
													<p class="txt">ddzzz</p>
													<!-- 만약 작성자 본인 이면 -->
													<c:if test="${ pv.pv_user eq sessionScope.lopginUser}">
													<div class="btn-row left">
														<button type="button" class="btn ctrl"
															onclick="modifyInquiry(this)">수정</button>
														<button type="button" class="btn ctrl"
															onclick="deleteInquiry(this)">삭제</button>
													</div>
													</c:if> 
												</div> 
												<!-- //상품문의 -->
											</li>
										</ul>
										<ul id="inquiryAnswer" class="open"></ul>
										<!-- 답변시 생겨야 할 부분 -->
										<li colspan="5">
											<div class="message">
												<!-- <p class="txt"></p> -->
												<dl class="reply">
													<img src="resources/img/line.png" class="answerline">
													<dt>
														운영자
														<time>2019-09-15 13:19:30</time>
													</dt>
													<dd>응 여러번 폭발 하긴 했어</dd>
												</dl>
											</div>
										</li>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<table class="tquestion">
				</table>
<!-- ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲ -->				
<!-- ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼ -->				
				<!-- 판매 반품 안내 -->	
				<table class="">
					<tr>
						<td class="law"><strong>배송안내</strong><br> - 지역별 도서
							추가배송비가 발생할 수 있습니다. <br> - 배송은 업체마다 출고지가 상이하기 때문에 각각 따로 배송될 수
							있습니다. <br> - 배송준비 기간은 평균 1~3일 이내에 준비됩니다. (일, 공휴일 제외) <br>
							- 품절, 지연 및 구성변경 시 개별적으로 연락 드리고 있습니다. 이점 양해 부탁드립니다.<br> - 무통장
							입금 시 입금자명, 금액이 다를 경우 주문건이 확인되지 않을 수 있습니다. 1:1 문의 혹은 고객센터로 문의주시길
							바랍니다.<br> - 도시락몰은 여러 배송사를 이용하고 있습니다. 배송추적은 <br> 페이지 오른쪽
							상단&gt; 주문배송조회&gt; 상태의 글자를 클릭 하시면 확인 가능합니다.<br></td>
					</tr>
					<tr> <td> <br><br> </td></tr>
					<tr>
						<td class="law"><strong>교환/반품</strong><br> 
							- 상품불량 및 오 배송등의 이유로 반품하실 경우, 반품 배송비는 무료입니다.<br> - 단순 변심 및 고객님의 사정으로 반품하실
							경우, 반품 배송비는 고객님 부담입니다.<br> - 마이페이지&gt;해당주문번호&gt;하단&gt;반품신청에서
							접수 가능합니다.<br> - 수거일로부터 영업이 기준 3일 이내에 환불처리 됩니다. (카드사 사정에 따라 카드취소는 시일이 소요될 수 있습니다.)<br> -
							반품 접수 후 영업일 기준 2~5일 이내에 상품을 수거합니다. <br> <br> <strong>반품/교환
								가능시점</strong><br> - 반품 및 교환은 상품 수령 후 7일 이내에 신청하실 수 있습니다. [단순 변심]<br>
							- 표시/광고와 상이하거나 계약 내용과 다르게 이행된 경우 [물품 수령 후 3개월이내, 사실을 안 날로부터 30일이내
							(판매자 반품 비 부담)]<br> <br> <strong>반품/교환 불가사유 </strong><br>
							- 반품요청기간이 지난 경우<br> - 구매자에게 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우
							(다만, 상품 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)<br> - 구매자의 사용 또는
							일부 소비의 의하여 상품 등의 가치가 현저히 감소한 경우 (화장품류/식품류는 밀봉 개봉 시, 패션 류/침구류는
							수선했거나 세탁하였을 시, 기타 사용/분리/훼손에 의해 상품의 가치가 현 저히 감소하여 재판매가 불가할 시)<br>
							- 시간의 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우<br> - 복제가 가능한
							상품의 포장을 훼손한 경우(CD, DVD, GAME, BOOK 등의 경우 포장 개봉 시)<br> <br>
							<strong>교환/반품 참고사항</strong><br> - 반품/교환 시 고객님 귀책사유로 인해 수거가
							지연될 경우에는 반품이 제한될 수 있습니다.<br> - 일부 상품의 경우, 제조사의 사정(신제품 출시 등)및
							일부 부분상품 가격변동 등에 의해 가격이 변동 될 수 있으며, 이로 인한 반품 및 가격보상은 불가합니다.<br>
							- 수제품(주문 후 제작), 신선식품(냉장,냉동/아이싱 포장 정육, 수산물 등)은 수령 후 단순변심으로 인한
							취소/반품이 불가합니다.</td>
							
					</tr>

				</table>
			</div>
			<!-- 하단 탭 끝 -->
		</div>
	</div>
	<!-- ▲▲▲▲ main ▲▲▲▲ -->
	<!-- 윗부분 끝 -->
	<!-- ##################### 풋터 부분 ##################### -->
	<c:import url="../../footer/footer.jsp" />

	<script>
	$(function(){
		$("#orderCnt").keyup(function(){
			var count = $("#orderCnt").val();
			
			if(parseInt(count) < 1){
				alert("수량이 1보다 작을 수 없습니다.");
				$("#orderCnt").val("1");
				$("#del").text("2500 원");
				$(".commPrice").text("${p.p_price}");
				return false;
			}
			
			
			
			var standard = $("#standard").val();
	    	comm = parseInt(count) * parseInt(standard);
	    	console.log($(".commPrice"));
	    	console.log($(".commPrice").text());
	     	$(".commPrice").text("");
	    	$(".commPrice").text(comm);
			console.log(count);
			
			if(comm >= 20000){
				$("#del").text("0 원");
			}else{
				$("#del").text("2500 원");
			}
		});
	});

	
	// 사이드 사진 클릭시 메인으로 변경
	function side(pick){
	/* 	$('#mainim').attr("src","pick"); */
	document.getElementById("mainim").src=pick;
	}
// ==========================================================	
	// 수량 증가/감소 
	var cntSet = function (type,optionNo) {
	
	
	
    var cntElement = null;
    var standard = $("#standard").val();
    if(optionNo){
        cntElement = $('#orderCnt-' + optionNo);
    }else{
        cntElement = $('#orderCnt');
    }

    var orderCnt = cntElement.val();
    if (type == 'plus') {
    	
    	var comm = $(".commPrice").text();
    	comm = parseInt(comm) + parseInt(standard);
    	console.log($(".commPrice"));
    	console.log($(".commPrice").text());
    	$('.p_price').val(comm);
    	console.log("가격 : " + $('.p_price').val());
    	
     	$(".commPrice").text("");
    	$(".commPrice").text(comm);
        orderCnt = eval(orderCnt) + 1;
        $('.p_count').val(orderCnt);
        if(comm >= 20000){
        	$("#del").text("0 원");
        }
        
    } else if (type == 'minus') {
    	var comm = $(".commPrice").text();
    	comm = parseInt(comm) - parseInt(standard);
    	console.log($(".commPrice"));
    	console.log($(".commPrice").text());
     	$(".commPrice").text("");
    	$(".commPrice").text(comm);
        orderCnt = eval(orderCnt) - 1;
        $('.p_count').val(orderCnt);
        if(comm < 20000){
        	$("#del").text("2500 원");
        }
    }
    
    console.log("갯수 : " + $('.p_count').val());

    orderCnt = Number(orderCnt.toString().replace(/\D/g, '')) || 1;

    if (eval(orderCnt) < 1) {
        orderCnt = 1;
    }
    if (eval(orderCnt) > 9999) {
        orderCnt = 9999;
    }
    cntElement.val(eval(orderCnt));

    if(optionNo) {
        setTotalOptionPrice(optionNo,orderCnt);
        setTotalPrice();
    }
    
    
}
	// 최소 수량 1개 이상
	var buyCountInputCheck = function (obj,optionNo) {
	    obj.value = obj.value.replace(/\D/g, '');
	    var cnt = obj.value;
	    if (isNaN(cnt) || cnt <= 0) {
	        alert('최소수량은 1이상입니다.');
	        obj.value = 1;
    
	    }
	    if(optionNo) {
	        setTotalOptionPrice(optionNo,cnt);
	        setTotalPrice();
	    }
	}

	// 하단의 탭 부분
	
	

// ===================================================	
	// 상품 아래 나오는 것들
	 $(document).ready(function(){
	   // 탭 변경 부분
	   $('.contentNav > li').click(function(e){
	      e.preventDefault(); /* 상의 이벤트 전파를 막기 위해 사용 a 태그 작동 안하게됨  */
	  var idx = $(this).index(); // 클릭 한 인덱스 번호 찾기
	      console.log(idx);
	  $('.contentNav > li').removeClass('active').eq(idx).addClass('active'); // ul 색상 부분
	 
	  $('table').removeClass('active').eq(idx).addClass('active');
	  
	  $('#contentin').removeClass('active').eq(idx).addClass('active');
	  if(idx == "2"){
		  $('#qn').show();
	  }else{
		  $('#qn').hide();
	  }

	  
	  });

	  
	});
//===============================================================================	 
// 상품 후기
	$(function(){
		 // 상품 후기 부분 
		   $(".tcontent").click(function(){
		   //전체 글자의 변수를 2번 잡아서 . 한번은 위쪽 내용. 한번은 아래쪽 내용 출력
		   //위쪽 내용
		    var text = $(this).children('span').html(); //전체 html또는 text를 가져와서
		    console.log(text);
		    var full = $(this).closest('tr').next('tr').children('td').eq(1).text(text).css('text-align','left'); // tr 출력후 나머지 글자 출력 및 정렬
		    // var cut = $(this).closest('tr').next('tr').children('td').eq(1).text();
		   $(this).closest('tr').next('tr').toggleClass('display'); //자세한 이용후기 tr 출력하기
		  });
	});
	
//===============================================================================	 
	// 상품 후기 댓글 부분
	function chname(ii){
	console.log(ii);
	
	if(ii == ""){
		alert("로그인 후 후기 등록이 가능합니다.");
		$('#pv_reviewContent').attr("disabled","disabled");
	}
}
	$(function(){
		getReplyList(); // 디테일뷰 들어오면 메소드 실행 한다.
	});
	// 작성한 댓글을 수정
	
	/* 상품 댓글 등록 기능 */
	$('#rSubmit').on("click", function(){
		var pv_reviewContent = $("#pv_reviewContent").val();
		console.log(pv_reviewContent); // 넘어온다.
		var p_Id = ${p.p_Id};
		
		console.log(p_Id);
		
		// 작성자 게시판 번호 넘긴다.
		$.ajax({
			url: "addReply.do",
			data:{pv_reviewContent:pv_reviewContent, p_Id:p_Id}, // 내용과 게시판 번호 넘김
			type:"post",
			success:function(data){
				if(data == "success"){
					getReplyList(); // 성공하면 리스트 불러와서 갱신 한다.
					$("#pv_reviewContent").val(""); // 댓글 추가후 비워둔다.
				}
			}
		});

	});

	/* 댓글 리스트 ajax 가지고 오기*/
 	function getReplyList(){
		var p_Id = ${p.p_Id};
		
		$.ajax({
			url:"pvList.do",
			data:{p_Id:p_Id},
			dataType:"json",
			success:function(data){
				$tableBody = $('#pvList');
				$tableBody.html("");
				
				var $tr;
				var $td;
				var $pv_content;
				var $pv_User;
				var $pv_createDate;
				
				var $tr2;
				var $td1;
				var $td2;
				var $td3;
				var $td4;
				
				
				$('#pvcount').text(data.length);
				
				
				if(data.length > 0){
					for(var i in data){
						
						var nick = $('#nick').val();
						$tr = $("<tr id='reply" + i + "'>");
						
						$pv_User = $("<td>").text(decodeURIComponent(data[i].pv_user.replace(/\+/g,"")));
						
						if(data[i].status != 'N'){
						$pv_content = $("<td class='tcontent'>").html("<span>" + decodeURIComponent(data[i].pv_reviewContent.replace(/\+/g,"")) + "</span>");                         
							
						}else{
						$pv_content = $("<td class='tcontent'>").html("<span> 삭제된 댓글 입니다. </span>");                         
							
						}
					
						$pv_createDate = $("<td>").text(data[i].pv_createDate);
						
						console.log("현재 닉네임 : " + "${loginUser.nickName}");
						console.log("댓글 번호 가지고 온다. : " + data[i].pv_Id);
						
						console.log(nick);
						
						if(decodeURIComponent(data[i].pv_user.replace(/\+/g,"")) == nick ){
							if(data[i].status != 'N'){
							$td = $("<td>").html("<button id='qwe" + i + "'' class='btn ctrl' onclick='updateRe("+ i + "," + data[i].pv_Id +");'>수정</button><button id='asd"+i+"' class='btn ctrl' onclick='deleteRe("+ data[i].pv_Id +");'>삭제</button>");
							}else{
							$td = $("<td>");
							}
						} else{
							$td = $("<td>");
						} 
						
						$tr.append($pv_User);
						$tr.append($pv_content);
						$tr.append($pv_createDate);
						$tr.append($td);
		
						
						$tableBody.append($tr);
						
					}
				}else{
					$tr = $("<tr>");
					$td = $("<td>");
					$pv_User = $("<td class='tcontent' colspan='3'>").html("<span>").text("등록된 댓글이 업습니다.");
					$tr.append($td);
					$tr.append($pv_User);
					$tableBody.append($tr);
				}
			}
		});
	}		
	
	// 댓글 수정 버튼 눌렸을 때
	function updateRe(i, pv_Id){
		console.log("수정할 게시판 번호 : " + pv_Id);
		var tr = $('#reply' + i);
		var reply = tr.children()[1];
		var text = reply.childNodes[0].innerHTML;
		console.log(text);
		reply.innerHTML = '<textarea id="recontent" style="width : 600px; resize: none;">' + text + '</textarea>';
		var button = $('#qwe'+i);
		var button2 = $('#asd'+i);
		
		button.attr('onclick', 'modify(' +  pv_Id  + ');');
		button.text('저장');
		button2.attr('onclick', 'rollback();');
		button2.text('취소')
		
	}
	// 저장 버튼 눌리면 수정 된 글로 변경 해준다.
	function modify(pv_Id){
		/* console.log("받은 문자 : " + $('#recontent').val() + "댓글 시퀀스 번호 : " + pv_Id ); */
		
		var pv_reviewContent = $('#recontent').val(); // 변경된 내용 값 넣는다.
		
		$.ajax({
			url: "updateReply.do",
			data:{pv_reviewContent:pv_reviewContent , pv_Id:pv_Id},
			type:"post",
			success:function(data){
				getReplyList();
			}
		});
		
	}
	
	// 댓글 취소 버튼 누를때 리셋 해준다.
	function rollback(){
		getReplyList();
	}
	
	// 댓글 삭제 버튼이 누렸을 때
	function deleteRe(pv_Id){
		console.log("삭제 할 댓글 번호 : " + pv_Id);
		
		var key = confirm("댓글을 정말로 삭제 하시겠습니까? 삭제한 댓글은 복구 되지 않습니다.");
		
		if(!key){
			alert("삭제을 취소 하셨습니다.");
		}else{
			$.ajax({
				url:"deletedPv.do",
				data: {pv_Id:pv_Id} ,
				type:"post",
				success:function(data){
					if(data == "success"){
						getReplyList();
					}
				}
			});
		}
	}
	//상품 후기 끝
	
// =========================================================================================	
	// 상품 문의 시작
	var currentEditId = "";
	// 상품 문의  1000 자 제한 두기
	var updateLength = function (key) {
	    var len = $('.textarea_' + key).val().length;
	    $('.length_' + key).text(len + '자 / 1000자');
	}
	var getEvent = function () {
	    return window.event || arguments.callee.caller.arguments[0];
	}

	var updateLength = function (key) {
	    var len = $('.textarea_' + key).val().length;
	    $('.length_' + key).text(len + '자 / 1000자');
	}
	
	// 상품 문의 디테일 들어오면 실행 한다.
	$(function(){
		getQnaList();
	});
	
	// 상품문의 등록
	$('#qSubmit').on("click", function(){
		var qna_content = $('#qna_content').val();
		console.log(qna_content);
		
		// 비밀글인지 아닌지 판단한다.
		if($('#secretedCheckBox').prop("checked") ){
			var qna_secret = 'Y';
		}else{
			var qna_secret = 'N';
		}
		
		var p_Id = ${p.p_Id};
		
		if(qna_content.trim() == ""){
			alert("내용을 입력하세요.");
			$('#qna_content').focus();
			return false;
		}
		
		
		// 문의글 등록
		$.ajax({
			url: "addQna.do",
			data:{qna_content:qna_content, p_Id:p_Id, qna_secret:qna_secret},
			type:"post",
			success:function(data){
				if(data =="success"){
					getQnaList();
					$('#qna_content').val("");
				}
			}
		});
	});
	
	
	// 상품 문의 시작
	var currentEditId = "";
	// 상품 문의  1000 자 제한 두기
	var updateLength = function (key) {
	    var len = $('.textarea_' + key).val().length;
	    $('.length_' + key).text(len + '자 / 1000자');
	}
	var getEvent = function () {
	    return window.event || arguments.callee.caller.arguments[0];
	}

	var updateLength = function (key) {
	    var len = $('.textarea_' + key).val().length;
	    $('.length_' + key).text(len + '자 / 1000자');
	}
	
	// 상품 문의 디테일 들어오면 실행 한다.
	$(function(){
		getQnaList();
	});
	

	
	// 상품 문의 ajax 가지고 오기
	function getQnaList(){
		var p_Id = ${p.p_Id}; 
		
		$.ajax({
			url:"qnaList.do",
			data:{p_Id:p_Id},
			dataType:"json",
			success:function(data){
				
				$div = $('.history');
				$div.html("");
				var nick = $('#nick').val();
				var $div1;
				var div2 = "";
				$('#qacount').text(data.length);
				
				if(data.length > 0){
					for(var i in data){
						console.log(data[i]);
						console.log("닉네임"+decodeURIComponent(data[i].qna_user.replace(/\+/g,"")) );
					
						console.log("${sessionScope.loginUser.nickName}");
						// 로그인 아이디와 작성자 아이디가 같을 경우
						if(decodeURIComponent(data[i].qna_user.replace(/\+/g,"")) ==  "${sessionScope.loginUser.nickName}" ){
							
							// 비밀 글 인지 판단 한다.
							if(data[i].qna_secret == 'Y'){
								if(data[i].qna_status == 'Y'){
									
									$div1 = $("<div class='history_wrap' id='history_wrap"+ i +"'>")
										.html("<div id='proInquiry' style='border-top: 1px solid #ababab;'><div><ul id='inquiry' class='inquiry'><li id = 'content' class='txt_wrap'><div class='con-qa'><div class='info_top'><span class='name'>"
											+ decodeURIComponent(data[i].qna_content.replace(/\+/g,"")) 
											+ "</span>"
											+ "<span class='date'>"
											+ data[i].qna_createDate
											+ "<span class='ico-lock'></div><p class='txt'  id ='qnacontext"+ i +"'>"+ decodeURIComponent(data[i].qna_content.replace(/\+/g,"")) +"</p><div class='btn-row left'><button type='button' class='btn ctrl' id = 'updateQna" + i +"' onclick='modifyInquiry("+ i +", "+ data[i].qna_Id + ")'>수정</button><button type='button' class='btn ctrl' id='delQna"+ i +"' onclick='deleteInquiry(" + data[i].qna_Id +")'>삭제</button></div></div></li></ul></div></div></div>"																												
										);
									

										
										if(data[i].qna_answer == 'Y'){

									 	div2 += "<ul id='inquiryAnswer' class='open'></ul>";
										div2 += "<li cospan='5'>";
										div2 += "<div class='message'>";
										div2 += "<dl class='reply'>";
										div2 += "<img src='resources/img/line.png' class='answerline'>";
										div2 += "<dt>운영자<time>"+ data[i].qna_answerDate +" </time></dt>";
										div2 += "<dd>"+ decodeURIComponent(data[i].answer_content.replace(/\+/g,""))+"</dd>";
										div2 += "</dl></div></li>"; 
										}  
										
										
									
								}else{
									// 글 삭제함
									$div1 = $("<div class='history_wrap'>")
										.html("<div id='proInquiry' style='border-top: 1px solid #ababab;'><div><ul id='inquiry' class='inquiry'><li id = 'content' class='txt_wrap'><div class='con-qa'><div class='info_top'><span class='name'>"
												+ decodeURIComponent(data[i].qna_user.replace(/\+/g,""))
												+ "</span>"
												+ "<span class='date'>"
												+ data[i].qna_createDate
												+ "<span class='ico-lock'></div><p class='txt'>삭제된 상품 문의 입니다.</p>"																										
										);
								}
							}else if(data[i].qna_secret == 'N'){
								if(data[i].qna_status == 'Y'){
									
									$div1 = $("<div class='history_wrap' id='history_wrap"+ i +"' >")
										.html("<div id='proInquiry' style='border-top: 1px solid #ababab;'><div><ul id='inquiry' class='inquiry'><li id = 'content' class='txt_wrap'><div class='con-qa'><div class='info_top'><span class='name'>"
												+ decodeURIComponent(data[i].qna_user.replace(/\+/g,""))
												+ "</span>"
												+ " <span class='date'>"
												+ data[i].qna_createDate 
												+ "<span></div><p class='txt' id ='qnacontext"+ i +"'>"
												+ decodeURIComponent(data[i].qna_content.replace(/\+/g,""))+ "</p><div class='btn-row left'><button type='button' class='btn ctrl' id = 'updateQna" + i +"' onclick='modifyInquiry("+ i +", "+ data[i].qna_Id + ")'>수정</button><button type='button' class='btn ctrl'  id='delQna"+ i +"' onclick='deleteInquiry(" + data[i].qna_Id +")'>삭제</button></div></div></li></ul></div></div></div>"																												
										);
										if(data[i].qna_answer == 'Y'){
										
									 	div2 += "<ul id='inquiryAnswer' class='open'></ul>";
										div2 += "<li cospan='5'>";
										div2 += "<div class='message'>";
										div2 += "<dl class='reply'>";
										div2 += "<img src='resources/img/line.png' class='answerline'>";
										div2 += "<dt>운영자<time>"+ data[i].qna_answerDate +" </time></dt>";
										div2 += "<dd>"+ decodeURIComponent(data[i].answer_content.replace(/\+/g,""))+"</dd>";
										div2 += "</dl></div></li>"; 
										} 
									
								}else{
									$div1 = $("<div class='history_wrap'>")
										.html("<div id='proInquiry' style='border-top: 1px solid #ababab;'><div><ul id='inquiry' class='inquiry'><li id = 'content' class='txt_wrap'><div class='con-qa'><div class='info_top'><span class='name'>"
												+ decodeURIComponent(data[i].qna_user.replace(/\+/g,""))
												+ "</span>"
												+ "<span class='date'>"
												+ data[i].qna_createDate
												+ "<span ></div><p class='txt'>삭제된 상품 문의 입니다.</p>"																										
										);
								}
							}
							
						// 로그인 안한 상태 보이는 부분
						}else{
							if(data[i].qna_secret == 'Y'){
								if(data[i].qna_status == 'Y'){
									$div1 = $("<div class='history_wrap'>")
									
									.html("<div id='proInquiry' style='border-top: 1px solid #ababab;'><div><ul id='inquiry' class='inquiry'><li id = 'content' class='txt_wrap'><div class='con-qa'><div class='info_top'><span class='name'>"
											+ decodeURIComponent(data[i].qna_user.replace(/\+/g,""))
											+ "</span>"
											+ "<span class='date'>"
											+ data[i].qna_createDate
											+ "<span class='ico-lock'></div><p class='txt'>비공개 문의 글 입니다.</p></div></li></ul></div></div></div>"																												
									);
									
								}else{
									$div1 = $("<div class='history_wrap'>")
										.html("<div id='proInquiry' style='border-top: 1px solid #ababab;'><div><ul id='inquiry' class='inquiry'><li id = 'content' class='txt_wrap'><div class='con-qa'><div class='info_top'><span class='name'>"
												+ decodeURIComponent(data[i].qna_user.replace(/\+/g,""))
												+ "</span>"
												+ "<span class='date'>"
												+ data[i].qna_createDate
												+ "<span class='ico-lock'></div><p class='txt'>삭제된 상품 문의 입니다.</p>"
										);
								}
							}else if(data[i].qna_secret == 'N'){
								if(data[i].qna_status == 'Y'){
									$div1 = $("<div class='history_wrap'>")
									.html("<div id='proInquiry' style='border-top: 1px solid #ababab;'><div><ul id='inquiry' class='inquiry'><li id = 'content' class='txt_wrap'><div class='con-qa'><div class='info_top'><span class='name'>"
											+ decodeURIComponent(data[i].qna_user.replace(/\+/g,""))
											+ "</span>"
											+ "<span class='date'>"
											+ data[i].qna_createDate
											+ "<span></div><p class='txt'>"
											+ decodeURIComponent(data[i].qna_content.replace(/\+/g,""))+ "</p></div></li></ul></div></div></div>"																												
									);
								}else{
									$div1 = $("<div class='history_wrap'>")
										.html("<div id='proInquiry' style='border-top: 1px solid #ababab;'><div><ul id='inquiry' class='inquiry'><li id = 'content' class='txt_wrap'><div class='con-qa'><div class='info_top'><span class='name'>"
												+ decodeURIComponent(data[i].qna_user.replace(/\+/g,""))
												+ "</span>"
												+ "<span class='date'>"
												+ data[i].qna_createDate
												+ "<span ></div><p class='txt'>삭제된 상품 문의 입니다. </p>"
										);
								}
							}
						}				
						$div.append($div1);
						$div.append(div2);
					}
				}else{
					$div1 = $("<div class='qnanone'>").text("등록된 상품문의가 없습니다.");
					$div.append($div1);
				}
			}
		});
		}

	
		/* 수정 버튼 눌리며 */
		function modifyInquiry(i, qna_Id){
			console.log("수정할 게시판 번호 :  " + qna_Id);			
			
			var div = $('#history_wrap' + i);
			
			
			var text = $('#qnacontext' + i).text();
			
			console.log(div);
			console.log(text);
			
			var append = "";
			
	        append += "<div class='text-wrap'>";
	        append += "<div class='textarea'>";
	        append += "<textarea class='textarea-normal textarea_inquiriy' id='textarea" + i +"' name='content' cols='30' rows='10' maxlength='1000' >" + text + "</textarea>";                       
	        append += "<p class='textarea-limit length_inquiriy'> 자 / 1000자</p>";
	        append += "</div>";
	        append += "</div>";
	        append += "<div class='secret cf' style='display: flex;'>";
	        append += "<dl class='txt'>";
	        append += "<dt>";
	        append += "<div class='qa-checkbox'>";
	        append += "<span class='ico-lock'>lock</span>";
	        append += "<p class='checkbox-normal' style='display: inline-block; vertical-align: middle;'>";
	        append +="<input id='secretedCheckBox"+ i +"' type='checkbox'  >";
	        append += "<label></label>";
	        append += "</p>";
	        append += "비밀글 문의";
	        append += "</div>";
	        append += "</dt>";
	        append += "</dl>";
	        append += "<p class='btn-row' style='margin-left: auto;'>";
	        append += "<input value='' name='' type='hidden'>";	        
	        append += "<button type='button' class='btn white-2 style-3-1' onclick='cancelModifyInquiry()' style='border: 1px solid black;'>취소하기</button>";
	        append += "<button type='button' class='btn black style-3-1' onclick='submitModifyInquiry(" + qna_Id + "," + i + " );'>등록하기</button>";
	        append += "</p>";
	        append += "</div>";
	      
	        
	        
			//div.innerHTML = append;
			div.html(append);
	        
		}
		
		// 수정 하기에서 취소 버튼 눌렸을 때
		function cancelModifyInquiry(){
			getQnaList();
		}
		
		// 수정 버튼 눌렸을때
		function submitModifyInquiry(qna_Id, i){
			console.log("수정 받은 댓글 번호  : "+qna_Id);
			
			console.log(i);
			
			if($('#secretedCheckBox' + i ).prop("checked") ){
				var qna_secret = 'Y';
			}else{
				var qna_secret = 'N';
			}
		
			var qna_content = $('#textarea' + i).val();
			
			console.log("수정 내용 가지고 온다." + qna_content);
			console.log(qna_secret); 
			
			
			$.ajax({
				url : "updateQna.do",
				data:{qna_content:qna_content, qna_Id:qna_Id,qna_secret:qna_secret},
				type:"post",
				success:function(data){
					getQnaList();
				}
				
			});
			
			
			
		}

		// 삭제
		function deleteInquiry(qna_Id){
			console.log("삭제할 게시판 번호 :  " + qna_Id);		
			
			var key = confirm("상품 문의를 삭제하시 겠습니까? 삭제한 글은 복구 되지 않습니다.");
			
			if(!key){
				alert("삭제를 취소 하셨습니다.");
			}else{
				$.ajax({
					url:"deletedQna.do",
					data:{qna_Id : qna_Id},
					type:"post",
					success:function(data){
						if(data == "success"){
							getQnaList();
						}	
					}
				});
			}
			
		}
//=============================================================================

		
		var form = document.forms["CartandPaymentForm"];
		// 카트 넘기기
		$('#order_buy').click(function(){
			if(${sessionScope.loginUser eq null}){
				alert("로그인 후 이용가능한 서비스 입니다.");
			}else{
			$('#CartandPaymentForm').submit();
				
			}
			
			
		});
		
		$('#cart').click(function(){
			if(${sessionScope.loginUser eq null}){
				alert("로그인 후 이용가능한 서비스 입니다.");
			}else{
				
			   var formData = new FormData(form);
				 $.ajax({
			            cache : false,
			            url : "cartInsert.cart", // 요기에
			            processData: false,
			            contentType: false,
			            type : 'POST', 
			            data : formData, 
			            success : function(data) {
			        		var bool = confirm("장바구니에 추가되었습니다.바로 장바구니 페이지로 이동하겠습니까?");
			    			
			    			if(bool){
			    				
			    				
			    				location.href='CartView.do'; 
			    				
			    			}
			            	
			            }, 
			    
			            error : function(xhr, status) {
			                alert(xhr + " : " + status);
			            }
			        }); // $.ajax 
			}
		});
	</script>



	<input type="hidden" id="nick" value="${loginUser.nickName}">
</body>
</html>