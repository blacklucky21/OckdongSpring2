<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/cart/CartView.css">
<style>


</style>
</head>
<body>
	<c:import url="../header/header.jsp"/>
	
	<div class="content" style="width:100%; text-align:center">
	
	<div class="order-page result-page" style="display:inline-block">
				
	
	
            <div class="step-top">
         
                <div>
                    <span><strong>01</strong> 장바구니</span>
                    <span ><strong>02</strong> 주문서작성/결제</span>
                    <span class=" this end" title="현재페이지"><strong>03</strong> 주문완료</span>
                </div>
            </div>
            <img src="resources/img/etc/delivary.png" alt="배달이요">
            <h2>주문이 완료 되었습니다.</h2>
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
	<c:forEach var="c" items="${list }" varStatus="cart">
                    <tr>
                        <td class="gi this-product">
                            <input type="hidden" name="cartSno[]" value="16">
                            <span><a href=""><img src="${c.c_img }" width="100" alt="AVA SUMMER DENIM" title="AVA SUMMER DENIM" class="middle"></a></span>
                            <div>

                                <a href="">${c.cName }</a>

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
</c:if>			    <c:set var="pm" value="${paymem}"/>
			<c:set var="pp" value="${pPayProduct}" />
			
			<c:if test="${pPayProduct ne null }">
 					 <tr>
                        <td class="gi this-product">
                            <input type="hidden" name="cartSno[]" value="16">
                            <span><a href="../goods/goods_view.php?goodsNo=1000000107"><img src="${pm.p_img}" width="90" alt="AVA SUMMER DENIM" title="AVA SUMMER DENIM" class="middle"></a></span>
                            <div>

                                <a href="../goods/goods_view.php?goodsNo=1000000107">${pp.pname }</a>

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
                          ${pp.pamount}
                        </td>
                        <td class="ta-c this-product">
                            <strong class="price">${pp.pprice}원</strong>
                        </td>
                        <td class="benefits">

                        </td>
                        <td class="ta-c">
                        <strong class="price totalAmount" >${pp.pprice *pp.pamount}</strong><strong class="price">원</strong>
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


             <div class="price-box">
                <div>
                    <p>
                        <span class="detail">총 <em id="totalGoodsCnt"></em>개의 상품금액 <strong id="totalGoodsPrice">0</strong>원</span>
                        <span><img src="resources/img/etc/plus.png" alt="더하기">배송비 <strong class="totalDeliveryCharge">0</strong>원</span>
                        <span class="total"><img src="resources/img/etc/total.png" alt="합계"><strong id="totalSettlePrice">0</strong>원
                        </span>
                    </p>
                   
                </div>
            </div>
        
             <h3>주문자 정보 확인</h3>
                    <div class="table1 orderplz" >
                        <table>
                            <colgroup>
                                <col style="width:133px;">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th class="ta-l required" aria-required="true">주문하시는 분</th>
                                <td>
                                    <div class="txt-field hs" style="width:160px;">
                                        <input type="text" name="payname" value="${pm.payname }" data-pattern="gdEngKor" maxlength="20" class="text">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l">전화번호</th>
                                <td>
                                    <span class="txt-field hs" style="width:160px;">
                                        <input type="text" id="phoneNum" name="payphone" value="${pm.payphone }" maxlength="20" class="text">
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l required" aria-required="true">휴대폰 번호</th>
                                <td>
                                    <span class="txt-field hs" style="width:160px;">
                                        <input type="text" id="mobileNum" name="paycellphone" value="${pm.paycellphone}" maxlength="20" class="text">
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l required" aria-required="true">이메일</th>
                                <td>
                                    <div class="email" style="display:inline">
                                        <span class="txt-field hs" style="width:250px;">
                                            <input type="text" name="orderEmail1" value="${pm.payemail }" class="text orderEmail">
                                           
                                        </span>
                                
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
            
            
 <h3 style="margin-top:60px;">배송지 확인</h3>
                    <div class="table1 orderplz orderCheckTable">
                        <table>
                            <colgroup>
                                <col style="width:133px;">
                                <col>
                            </colgroup>
                            <tbody>
                         
                            <tr>
                                <th class="ta-l required" aria-required="true">받으실분</th>
                                <td>
                                    <div class="txt-field hs" style="width:160px;">
                                        <input type="text" name="receiverName" value="${pm.receiverName}" data-pattern="gdEngKor" maxlength="20" class="text" readonly="readonly">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l required" aria-required="true">받으실 곳</th>
                                <td>
                                    <div class="post" style="width:auto; display:flex">
                                        <div class="txt-field hs" style="width:100px;">
                                            <input type="text" name="receiverZonecode" id="receiverZonecode" placeholder="우편번호"value="${pm.payaddress}" readonly="readonly" style="width:80px; " class="text" >
                                            <input type="hidden" name="receiverZipcode" value="" readonly="readonly">
                                            <span id="receiverZipcodeText" class="text" ></span>
                                               
                                        </div>
                                    
                                    </div>
                                    <div class="sa">
                                        <span class="txt-field hs" style="width:400px;">
                                            <input type="text" name="receiverAddress" readonly="readonly"id="receiverAddress" value="" readonly="readonly" placeholder="기본주소"class="text">
                                        </span>
                                        <span class="txt-field hs" style="width:300px;">
                                            <input type="text" name="receiverAddressSub" readonly="readonly"value="" class="text receiverAddressSub" placeholder="상세주소">
                                        </span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l">전화번호</th>
                                <td>
                                    <span class="txt-field hs" style="width:160px;">
                                        <input type="text" id="receiverPhone" readonly="readonly"name="receiverPhone" value="${pm.receiverPhone}" class="text">
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l required" aria-required="true">휴대폰 번호</th>
                                <td>
                                    <span class="txt-field hs" style="width:160px;">
                                        <input type="text" id="receiverCellPhone" readonly="readonly"name="receiverCellPhone" value="${pm.receiverCellPhone}" class="text">
                                    </span>
                                </td>
                            </tr>   
                            <tr>
                                <th class="ta-l">기사에게 남길말</th>
                                <td>
                                    <div class="txt-field hs">
                                        <input type="text" name="orderMemo" readonly="readonly"value="${pm.orderMemo}" class="text">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l">배송 예약 날짜 </th>
                                <td>
                                    <span class="txt-field hs form-element">
                                  		<input type="text" class="text delivaryDate" readonly="readonly" id="delivaryDate" value="">
                                  	
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <th class="ta-l">배송 예약 시간 </th>
                                <td>
                                    <span class="txt-field hs form-element">
                                  		<input type="text" class="text delivaryDate" readonly="readonly" id="delivaryTime" value="">
                                  	
                                    </span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
            
