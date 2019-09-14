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
 <link rel="stylesheet" href="resources/css/product/productDetail.css"> 

<!-- css 끝 -->

<!-- js 시작 -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
						<span class="sale-price"> ${p.p_price} 원</span>
					</div>
					
					<c:if test="${ p.p_sell ne 'N' }">
					<div class="categori">분류           <span>${ p.p_lunchtype }</span></div>
					<div class="manufact">배송비       <span>2500 원</span></div>
					<div class="origin">수량           <div class="amount"><button class="decrease" onclick="cntSet('minus')">-</button><input id="orderCnt" class="input-normal" type="text" maxlength="8" autocomplete="off"  value="1" onblur="buyCountInputCheck(this)" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"><button class="increase"  onclick="cntSet('plus')">+</button></div></div>
					<div class="items">
						
					</div>
					<div class="all-price">총 상품금액        <span>0</span>원</div>
					<div class="btn">
						<a href="">장바구니</a>
						<a href="">구매하기</a>
					</div>
					</c:if>	
					
					<c:if test="${ p.p_sell eq 'N' }">
					<div class="btn">
						<button class="nosell">구매불가</button>
						</div>
					</c:if>
					 
				</div>
			</div>
			
<!-- 하단의 탭부분 시작 -->
			<div class="viewBody">
				<ul class="contentNav">
					<li class="active"><a href="">상품 정보</a></li>
					<li><a href="">상품 후기<span>(<span class="count">20</span>)</span></a></li>
					<li><a href="">Q & A <span></span></a></li>
					<li><a href="">반품 / 교환</a></li>
				</ul>
				<!-- 탭부분 끝 -->
				<!-- 상품정보 -->
					<p id="productinfo" class="productinfo">${ p.p_content }</p>
					<img src="resources/img/detail01.jpg" id = "intro"class="productinfo">
				
					<table class="tproduct-info active">
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
				<table class="tproduct-review">
					<thead>
						<tr>
							<td>평점</td>
							<td>내용</td>
							<td>작성자</td>
							<td>작성일</td>
						</tr>
					</thead>
					<tr>
						<td>별점</td>
						<td class="tcontent"><img src="" alt=""><span>내용 - 짧은 내용(동해물과 백두산이 마르고 닳도록 하느님이 보우하사 우리나라만세</span></td>
						<td>rud***</td>
						<td>2017-09-26 10:20</td>
					</tr>
					<tr class="detail-content">
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</table>
				<!-- Q & A  -->
					<table class="tquestion">
						<thead>
							<tr>
								<td>번호</td>
								<td colspan="2">내용</td>
								<td>작성자</td>
								<td>작성일
								<a href="">문의 하기</a>
								</td>
							</tr>
					</thead>
						<tr>
							<td>글번호</td>
							<td class="answer-no">미완료</td>
							<td class="tcontent">내용 - 문의</td>
							<td>rud***</td>
							<td>2017-09-26 10:20</td>
						</tr>
						<tr>
							<td>글번호</td>
							<td class="answer-ok">답변완료</td>
							<td class="tcontent">내용 - 문의</td>
							<td>rud***</td>
							<td>2017-09-26 10:20</td>
						</tr>
					</table>
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
	// 사이드 사진 클릭시 메인으로 변경
	function side(pick){
	/* 	$('#mainim').attr("src","pick"); */
	document.getElementById("mainim").src=pick;
	}
	
	// 수량 증가/감소 
	var cntSet = function (type,optionNo) {

    var cntElement = null;
    if(optionNo){
        cntElement = $('#orderCnt-' + optionNo);
    }else{
        cntElement = $('#orderCnt');
    }

    var orderCnt = cntElement.val();
    if (type == 'plus') {
        orderCnt = eval(orderCnt) + 1;
    } else if (type == 'minus') {
        orderCnt = eval(orderCnt) - 1;
    }
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

	
	var price_sum = 0;
	var options = [];

	// 가격초기화 되지않는 문제
	 $(document).ready(function(){
	
	   // 탭 변경 부분
	   $('.contentNav li').click(function(e){
	      e.preventDefault(); /* 상의 이벤트 전파를 막기 위해 사용 a 태그 작동 안하게됨  */
	  var idx = $(this).index();
	  $('.contentNav li').removeClass('active').eq(idx).addClass('active');
	  $('table').removeClass('active').eq(idx).addClass('active');
	 });

	   // 상품 후기 부분 
	   $('.tproduct-review tbody tr .tcontent').click(function(){
	   //전체 글자의 변수를 2번 잡아서 . 한번은 위쪽 내용. 한번은 아래쪽 내용 출력
	   //위쪽 내용
	    var text = $(this).children('span').html(); //전체 html또는 text를 가져와서
	    var full = $(this).closest('tr').next('tr').children('td').eq(1).text(text).css('text-align','left'); // tr 출력후 나머지 글자 출력 및 정렬
	    // var cut = $(this).closest('tr').next('tr').children('td').eq(1).text();
	   $(this).closest('tr').next('tr').toggleClass('display'); //자세한 이용후기 tr 출력하기
	  });
	});

	//상품 목록에서 삭제 기능 - 완
	$(document).on('click','.item-close',{},function(e){
	   e.preventDefault();
	   var $el = $(e.currentTarget);
	   $el.closest('.item').remove();
	   //삭제 시 총 가격에서 빼기 - 50% 완(전역으로 지정한 price_sum은 0으로 초기화가 안되고있음)
	   var src_price = $el.siblings('.item-price').text();
	   var price = src_price.split('원');
	   var price_sum = $('.all-price span').html();
	   var result_price = price_sum - price[0];
	   $('.all-price span').html(result_price);
	   // var price_sum = 0;

	   //  if($('.item').length = '0'){
	   //  var price_sum = 0;
	   //     $('.all-price span').html(price_sum);
	   // }
		 if($('.item').length='0'){
				var price_sum = 0;
		 }
	  options = $.grep(options, function(value) {
	    return value != $.trim($el.closest('.item').find('.item-name').text());
	  });
	  // console.log(options);
	var price_sum = 0;
	});
	var price_sum = 0;
	</script>
</body>
</html>