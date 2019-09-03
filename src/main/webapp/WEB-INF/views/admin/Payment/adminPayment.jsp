<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


.PayPlz td{
margin:5%;
padding:5px;

}


</style>
</head>
<body>

<c:import url="../adminheader.jsp"/>

<div style="margin-left:250px" >
<h1>주문 통합 리스트</h1>


<div style="border:1px solid black; width: 100%;height: 300px; ">
<div class="PayPlz">
 <table style='border-width:1px; border-collapse:collapse;' border="1" class="searchBoard"> 
<tr>
<th> 검색어 </th>
<td>
  <select id="searchForm">
  <option value="allSearch">통합검색</option>
  <option value="Paynum">상품번호</option>
  <option value="PayName">상품명</option>
  <option value="hhhh">주문자아이디</option>
  <option value="audi">주문자번호</option>
</select>

<input type="text" value="222" style="">	


</td>
<td rowspan="4">
<button>검색</button><br>
<button>초기화</button>
</td>
</tr>

<tr>
<th>
주문일자
</th>
<td>

<button class="today">오늘</button>
<button class="today">3일</button>
<button class="today">1주일</button>
<button class="today">1개월</button>

<input type="date" class ="startDatePicker">	~

<input type="date" class = "endDatePicker">
</td>
</tr>
<tr>
<th>주문 상태</th>
<td>
<div class="checkBox Item">
<input type="checkBox" class="checkPay SelectAll ">전체선택
<input type="checkBox" class="checkPay PayConfirm">결제완료
<input type="checkBox" class="checkPay PayReady ">상품준비중
<input type="checkBox" class="checkPay PayDelivary">배송중
<input type="checkBox" class="checkPay DelivaryEnd">배송완료
<input type="checkBox" class="checkPay PayEnd">구매확정
</div>
</td>
</tr>
</table>
		
</div>



</div>
<div style="border:1px solid black; width: 100% ;height: 500px; margin-top:30px">
<div class="search_box search_field">
				<table class="ncp_tbl">
					<colgroup>
						<col width="117px">
						<col>
						<col width="152px">
					</colgroup>
					<tbody>
					<tr class="hide">
						<th><label for="mallNo">쇼핑몰</label></th>
						<td>
							<div class="inputbox_wrap">
								<select name="mallNo" id="mallNo" class="" read-only="" style="pointer-events: none;">
	<option value="15870">shop by star451</option>