</div>


	</div>
	
	<script>
	$(document).ready(function() {
		var check;
		var totalAmount = 0;
		var delivary = 2500;
		var count =0;
		delivaryAddressInfo();
		
		console.log(totalAmount);
		
		$('table').find('.totalAmount').each(function(i,e){
			
			totalAmount += parseInt($(this).text());
			count ++;
		});
		console.log("dd"+totalAmount);

		
		if(totalAmount>=20000){
			$('.delivaryAmount').text('배송비 0원');
			delivary=0;
			}
		if(totalAmount ==0){
			delivary =0;
		}
		$('#totalGoodsCnt').text(count);
		$('.totalDeliveryCharge').text(delivary);
		$('#totalGoodsPrice').text(totalAmount);
		$('#totalGoodsPrice2').text(totalAmount);
		$('#totalSettlePrice').text(totalAmount+delivary);
		$('#finalTotalPrice').text(totalAmount+delivary);
		$('#totalSettlePriceView').text(totalAmount+delivary);


	});
	function delivaryAddressInfo(){
		var address = '${pm.payaddress}';
		var addSplit =  address.split('/');
		
		var delivaryTime = '${pm.delivaryDate}';
		var delivarySplit = delivaryTime.split('/');
		
		$('#receiverZonecode').val(addSplit[0]);
		$('#receiverAddress').val(addSplit[1]);
		$('.receiverAddressSub').val(addSplit[2]);
		
		$('#delivaryDate').val(delivarySplit[0]);
		$('#delivaryTime').val(delivarySplit[1]);
		 
		
		

		
		
	}
	
	
	
	</script>
	<c:import url="../footer/footer.jsp"/>
</body>
</html>