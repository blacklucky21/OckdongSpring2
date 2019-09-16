<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myOwnPayment</title>
<link rel="stylesheet" href="resources/css/myOwn/myOwnPayment1.css">
<link rel="stylesheet" href="resources/css/myOwn/myOwnPayment2.css">
<link rel="stylesheet" href="resources/css/myOwn/myOwnPayment3.css">
</head>
<style>
.area_right.fixed {
    position: fixed;
    top: 81px;
}
.imgIn Img{
	width: 100px;
	height: 100px;
}
table{
	margin: 20px;	
}
th, td{
	padding-right: 5px;
}
th{
	width: 110px;
	padding-right: 5px;
}
</style>
<body>
	<c:import url="../header/header.jsp" />

	<div id="cnt">
		<div class="navigator">
			<div class="wrap_inner">주문서 입력 폼
			</div>
		</div>
		
		<div id="order">
			<form name="ordFrm" method="post" action="" style="margin: 0px">
				<div class="cart_title_box">
					<p class="title">주문/결제</p>
					<p class="location">
						나만의 도시락 <img src="https://www.dosirakmall.com/_skin/dosirakmall_181004_2_1/img/common/icon_arrow_right.gif">
						<span>주문/결제</span> <img src="https://www.dosirakmall.com/_skin/dosirakmall_181004_2_1/img/common/icon_arrow_right.gif">
						완료
					</p>
				</div>
				<div class="area_left">
					<p class="order_info_title">주문 상품 정보</p>
					<!-- 주문상품정보 -->
					<div class="enterprise head">
						<p class="brand_name">나만의 도시락 <c:if test="${soup eq null}">4</c:if><c:if test="${soup ne null}">5</c:if>찬</p>

						<ul class="cart_list">
							<li>
								<div class="box_left">
									<div class="img">
										<a><img src="resources/img/Recipe/${fileName }.png" barder="0"></a>
									</div>
									<div class="box">
										<p class="brand"></p>
										<p class="name"><a>제목들어가는 부분입니다.</a></p>
										<p class="delivery_price">무료배송 | 일반택배배송</p>
									</div>
								</div>
								<div class="box_right">
									<div class="option">
										<span>수량 :
											<input type="number" class="quantity" name="quantity" min="1" max="100" value="1">
        								</span>
        							</div>
									<div class="price_box">
										<p class="price_text">상품 금액</p>
										<p class="price">
											<c:if test="${empty soup}">
												<input type="hidden" class="standardPrice" name="standardPrice" value="4000"/>
												<a class="totalPrice">4000</a>원
											</c:if>
											<c:if test="${!empty soup}">
												<input type="hidden" class="standardPrice" name="standardPrice" value="4000"/>
												<a class="totalPrice">5000</a>원
											</c:if>
										</p>
									</div>
									<script>
										$(function(){
											$(".quantity").click(function(){
												console.log(this);
												var quantity = $(this).val();
												console.log(quantity);
												var price = $(".standardPrice").val();
												console.log(price);
												var result = quantity * price;
												console.log(result);
												$(".totalPrice").text("");
												$(".totalPrice").text(result);
											});
											$(".quantity").keyup(function(){
												console.log(this);
												var quantity = $(this).val();
												console.log(quantity);
												var price = $(".standardPrice").val();
												console.log(price);
												var result = quantity * price;
												console.log(result);
												$(".totalPrice").text("");
												$(".totalPrice").text(result);
											});
										});
									</script>
								</div>
							</li>
							<li>
								<table>
									<tr>
										<th scope="col"></th>
										<th scope="col">재료 타입</th>
										<th scope="col">재료 명</th>
										<th scope="col">재료 양(g)</th>
										<th scope="col"></th>
										<th scope="col">재료 타입</th>
										<th scope="col">재료 명</th>
										<th scope="col">재료 양(g)</th>
										
									</tr>
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
							</li>
						</ul>
					</div>
					<!-- //주문상품정보 -->
				</div>
				
				<!-- 주문 금액 정보 -->
				<div class="area_right">
					<div class="box">
						<p class="title">1회 배송 주문정보</p>
						<table class="tbl_order3">
							<colgroup>
								<col style="width: 50%;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th>총 상품금액</th>
									<td><span>42,000</span> 원</td>
								</tr>
								<tr>
									<th>배송비 합계</th>
									<td class="orange"> + <span id="dlv_prc_cart">0</span> 원
									</td>
								</tr>
							</tbody>
						</table>
						<p class="order_price_text">결제 금액</p>
						<p class="order_price">
							<span class="price"><span class="order_info_sale_prc">29,900</span></span>원
						</p>
						<p class="mileage_complete">
							적립예정 <span><span class="total_milage">299</span></span> 원
						</p>
						<p style="padding: 5px 0px;">
							<label for="agree-private"><input type="checkbox"
								id="agree-private" name="agree_private" value="Y">상기
								결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
						</p>
						<input type="submit" value="결제하기" class="btn_pay">
					</div>
				</div>
				<div class="area_left">
					<h3 class="title">주문자 입력</h3>
					<table class="tbl_order">
						<caption class="hidden">주문자 입력</caption>
						<colgroup>
							<col style="width: 18%;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="order_buyer_name">주문하시는 분</label></th>
								<td>
									<c:if test="${sessionScope.loginUser.userName ne null}">
										<input type="text" name="buyer_name" value="${sessionScope.loginUser.userName }"id="order_buyer_name" class="form_input">
									</c:if>
									<c:if test="${sessionScope.loginUser.userName eq null}">
										<input type="text" name="buyer_name" value=""id="order_buyer_name" class="form_input">
									</c:if>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="buyer_ph">집전화 번호</label></th>
								<td>
									<input type="text" name="buyer_ph" id="buyer_ph" value="" class="form_input remove_dash">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="buyer_cell">휴대전화 번호</label></th>
								<td>
									<c:if test="${sessionScope.loginUser.phone ne null}">
										<input type="text" name="buyer_cell" id="buyer_cell" value="${sessionScope.loginUser.phone}" class="form_input remove_dash">
									</c:if>
									<c:if test="${sessionScope.loginUser.phone eq null}">
										<input type="text" name="buyer_cell" id="buyer_cell" value="" class="form_input remove_dash">
									</c:if>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="order_buyer_email">이메일</label></th>
								<td>
									<c:if test="${sessionScope.loginUser.email ne null}">
										<input type="text" name="buyer_email" value="${sessionScope.loginUser.email}" id="order_buyer_email" class="form_input mail3">
									</c:if>
									<c:if test="${sessionScope.loginUser.email eq null}">
										<input type="text" name="buyer_email" value="" id="order_buyer_email" class="form_input mail3">
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="title_delivery">
						<h3 class="title">배송지 정보</h3>
					</div>
					<table class="tbl_order">
						<caption class="hidden">배송지 정보</caption>
						<colgroup>
							<col style="width: 18%;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="order_addressee_name">받으시는 분</label></th>
								<td>
									<input type="text" name="addressee_name" value="" id="order_addressee_name" class="form_input">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="addressee_cell">휴대전화번호</label></th>
								<td>
									<input type="text" name="addressee_cell" id="addressee_cell" class="form_input remove_dash">
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="order_addressee_zip">주소</label></th>
								<td class="address">
									<p class="zip">
										<input type="text" name="addressee_zip" value="" id="order_addressee_zip" class="form_input input_zipcode">
										<span class="box_btn white">
											<a href="javascript:;" onclick="addresseeZip();"> 우편번호 찾기</a>
										</span>
									</p>
									<p>
										<input type="text" name="addressee_addr1" value="" class="form_input">
										<input type="text" name="addressee_addr2" value="" class="form_input">
									</p>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="order_dlv_memo">배송시요청사항</label></th>
								<td><textarea type="text" name="dlv_memo" value="" id="order_dlv_memo" class="form_input block"></textarea></td>
							</tr>
							<!-- ADDINFO_DONE -->
						</tbody>
					</table>
				</div>
			</form>
		</div>

	</div>
	<br clear="all">
	<c:import url="../footer/footer.jsp" />
	<script>
	$( document ).ready( function() {
        var areaRight = $( '.area_right' ).offset();
        if ( $( document ).scrollTop() > areaRight.top ) {
        	$( '.area_right' ).addClass('fixed');
        }else {
        	$( '.area_right' ).removeClass('fixed');
        }
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > areaRight.top ) {
            $( '.area_right' ).addClass('fixed');
          } else {
            $( '.area_right' ).removeClass('fixed');
          }
        });
      } );
	</script>
</body>
</html>