</select>
								<span id="partnerSpan" style="display:none">
									파트너사 지정 조회 :
									<div class="search_box">
										<input type="text" id="partnerName" name="partnerName" class="search_text medium" placeholder="파트너명 입력">
										<input type="hidden" id="partnerNo" name="partnerNo" value="0">
										<span class="search_btn"></span> <button type="button" id="partnerReset" class="reset" disabled="">초기화</button>
										<ul class="resultList"></ul>
									</div>
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th>검색어</th>
						<td>
							<div class="inputbox_wrap">
								<select id="searchType" name="searchType">
									<option value="all">전체</option>
									<option value="orderNo">주문번호</option>
									<option value="ordererName">주문자명</option>
									<option value="ordererContact1">주문자휴대전화</option>
									<option value="mallProductNo">상품번호</option>
									<option value="productName">상품명</option>
									<option value="optionValue">옵션값</option>
									
										<option value="receiverName">수령자명</option>
										<option value="receiverContact1">수령자휴대전화</option>
									
								</select>
								<input type="text" placeholder="검색어 입력" id="keyword" name="keyword" class="medium">
							</div>
						</td>
						<td rowspan="8" class="search_btn_wrap">
							<button type="button" id="searchBtn" class="btn_fill">검색</button>
							<button type="button" id="resetBtn">초기화</button>
						</td>
					</tr>
					<tr>
						<th>
							
								
									주문일자
								
								
							
						</th>
						<td>
							
							
							
								<input type="hidden" id="searchDateType" name="searchDateType" value="orderYmdt">
							
							
							<div class="date-picker_area">
								<span class="period_wrap"><button type="button" class="period  " value="0">오늘</button><button type="button" class="period  " value="yesterday">어제</button><button type="button" class="period  " value="3d">3일</button><button type="button" class="period on " value="1w">1주일</button><button type="button" class="period  " value="1m">1개월</button></span><span class="date-picker_wrap " id="startYmdt_wrap" data-type="start">   <div class="tui-datepicker-input tui-datetime-input tui-has-focus">       <input type="text" placeholder="" data-type="start" class="date-picker startYmd " id="startYmdt" name="startYmdt" value="2019-08-27" data-before="2019-08-27" readonly="">       <span class="tui-ico-date"></span>   </div>      <div id="startYmdt_layer" class="startLayer"><div class="tui-datepicker" style="display: none;">
        <div class="tui-datepicker-body tui-datepicker-type-date"><div class="tui-calendar">
    <div class="tui-calendar-header"><div class="tui-calendar-header-inner">
            <a href="#" class="tui-calendar-btn-prev-month">Prev month</a>
            <em class="tui-calendar-title tui-calendar-title-month">2019.08</em>
            <a href="#" class="tui-calendar-btn-next-month">Next month</a>
        </div>

    <div class="tui-calendar-header-info">
        <p class="tui-calendar-title-today">오늘: 2019.09.03 (화)</p>
    </div></div>
    <div class="tui-calendar-body"><table class="tui-calendar-body-inner" cellspacing="0" cellpadding="0">
    <caption><span>Dates</span></caption>
    <thead class="tui-calendar-body-header">
        <tr>
            <th class="tui-sun" scope="col">일</th>
            <th scope="col">월</th>
            <th scope="col">화</th>
            <th scope="col">수</th>
            <th scope="col">목</th>
            <th scope="col">금</th>
            <th class="tui-sat" scope="col">토</th>
        </tr>
    </thead>
    <tbody>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-prev-month tui-calendar-sun tui-is-selectable" data-timestamp="1564239600000">28</td>
                    <td class="tui-calendar-date tui-calendar-prev-month tui-is-selectable" data-timestamp="1564326000000">29</td>
                    <td class="tui-calendar-date tui-calendar-prev-month tui-is-selectable" data-timestamp="1564412400000">30</td>
                    <td class="tui-calendar-date tui-calendar-prev-month tui-is-selectable" data-timestamp="1564498800000">31</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1564585200000">1</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1564671600000">2</td>
                    <td class="tui-calendar-date tui-calendar-sat tui-is-selectable" data-timestamp="1564758000000">3</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-sun tui-is-selectable" data-timestamp="1564844400000">4</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1564930800000">5</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1565017200000">6</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1565103600000">7</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1565190000000">8</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1565276400000">9</td>
                    <td class="tui-calendar-date tui-calendar-sat tui-is-selectable" data-timestamp="1565362800000">10</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-sun tui-is-selectable" data-timestamp="1565449200000">11</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1565535600000">12</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1565622000000">13</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1565708400000">14</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1565794800000">15</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1565881200000">16</td>
                    <td class="tui-calendar-date tui-calendar-sat tui-is-selectable" data-timestamp="1565967600000">17</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-sun tui-is-selectable" data-timestamp="1566054000000">18</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1566140400000">19</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1566226800000">20</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1566313200000">21</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1566399600000">22</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1566486000000">23</td>
                    <td class="tui-calendar-date tui-calendar-sat tui-is-selectable" data-timestamp="1566572400000">24</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-sun tui-is-selectable" data-timestamp="1566658800000">25</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1566745200000">26</td>
                    <td class="tui-calendar-date tui-is-selectable tui-is-selected" data-timestamp="1566831600000">27</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1566918000000">28</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1567004400000">29</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1567090800000">30</td>
                    <td class="tui-calendar-date tui-calendar-sat tui-is-selectable" data-timestamp="1567177200000">31</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-next-month tui-calendar-sun tui-is-selectable" data-timestamp="1567263600000">1</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1567350000000">2</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-calendar-today tui-is-selectable" data-timestamp="1567436400000">3</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1567522800000">4</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1567609200000">5</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1567695600000">6</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-calendar-sat tui-is-selectable" data-timestamp="1567782000000">7</td>
            </tr>
    </tbody>
