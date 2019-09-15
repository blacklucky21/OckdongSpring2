<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myOwnPayment</title>
<link rel="stylesheet" href="resources/css/myOwn/myOwn.css">
<link rel="stylesheet" href="resources/css/myOwn/myOwn1.css">
<link rel="stylesheet" href="resources/css/myOwn/myOwn2.css">
</head>
<style>
.area_right.fixed {
    position: fixed;
    top: 81px;
}
</style>
<body>
	<c:import url="../header/header.jsp" />

	<div id="cnt">
		<div class="navigator">
			<div class="wrap_inner">
				<a href="/"><img src="/_skin/sw_kor/img/common/icon_home.gif"></a><img
					src="/_skin/sw_kor/img/common/icon_navigator_arrow.png"
					class="arrow">주문서 입력 폼
			</div>
		</div>
		
		<div id="order">
			<form name="ordFrm" method="post"
				action="https://www.dosirakmall.com/main/exec.php"
				target="hidden1568550056" onsubmit="return checkOrdFrm(this)"
				style="margin: 0px">
				<input type="hidden" name="mail_send" value="Y"> <input
					type="hidden" name="exec_file" value="order/order.exe.php">
				<input type="hidden" name="ono" value=""> <input
					type="hidden" name="cart_selected" value="99314"> <input
					type="hidden" name="currency_decimal" value="0"> <input
					type="hidden" name="order_type" value="5">

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
						<p class="brand_name">런잇</p>

						<ul class="cart_list">
							<li>
								<div class="box_left">
									<div class="img">
										<a><img src="" width="70" height="70" barder="0"></a>
									</div>
									<div class="box">
										<p class="brand"></p>
										<p class="name">
											<a>제목들어가는 부분입니다.</a>
										</p>
										<p class="delivery_price">무료배송 | 일반택배배송</p>
									</div>
								</div>
								<div class="box_right">
									<div class="option">
										<span></span> <span>수량 : 1</span> <span> 0 원</span>
									</div>
									<div class="price_box">
										<p class="price_text">상품 금액</p>
										<p class="price">42,000 원</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<!-- //주문상품정보 -->
				</div>
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
									<td class="orange">+ <span id="dlv_prc_cart">0</span> 원
									</td>
								</tr>
								<tr>
									<th>할인 금액 합계</th>
									<td class="orange">- <span class="total_sale_prc">12,100</span>
										원
										<div class="view_info">
											<div class="order_area_event_prc" style="display: none;">
												이벤트 할인금액 : <span class="order_saleinfo_event_prc">0</span>원
											</div>
											<div class="order_area_timesale">
												타임세일금액 : <span class="order_saleinfo_timesale">12,100</span>원
											</div>
											<div class="order_area_member_prc" style="display: none;">
												회원할인금액 : <span class="order_saleinfo_member_prc">0</span>원
											</div>
											<div class="order_area_cpn_prc" style="display: none;">
												쿠폰할인금액 : <span class="order_saleinfo_cpn_prc">0</span>원
											</div>
											<div class="order_area_prd_prc" style="display: none;">
												상품금액별할인금액 : <span class="order_saleinfo_prd_prc">0</span>원
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th>적립금 사용</th>
									<td class="orange">- <span class="use_milage_prc">0</span>
										원
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
					<!-- 사은품 -->
					<div id="gift_area"></div>
					<!-- //사은품 -->

					<h3 class="title">할인/혜택 사용</h3>
					<table class="tbl_order">
						<caption class="hidden">할인 / 혜택 사용</caption>
						<colgroup>
							<col style="width: 18%;">
							<col>
						</colgroup>
						<tbody>




							<!-- 쿠폰사용 -->

							<tr>
								<th scope="row">쿠폰 사용</th>
								<td>
									<ul class="coupon_list">
										<li><span class="check"><input type="hidden"
												id="coupon_stype_81052" value="1"><input
												type="hidden" name="coupon_pay_type" value="1"><input
												type="radio" name="coupon" id="coupon" value="81052"
												onclick="useCpn(0,'p','10','10','5000','1','81052','')"></span>
											<p class="name">첫 구매 지원! 전 제품 10% 할인 쿠폰 (최대 5,000원)</p>
											<p class="content">
												최소주문금액 : 10원 이상 / 할인액(율) : 10% / 사용기간 : ~ 2019-09-22 <br>최대할인금액
												5,000 원
											</p></li>
										<li><span class="check"><input type="radio"
												id="no_cpn" name="coupon" value=""
												onclick="useCpn(this.form,'','');"></span>
											<p class="name">사용안함</p>
											<p class="content"></p></li>
									</ul>
								</td>
							</tr>
							<tr>
								<th scope="row">쿠폰 등록하기</th>
								<td class="offcpn">
									<div id="off_cpn_div1">
										<input type="text" name="cpn_auth_code"
											placeholder="쿠폰 번호 입력란" class="form_input">
										<div class="box_btn">
											<a href="javascript:;" onclick="cpnAuthCode();">확인</a>
										</div>
										<p class="msg"></p>
									</div>
									<div id="off_cpn_div2">
										<p id="off_cpn_msg"></p>
										<p id="off_cpn_img2"></p>
										<p id="off_cpn_used"></p>
										<p id="off_cpn_img1" class="offbtn">
											<span class="box_btn"><a href="javascript:;"
												onclick="useOffCpn();">쿠폰사용</a></span>
										</p>
										<p class="offbtn">
											<span class="box_btn white"><a href="javascript:;"
												onclick="cancelOffCpn();">쿠폰사용취소</a></span>
										</p>
									</div>
								</td>
							</tr>
							<!--// 쿠폰사용 -->
						</tbody>
					</table>

					<h3 class="title">주문자 입력</h3>
					<table class="tbl_order">
						<caption class="hidden">주문자 입력</caption>
						<colgroup>
							<col style="width: 18%;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row"><label for="order_buyer_name">주문하시는
										분</label></th>
								<td><input type="text" name="buyer_name" value="최경천"
									id="order_buyer_name" class="form_input"
									isplaceholderinited="true"></td>
							</tr>
							<tr>
								<th scope="row"><label for="buyer_phone">전화번호</label></th>
								<td><input type="text" name="buyer_phone" id="buyer_phone"
									value="" class="form_input remove_dash"
									isplaceholderinited="true"></td>
							</tr>
							<tr>
								<th scope="row"><label for="buyer_cell">휴대전화번호</label></th>
								<td><input type="text" name="buyer_cell" id="buyer_cell"
									value="01091705749" class="form_input remove_dash"
									isplaceholderinited="true"></td>
							</tr>
							<tr>
								<th scope="row"><label for="order_buyer_email">이메일</label></th>
								<td><input type="text" name="buyer_email"
									value="ckc5749@naver.com" id="order_buyer_email"
									class="form_input mail3" isplaceholderinited="true"></td>
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
								<th scope="row"><label for="order_addressee_name">받으시는
										분</label></th>
								<td><input type="text" name="addressee_name" value=""
									id="order_addressee_name" class="form_input"
									isplaceholderinited="true"></td>
							</tr>
							<tr>
								<th scope="row"><label for="addressee_cell">휴대전화번호</label></th>
								<td><input type="text" name="addressee_cell"
									id="addressee_cell" class="form_input remove_dash"
									isplaceholderinited="true"></td>
							</tr>
							<tr>
								<th scope="row"><label for="order_addressee_zip">주소</label></th>
								<td class="address">
									<p class="zip">
										<input type="text" name="addressee_zip" value=""
											id="order_addressee_zip" class="form_input input_zipcode"
											readonly=""
											onclick="zipSearch('ordFrm','addressee_zip','addressee_addr1','addressee_addr2')"
											isplaceholderinited="true"> <span
											class="box_btn white"><a href="javascript:;"
											onclick="zipSearch('ordFrm','addressee_zip','addressee_addr1','addressee_addr2')">
												우편번호 찾기</a></span>
									</p>
									<p>
										<input type="text" name="addressee_addr1" value=""
											class="form_input" readonly=""
											onclick="zipSearch('ordFrm','addressee_zip','addressee_addr1','addressee_addr2')"
											isplaceholderinited="true"> <input type="text"
											name="addressee_addr2" value="" class="form_input"
											isplaceholderinited="true">
									</p>
								</td>
							</tr>
							<tr>
								<th scope="row"><label for="order_dlv_memo">배송시요청사항</label></th>
								<td><textarea type="text" name="dlv_memo" value=""
										id="order_dlv_memo" class="form_input block"
										isplaceholderinited="true"></textarea></td>
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
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > areaRight.top ) {
            $( '.area_right' ).addClass('fixed');
          }
          else {
            $( '.area_right' ).removeClass('fixed');
          }
        });
      } );
	</script>
</body>
</html>