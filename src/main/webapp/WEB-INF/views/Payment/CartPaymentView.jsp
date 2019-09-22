<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="resources/css/cart/CartView.css">

<style>

.area_right.fixed {
    position: fixed;
    top: 81px;
}
</style>
<body>

	<c:import url="../header/header.jsp"/>
	
	<c:set var="pa" value="${list }"/>
	<c:set var="pc" value="${PayProduct }"/>
	<form action="PaymentResultList.do" method="post" id="insertPaymentAbout"  >
	<div class="content" style="width:100%; text-align:center">

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
									<td><span class="totalGoodsPrice"></span> 원</td>
						
								</tr>
								<tr>
									<th>배송비 합계</th>
									<td class="orange">+ <span class="totalDeliveryCharge">0</span> 원
									</td>
								</tr>
								<!-- <tr>
									<th>할인 금액 합계</th>
									<td class="orange">- <span class="total_sale_prc">12,100</span>원
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
								</tr> -->
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
							<span class="price"><span class="totalSettlePrice"></span></span>원
						</p>
						<p class="mileage_complete">
							적립예정 <span><span class="total_milage">0</span></span> 원
						</p>
						<p style="padding: 5px 0px;">
							<label for="agree-private"><input type="checkbox" class="require" id="agree-private" name="agree_private" value="Y">상기
								결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
						</p>
						
						<input type="button" value="결제하기" class="btn_pay order-buy">
					</div>
				</div>
	<div class="order-page" style="display:inline-block">
	
	
            <div class="step-top">
         
                <div>
                    <span><strong>01</strong> 장바구니</span>
                    <span class="this" title="현재페이지"><strong>02</strong> 주문서작성/결제</span>
                    <span class="end"><strong>03</strong> 주문완료</span>
                </div>
            </div>
            <h3 class="fir">주문상세내역</h3>
            <div class="table1 type1">
                <!-- 장바구니 상품리스트 시작 -->
                <table>
                    <thead>
                    <tr>
                        <th>상품/옵션 정보</th>
                        <th>수량</th>
                        <th>상품금액</th>
                        <th>할인/적립</th>
                        <th>합계금액</th>
                        <th>배송비</th>
                    </tr>
                    </thead>
                    <tbody>
                    
                    <c:if test="${list ne null }">
                     <input type="hidden" name="paytext" class="paytext">
					<c:forEach var="c" items="${list }" varStatus="cart">
					
                    <tr>
                        <td class="gi this-product">
                       
                             <input type="hidden" name="p_id" value="${c.p_id }">
                        	<input type="hidden" name="cNo" value='${c.cNo }'>
                            <input type="hidden" name="cartSno[]" value="16">
                            <span><a href="../goods/goods_view.php?goodsNo=1000000107"><img src="${c.c_img }" width="90" alt="사진" title="사진" class="middle"></a></span>
                            <div>

                                <a href="../goods/goods_view.php?goodsNo=1000000107">${c.cName }</a>

                                <dl>
                                    <dt></dt>
                                    <dd>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt></dt>
                                    <dd>
                                    </dd>
                                </dl>

                            </div>
                        </td>
                        <td class="ta-c count this-product">
                          ${c.cAmount}
                        </td>
                        <td class="ta-c this-product">
                            <strong class="price">${c.cPrice}원</strong>
                        </td>
                        <td class="benefits">

                        </td>
                        <td class="ta-c">
                        <strong class="price totalAmount" >${c.cPrice *c.cAmount }</strong><strong class="price">원</strong>
                        </td>
                        
                          <c:if test="${cart.count== 1}">
                        <td rowspan="${list.size() }" class="ta-c">
                        <span class="c-gray delivaryAmount">
                            기본 - 금액별배송비<br>
                           2500원
                        </span> <br>  <span style="font-size:11px;">2만원 이상 주문시<br> 
																	 배송비 무료!</span> 
                                     </td>
                                     </c:if>
                                   
                    </tr>

                 </c:forEach>
                 </c:if>
                 
				<c:if test="${PayProduct ne null }">
				  <tr>
                        <td class="gi this-product">
                        <input type="hidden" name="p_num" value="${pc.p_id }">
                        <input type="hidden" name="p_id" value="${pc.p_id }">
                        	<input type="hidden" name="p_img" value="${pc.c_img }">
                        	<input type="hidden" name="id" value="${pc.id }">
                        	<input type="hidden" name="pname" value="${pc.cName }">
                        	<input type="hidden" name="paytext" value="${pc.cName }">
                        	<input type="hidden" name="pamount" value="${pc.cAmount }">
                        	<input type="hidden" name="cAmount" value="${pc.cAmount }">
                        	<input type="hidden" name="pprice" value="${pc.cPrice }">
                      
                            <input type="hidden" name="cartSno[]" value="16">
                            <span><a href="../goods/goods_view.php?goodsNo=1000000107"><img src="${pc.c_img }" width="40" alt="사진" title="사진" class="middle"></a></span>
                            <div>

                                <a href="../goods/goods_view.php?goodsNo=1000000107">${pc.cName }</a>

                                <dl>
                                    <dt></dt>
                                    <dd>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt></dt>
                                    <dd>
                                    </dd>
                                </dl>

                            </div>
                        </td>
                        <td class="ta-c count this-product">
                          ${c.cAmount}
                        </td>
                        <td class="ta-c this-product">
                            <strong class="price">${pc.cPrice}원</strong>
                        </td>
                        <td class="benefits">

                        </td>
                        <td class="ta-c">
                        <strong class="price totalAmount" >${pc.cPrice *pc.cAmount }</strong><strong class="price">원</strong>
                        </td>
                        
                        
                        <td rowspan="1" class="ta-c">
                        <span class="c-gray delivaryAmount">
                            기본 - 금액별배송비<br>
                           2500원
                        </span> <br>  <span style="font-size:11px;">2만원 이상 주문시<br> 
																	 배송비 무료!</span> 
                                     </td>
                                     
                                   
                    </tr>
				
				
				
				</c:if>


                    </tbody>
                </table>
                <!-- 장바구니 상품리스트 끝 -->

            </div>
            <c:if test="${empty pc}">
            <a class="btn-move-home" href="CartView.do">장바구니 가기</a>
			</c:if>
            <div class="price-box">
                <div>
                    <p>
                        <span class="detail">총 <em id="totalGoodsCnt"></em>개의 상품금액 <strong class="totalGoodsPrice">0</strong>원</span>
                        <span><img src="resources/img/etc/plus.png" alt="더하기">배송비 <strong class="totalDeliveryCharge">0</strong>원</span>
                        <span class="total"><img src="resources/img/etc/total.png" alt="합계"><strong class="totalSettlePrice">0</strong>원
                        </span>
                    </p>
                    <span class="mileage">적립예정 마일리지 : <span>0</span> 원</span>
                </div>
            </div>

		<c:set var="m" value="${member}"/> 
		
            <span class="join-form">
                <fieldset id="fds-order-info">
                    <legend>주문폼</legend>
                    <h3>주문자 정보</h3>
                    <div class="table1 orderplz" >
                        <table>
                            <colgroup>
                                <col style="width:133px;">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th class="ta-l required"  >주문하시는 분</th>
                                <td>
                                    <div class="txt-field hs text" style="width:160px;">
                                        <input type="text" name="payname" value="${m.userName }" data-pattern="gdEngKor" maxlength="20" class="text" required>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l">전화번호</th>
                                <td>
                                    <span class="txt-field hs" style="width:160px;">
                                        <input type="text" id="phoneNum" name="payphone" value="${m.phone }" maxlength="20" class="text">
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l required"  >휴대폰 번호</th>
                                <td>
                                    <span class="txt-field hs" style="width:160px;">
                                        <input type="text" id="mobileNum" name="paycellphone" value="${m.phone}" maxlength="20" class="text" required>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l required"  >이메일</th>
                                <td>
                                    <div class="email" style="display:inline">
                                        <span class="txt-field hs" style="width:160px;">
                                            <input type="text" name="orderEmail1" value="" class="text orderEmail">
                                            <input type="hidden" name="payemail" class="payemail">
                                        </span>
                                        <span class="txt-field hs" style="width:100px;">
                                            <input type="text" name="orderEmail" value="" class="text orderEmail2">
                                        </span>
                                        <div class="choice-select" style="display:inline">
                                            <span class="st-hs">
                                                <select id="emailDomain" class="tune" style="width: 120px; " tabindex="-1" onchange="selectEmail(this)">
                                                    <option value="1">직접입력</option>
                                                    <option value="naver.com">naver.com</option>
                                                    <option value="hanmail.net">hanmail.net</option>
                                                    <option value="daum.net">daum.net</option>
                                                    <option value="nate.com">nate.com</option>
                                                    <option value="hotmail.com">hotmail.com</option>
                                                    <option value="gmail.com">gmail.com</option>
                                                    <option value="icloud.com">icloud.com</option>
                                                </select>
                                            </span>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <h3>배송정보</h3>
                    <div class="table1 orderplz orderCheckTable">
                        <table>
                            <colgroup>
                                <col style="width:133px;">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th class="ta-l ">배송지 확인</th>
                                <td>
                                    <span class="form-element">
                                        <input type="radio" name="shipping" id="shippingBasic" class="radio">
                                        <label class="choice-s" for="shippingBasic">기본 배송지</label>
                                    </span>
                                    <span class="form-element">
                                        <input type="radio" name="shipping" id="shippingRecently" class="radio">
                                        <label class="choice-s" for="shippingRecently">최근 배송지</label>
                                    </span>
                                    <span class="form-element">
                                        <input type="radio" name="shipping" id="shippingNew" class="radio">
                                        <label class="choice-s on" for="shippingNew">직접 입력</label>
                                    </span>
                                    <span class="form-element">
                                        <input type="radio" name="shipping" id="shippingSameCheck" class="radio">
                                        <label class="choice-s" for="shippingSameCheck">주문자정보와 동일</label>
                                    </span>
                                    <a href="#myShippingListLayer" class="btn-open-layer normal-btn small2 shipping"><em>배송지 관리</em></a>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l required"   >받으실분</th>
                                <td>
                                    <div class="txt-field hs" style="width:160px;">
                                        <input type="text" name="receiverName" value="${m.userName}" data-pattern="gdEngKor" maxlength="20" class="text " required>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l required"  >받으실 곳</th>
                                <td>
                                    <div class="post" style="width:auto; display:flex">
                                        <div class="txt-field hs" style="width:100px;">
                                            <input type="text" name="receiverZonecode" id="receiverZonecode" placeholder="우편번호"value="${m.address}" readonly="readonly" style="width:80px; " class="text" required>
                                            <input type="hidden" name="receiverZipcode" value="">
                                            <span id="receiverZipcodeText" class="text" ></span>
                                               
                                        </div>
                                     	<button type="button" style="margin-left:30px;"  class="normal-btn small2 post-search"><em>우편번호검색</em></button>
                                    </div>
                                    <div class="sa">
                                        <span class="txt-field hs" style="width:400px;">
                                            <input type="text" name="receiverAddress" id="receiverAddress" value="" readonly="readonly" placeholder="기본주소"class="text" required>
                                        </span>
                                        <span class="txt-field hs" style="width:300px;">
                                            <input type="text" name="receiverAddressSub" value="" class="text receiverAddressSub" placeholder="상세주소" required>
                                        </span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l">전화번호</th>
                                <td>
                                    <span class="txt-field hs" style="width:160px;">
                                        <input type="text" id="receiverPhone" name="receiverPhone" value="${m.phone }" class="text">
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l required"  >휴대폰 번호</th>
                                <td>
                                    <span class="txt-field hs" style="width:160px;">
                                        <input type="text" id="receiverCellPhone" name="receiverCellPhone" value="${m.phone }" class="text" required>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l">남기실 말씀</th>
                                <td>
                                    <div class="txt-field hs">
                                        <input type="text" name="orderMemo" value="" class="text">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l">배송 날짜 선택</th>
                                <td>
                                    <span class="form-element">
                                  		<input type="date" class="delivaryDate" id="delivaryDate" name="" required>
                                  		<input type="time" class="delivaryTime" id="delivaryTime" name="delivaryTime" value="13:00" required>
                                    </span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <input type="hidden" class="toTalCheckArr">
                    <input type="hidden" name="userid" value="${loginUser.userId }">
                    	<input type="hidden" name="payaddress" class="payaddress">
                    	<input type="hidden" name="delivaryDate" class="delivaryCheck">
                   
				</form>

                    <h3>결제정보</h3>
                    <div class="table1 orderplz">
                        <table>
                            <colgroup>
                                <col style="width:133px;">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th class="ta-l">상품 합계 금액</th>
                                <td>
                                    <strong class="total" id="totalGoodsPrice2">원</strong>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l">배송비</th>
                                <td>
                                    <span class="totalDeliveryCharge">2000</span>원
                                </td>
                            </tr>
                            <tr id="rowDeliveryInsuranceFee" class="dn">
                                <th class="ta-l">해외배송 보험료</th>
                                <td>
                                    <span id="deliveryInsuranceFee">0</span>원
                                    <input type="hidden" name="deliveryInsuranceFee" value="0">
                                </td>
                            </tr>
                            <tr id="rowDeliverAreaCharge" class="dn">
                                <th class="ta-l">지역별 배송비</th>
                                <td>
                                    <span id="deliveryAreaCharge">0</span>원
                                    <input type="hidden" name="totalDeliveryCharge" value="0">
                                    <input type="hidden" name="deliveryAreaCharge" value="0">
                                </td>
                            </tr>
                          
                            <tr>
                                <th class="ta-l c-red">최종 결제 금액</th>
                                <td class="final">
                                    <span class="c-red">
                                    <input type="hidden" name="settlePrice" value="97000">
                                    <input type="hidden" name="overseasSettlePrice" value="0">
                                    <input type="hidden" name="overseasSettleCurrency" value="KRW">
                                    <strong id="finalTotalPrice"></strong>원</span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="how-to-pay orderplz">
                        <h3>결제하기</h3>
               <!--          <div class="method">
                            <div class="js-pay-content">

                                일반결제 컨텐츠
                                <div class="process" id="settlekind_general">
                                    <div class="title-element">
                                        일반결제
                                    </div>
                                    <div class="selection">
                                        <span class="form-element">
                                            <input type="radio" name="settleKind" id="settleKind_gb" value="gb" class="radio">
                                            <label class="choice-s on" for="settleKind_gb">무통장 입금</label>
                                        </span>

                                        무통장입금 컨텐츠
                                        <ul class="bank" id="settlekind_general_gb" style="display: block;">
                                            <li>
                                                <p>( 무통장 입금 의 경우 입금확인 후부터 배송단계가 진행됩니다. )</p>
                                            </li>
                                            <li>
                                                <strong>입금자명</strong>
                                                <div>
                                                    <span class="txt-field hs">
                                                        <input type="text" name="bankSender" class="text">
                                                    </span>
                                                </div>
                                            </li>
                                            <li>
                                                <strong>입금은행</strong>
                                                <div>
                                                    <span class="st-hs">
                                                        <select name="bankAccount" class="tune" style="width: 354px; display: none;">
                                                            <option value="">선택하세요</option>
                                                        </select><div class="chosen-container chosen-container-single chosen-container-single-nosearch" style="width: 354px;" title=""><a class="chosen-single chosen-sch" tabindex="-1"><span>선택하세요</span><div><b></b></div></a><div class="chosen-drop"><div class="chosen-search"><input type="text" autocomplete="off" readonly=""></div><ul class="chosen-results"></ul></div></div>
                                                    </span>
                                                </div>
                                            </li>
                                        </ul>
                                        //무통장입금 컨텐츠






                                    </div>
                                </div>
                                //일반결제 컨텐츠


                            </div>

                        
                        </div> -->
                        <div class="buy">
                            <div class="final-settlement">
                                <em>최종 결제 금액</em>
                                <span class="c-red"><strong id="totalSettlePriceView"></strong>원</span>
                            </div>
                            <div class="required-check termAgree-check">
                                <h4 class="dn">청약의사 재확인</h4>
                                <span class="form-element">
                                    <input type="checkbox" id="termAgree_orderCheck orderCheck" class="checkbox require">
                                    <label for="termAgree_orderCheck " class="check-s"><strong>(필수)</strong> <em>구매하실 상품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</em></label>
                                </span>
                            </div>
                            <div class="btn" style="float:right">
                            <div>
                                <button type="button" class="skinbtn point2 order-buy" ><em>결제하기</em></button>
                            </div>
                            </div>
                        </div>
                    </div>
                </fieldset>
        </span></div>
                               
     
	</div>
	
	<script type="text/javascript">
	
	//이메일
	 /* select_email_domain('orderEmail');
     select_email_domain('taxEmail','taxEmailDomain');
     $("#taxEmailDomain_chosen").width("120px"); */
	</script>