</table></div>
</div></div>
</div></div></span><span class="wave">~</span><span class="date-picker_wrap " id="endYmdt_wrap" data-type="end">   <div class="tui-datepicker-input tui-datetime-input tui-has-focus">       <input type="text" placeholder="" data-type="end" class="date-picker endYmd " id="endYmdt" name="endYmdt" value="2019-09-03" data-before="2019-09-03" readonly="">       <span class="tui-ico-date"></span>   </div>      <div id="endYmdt_layer" class="endLayer"><div class="tui-datepicker" style="display: none;">
        <div class="tui-datepicker-body tui-datepicker-type-date"><div class="tui-calendar">
    <div class="tui-calendar-header"><div class="tui-calendar-header-inner">
            <a href="#" class="tui-calendar-btn-prev-month">Prev month</a>
            <em class="tui-calendar-title tui-calendar-title-month">2019.09</em>
            <a href="#" class="tui-calendar-btn-next-month">Next month</a>
        </div>

    <div class="tui-calendar-header-info">
        <p class="tui-calendar-title-today">오늘: 2019.09.03 (화)</p>
    </div></div>
    <div class="tui-calendar-body"><table class="tui-calendar-body-inner" cellspacing="0" cellpadding="0">
    <caption><span>Dates</span></caption>
    <thead class="tui-calendar-body-header">
        <tr>
            <th class="tui-sun" scope="col">일</th>
            <th scope="col">월</th>
            <th scope="col">화</th>
            <th scope="col">수</th>
            <th scope="col">목</th>
            <th scope="col">금</th>
            <th class="tui-sat" scope="col">토</th>
        </tr>
    </thead>
    <tbody>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-sun tui-is-selectable" data-timestamp="1567263600000">1</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1567350000000">2</td>
                    <td class="tui-calendar-date tui-calendar-today tui-is-selectable tui-is-selected" data-timestamp="1567436400000">3</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1567522800000">4</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1567609200000">5</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1567695600000">6</td>
                    <td class="tui-calendar-date tui-calendar-sat tui-is-selectable" data-timestamp="1567782000000">7</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-sun tui-is-selectable" data-timestamp="1567868400000">8</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1567954800000">9</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1568041200000">10</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1568127600000">11</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1568214000000">12</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1568300400000">13</td>
                    <td class="tui-calendar-date tui-calendar-sat tui-is-selectable" data-timestamp="1568386800000">14</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-sun tui-is-selectable" data-timestamp="1568473200000">15</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1568559600000">16</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1568646000000">17</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1568732400000">18</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1568818800000">19</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1568905200000">20</td>
                    <td class="tui-calendar-date tui-calendar-sat tui-is-selectable" data-timestamp="1568991600000">21</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-sun tui-is-selectable" data-timestamp="1569078000000">22</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1569164400000">23</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1569250800000">24</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1569337200000">25</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1569423600000">26</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1569510000000">27</td>
                    <td class="tui-calendar-date tui-calendar-sat tui-is-selectable" data-timestamp="1569596400000">28</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-sun tui-is-selectable" data-timestamp="1569682800000">29</td>
                    <td class="tui-calendar-date tui-is-selectable" data-timestamp="1569769200000">30</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1569855600000">1</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1569942000000">2</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1570028400000">3</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1570114800000">4</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-calendar-sat tui-is-selectable" data-timestamp="1570201200000">5</td>
            </tr>
            <tr class="tui-calendar-week">
                    <td class="tui-calendar-date tui-calendar-next-month tui-calendar-sun tui-is-selectable" data-timestamp="1570287600000">6</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1570374000000">7</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1570460400000">8</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1570546800000">9</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1570633200000">10</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-is-selectable" data-timestamp="1570719600000">11</td>
                    <td class="tui-calendar-date tui-calendar-next-month tui-calendar-sat tui-is-selectable" data-timestamp="1570806000000">12</td>
            </tr>
    </tbody>
