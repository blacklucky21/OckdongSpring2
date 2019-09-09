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
	<c:forEach var="c" items="${list }" varStatus="cart">
                    <tr>
                        <td class="gi this-product">
                            <input type="hidden" name="cartSno[]" value="16">
                            <span><a href="../goods/goods_view.php?goodsNo=1000000107"><img src="https://taegon.kim/wp-content/uploads/2018/05/image-5.png" width="40" alt="AVA SUMMER DENIM" title="AVA SUMMER DENIM" class="middle"></a></span>
                            <div>

                                <a href="../goods/goods_view.php?goodsNo=1000000107">${c.cName }</a>

                                <dl>
                                    <dt>재료 :</dt>
                                    <dd>넣을까
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>말까 :</dt>
                                    <dd>공간
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
</div>
	</div>
	
	<script>
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
	
	</script>
	<c:import url="../footer/footer.jsp"/>
</body>
</html>