<script>

</script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">


$('.post-search').click(function(){
    new daum.Postcode({
  
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('receiverZonecode').value = data.zonecode;
            document.getElementById("receiverAddress").value = roadAddr;
            /* document.getElementById("sample4_jibunAddress").value = data.jibunAddress; */
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
    			if(roadAddr !== ''){
                document.getElementById("receiverAddress").value += extraRoadAddr;
            } else {
                document.getElementById("receiverAddress").value += '';
            } 
            
            
            
/*
            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            } */
        
        }
    }).open();
});

$('.order-buy').click(function(){
	
	//location.href="PaymentResultList2.do"
	
	
	var count = parseInt('${pa.size()}')-1;
	var payText ="";
	
	if('${pc}' !=""){
		payText = '${pc.cName}';
		
		
	}else{
		payText = '${pa.get(0).cName}'		
	}
	
	if(count>=1){
		
		payText =  '${pa.get(0).cName}'+ ' 외 '+count +'개 ';
		$('.paytext').val(payText);
	}
	var totalAmount = parseInt($('#finalTotalPrice').text());

	
	 CallPayRequest();
	if($('.require').prop("checked")){
		

		var IMP = window.IMP; // 생략가능
		IMP.init('imp03747157'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : payText,
		    amount : 100,//totalAmount,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '${m.userName}',
		    buyer_tel : '${m.phone}',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		    
		    	
		    	//CallPayRequest();
		        
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
		
	}else{
		
		alert("구매진행사항 동의를 체크해주세요");
	}
	

	
	//var  checkList = '${list}';





});

function CallPayRequest(){
	var checkArr = '${CheckArr}';
	var totalArr = new Array();
	var totalPrice = $('#totalSettlePriceView').text();
	var total = new Array();
	console.log("합"+totalPrice);
	var check = 0;


	$('.this-product').find('input[name=cNo]').each(function(i,e){
		
		console.log($(this).val());
		total[check] = totalPrice;
		totalArr[check++] = $(this).val();
		
	});
	
	var username = $('[name="receiverName"]').val();
	var email = $('.orderEmail').val()+$('.orderEmail2').val();
	var address = $('#receiverZonecode').val()+'/'+$('#receiverAddress').val()+'/'+$('.receiverAddressSub').val();	
	var delivaryDate = $('.delivaryDate').val();
	var delivaryTime = $('.delivaryTime').val();
	console.log("이름"+username)
	console.log(email);
	console.log("주소"+address);
	$('.payemail').val(email);
	$('.delivaryCheck').val(delivaryDate+'/'+delivaryTime);
	$('.payaddress').val(address);
	 var form = document.forms["insertPaymentAbout"];
	 
	 
	if('${list}' !=""){

	
	form.action ="PaymentResultList.do?Arr="+totalArr+"&total="+totalPrice;
	 
		 form.submit();
		 

	}else{
		
		
			
			form.action ="PaymentResultProduct.do?total="+totalPrice;
			
		
				 form.submit();
				
	}
}

</script>	

//
<script type="text/javascript">
$(document).ready(function() {
	var check;
	var totalAmount = 0;
	var delivary = 2500;
	var count =0;

	
	console.log(totalAmount);
	
	$('table').find('.totalAmount').each(function(i,e){
		
		totalAmount += parseInt($(this).text());
		count ++;
	});
	console.log("dd"+totalAmount);

	
	if(totalAmount>=20000 || totalAmount==100){
		$('.delivaryAmount').text('배송비 0원');
		delivary=0;
		}
	if(totalAmount ==0){
		delivary =0;
	}
	$('#totalGoodsCnt').text(count);
	$('.totalDeliveryCharge').text(delivary);
	$('.totalGoodsPrice').text(totalAmount);
	$('#totalGoodsPrice2').text(totalAmount);
	$('.totalSettlePrice').text(totalAmount+delivary);
	$('#finalTotalPrice').text(totalAmount+delivary);
	$('#totalSettlePriceView').text(totalAmount+delivary);


});

$(document).ready(function(){
	
	document.getElementById('delivaryDate').value = new Date().toISOString().substring(0, 10);
	//document.getElementById('delivaryTime').value = new Date().toISOString().slice(11, 16);
	var email = '${m.email}'
	var emailSplit = email.split('@');
	var address = '${m.address}';
	var addSplit = address.split('/');
	 console.log(addSplit[0]+'222');
	 $('#receiverZonecode').val(addSplit[0]);
	 $('#receiverAddress').val(addSplit[1]+' '+addSplit[2]);
	 $('.receiverAddressSub').val(addSplit[3]);
	 
	 $('.orderEmail').val(emailSplit[0]);
	 $('.orderEmail2').val('@'+emailSplit[1]);


});


function selectEmail(ele){ 
	var $ele = $(ele);
	var $email2 = $('input[name=orderEmail]'); // '1'인 경우 직접입력
	if($ele.val() == "1")
	{ $email2.attr('readonly', false); 
	$email2.val('');
	}
	else { $email2.attr('readonly', true);
	$email2.val('@'+$ele.val());
	} 
	}
	
	
	$('#shippingNew').click(function(){
		console.log("tt");
		
		$('.orderCheckTable').find('input').each(function(i,e){
			console.log("tt"+$(this).val());
			$(this).val('');
		});
		
		
		
		
	});
	
	$('#shippingSameCheck').click(function(){

		$('[name="receiverName"]').val('${m.userName}');
		$('[name="receiverPhone"]').val('${m.phone}');
		$('[name="receiverCellPhone"]').val('${m.phone}');
		var email = '${m.email}'
		var emailSplit = email.split('@');
		var address = '${m.address}';
		var addSplit = address.split('/');
		 console.log(addSplit[0]+'222');
		 $('#receiverZonecode').val(addSplit[0]);
		 $('#receiverAddress').val(addSplit[1]+' '+addSplit[2]);
		 $('.receiverAddressSub').val(addSplit[3]);
		 
		 $('.orderEmail').val(emailSplit[0]);
		 $('.orderEmail2').val('@'+emailSplit[1]);
		
	});
	
	$('#shippingBasic').click(function(){

		$('[name="receiverName"]').val('${m.userName}');
		$('[name="receiverPhone"]').val('${m.phone}');
		$('[name="receiverCellPhone"]').val('${m.phone}');
		var email = '${m.email}'
		var emailSplit = email.split('@');
		var address = 	'${m.address}';
		var addSplit = address.split('/');
		 console.log(addSplit[0]+'222');
		 $('#receiverZonecode').val(addSplit[0]);
		 $('#receiverAddress').val(addSplit[1]+' '+addSplit[2]);
		 $('.receiverAddressSub').val(addSplit[3]);
		 
		 $('.orderEmail').val(emailSplit[0]);
		 $('.orderEmail2').val('@'+emailSplit[1]);
		
	});
	
	
	
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
          }
          else {
            $( '.area_right' ).removeClass('fixed');
          }
        });
      } );
	


	





</script>

</body>
	<c:import url="../footer/footer.jsp"/>
</html>