</table></div>
</div></div>
</div></div></span>
							</div>
						</td>
					</tr>
					<tr class="hide">
						<th>플랫폼구분</th>
						<td>
							<div class="inputbox_wrap">
								<div class="checkbox_wrap checkbox_detail "><span class="checkbox_item"><input type="checkbox" value="ALL" name="platformTypes" id="platformTypes_ALL" target="platformTypes" class=" allCheck" checked="checked"><label for="platformTypes_ALL">전체선택</label></span>
<span class="checkbox_item"><input type="checkbox" value="PC" name="platformTypes" id="platformTypes_1" class="" checked="checked"><label for="platformTypes_1">PC</label></span>
<span class="checkbox_item"><input type="checkbox" value="MOBILE_WEB" name="platformTypes" id="platformTypes_2" class="" checked="checked"><label for="platformTypes_2">모바일 웹</label></span>
<span class="checkbox_item"><input type="checkbox" value="MOBILE_APP" name="platformTypes" id="platformTypes_3" class="" checked="checked"><label for="platformTypes_3">모바일 앱</label></span>
</div>
							</div>
						</td>
					</tr>
					
					<tr class="hide">
						<th>배송방법</th>
						<td>
							<div class="inputbox_wrap">
								<select name="deliveryType" id="deliveryType" class="">
	<option value="" selected="selected">전체</option>
	<option value="PARCEL_DELIVERY">택배/등기/소포</option>
	<option value="DIRECT_DELIVERY">직접배송(화물배달)</option>

</select>
							</div>
						</td>
					</tr>
					
					
						<tr>
							<th>주문/클레임 구분</th>
							<td>
								<div class="radio_wrap">
									<input type="radio" name="claimYn" id="claimN" value="N" checked="checked"><label for="claimN">정상주문</label>
									<input type="radio" name="claimYn" id="claimY" value="Y"><label for="claimY">클레임주문</label>
								</div>
							</td>
						</tr>
						<tr id="orderStatusTr">
							<th>주문상태</th>
							<td>
								<div class="checkbox_wrap checkbox_detail "><span class="checkbox_item"><input type="checkbox" value="ALL" name="orderStatusTypes" id="orderStatusTypes_ALL" target="orderStatusTypes" class=" allCheck" checked="checked"><label for="orderStatusTypes_ALL">전체선택</label></span>
<span class="checkbox_item"><input type="checkbox" value="DEPOSIT_WAIT" name="orderStatusTypes" id="orderStatusTypes_1" class="" checked="checked"><label for="orderStatusTypes_1">입금대기</label></span>
<span class="checkbox_item"><input type="checkbox" value="PAY_DONE" name="orderStatusTypes" id="orderStatusTypes_2" class="" checked="checked"><label for="orderStatusTypes_2">결제완료</label></span>
<span class="checkbox_item"><input type="checkbox" value="PRODUCT_PREPARE" name="orderStatusTypes" id="orderStatusTypes_3" class="" checked="checked"><label for="orderStatusTypes_3">상품준비중</label></span>
<span class="checkbox_item"><input type="checkbox" value="DELIVERY_PREPARE" name="orderStatusTypes" id="orderStatusTypes_4" class="" checked="checked"><label for="orderStatusTypes_4">배송준비중</label></span>
<span class="checkbox_item"><input type="checkbox" value="DELIVERY_ING" name="orderStatusTypes" id="orderStatusTypes_5" class="" checked="checked"><label for="orderStatusTypes_5">배송중</label></span>
<span class="checkbox_item"><input type="checkbox" value="DELIVERY_DONE" name="orderStatusTypes" id="orderStatusTypes_6" class="" checked="checked"><label for="orderStatusTypes_6">배송완료</label></span>
<span class="checkbox_item"><input type="checkbox" value="BUY_CONFIRM" name="orderStatusTypes" id="orderStatusTypes_7" class="" checked="checked"><label for="orderStatusTypes_7">구매확정</label></span>
</div>
							</td>
						</tr>
						<tr id="claimStatusTr" style="display:none">
							<th>클레임상태</th>
							<td>
								<div class="claimCheck">
									<div class="checkbox_wrap checkbox_detail orderList"><span class="checkbox_item"><input type="checkbox" value="ALL" name="claimStatusTypes" id="claimStatusTypes_ALL" target="claimStatusTypes" class=" allCheck" checked="checked"><label for="claimStatusTypes_ALL">전체선택</label>
										<input type="checkbox" value="CANCEL_NO_REFUND" name="claimStatusTypes" id="claimStatusTypes_1" class="" checked="checked"><label for="claimStatusTypes_1">취소완료[환불없음]</label>
										<input type="checkbox" value="CANCEL_REQUEST" name="claimStatusTypes" id="claimStatusTypes_2" class="" checked="checked"><label for="claimStatusTypes_2">취소신청[승인대기]</label>
										<input type="checkbox" value="CANCEL_PROC_REQUEST_REFUND" name="claimStatusTypes" id="claimStatusTypes_3" class="" checked="checked"><label for="claimStatusTypes_3">취소처리[환불보류]</label>
										<input type="checkbox" value="CANCEL_PROC_WAITING_REFUND" name="claimStatusTypes" id="claimStatusTypes_4" class="" checked="checked"><label for="claimStatusTypes_4">취소처리[환불대기]</label>
										<input type="checkbox" value="CANCEL_DONE" name="claimStatusTypes" id="claimStatusTypes_5" class="" checked="checked"><label for="claimStatusTypes_5">취소완료[환불완료]</label>
										<input type="checkbox" value="RETURN_REQUEST" name="claimStatusTypes" id="claimStatusTypes_6" class="" checked="checked"><label for="claimStatusTypes_6">반품신청[승인대기]</label>
										<input type="checkbox" value="RETURN_REJECT_REQUEST" name="claimStatusTypes" id="claimStatusTypes_7" class="" checked="checked"><label for="claimStatusTypes_7">반품신청[철회대기]</label></span>
										<span class="checkbox_item"><input type="checkbox" value="RETURN_PROC_BEFORE_RECEIVE" name="claimStatusTypes" id="claimStatusTypes_8" class="" checked="checked"><label for="claimStatusTypes_8">반품처리[수거진행]</label></span>
										<span class="checkbox_item"><input type="checkbox" value="RETURN_PROC_REQUEST_REFUND" name="claimStatusTypes" id="claimStatusTypes_9" class="" checked="checked"><label for="claimStatusTypes_9">반품처리[환불보류]</label></span>
										<span class="checkbox_item"><input type="checkbox" value="RETURN_PROC_WAITING_REFUND" name="claimStatusTypes" id="claimStatusTypes_10" class="" checked="checked"><label for="claimStatusTypes_10">반품처리[환불대기]</label></span>
										<span class="checkbox_item"><input type="checkbox" value="RETURN_DONE" name="claimStatusTypes" id="claimStatusTypes_11" class="" checked="checked"><label for="claimStatusTypes_11">반품완료[환불완료]</label></span>
									</div>
								</div>
							</td>
						</tr>
					
					<tr class="hide">
						<th>배송구분</th>
						<td>
							<select id="shippingAreaType" name="shippingAreaType">
								<option value="">전체</option>
								<option value="PARTNER_SHIPPING_AREA">파트너사 배송</option>
								<option value="MALL_SHIPPING_AREA">쇼핑몰 배송</option>
							</select>
						</td>
					</tr>
					</tbody>
				</table>
			</div>

</div>


</div>








</body>
</html>