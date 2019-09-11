<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/myPage/buyCenter.css">
</head>
<body>
	<div class="centerWrapArea">
		<div class="center_top_content">
			<div class="center_top_title" align="left">주문목록/배송조회</div>
			<input type="hidden" name="date_num" id="date_num" value="2">
			<div class='section_header_v2'	style='width: 937px; height: 140px; border: 1px #ccc solid; 
				box-sizing: border-box; background-color: #F3F4F6;'>
				
				<form action = "buyerHistorySearch.do">
				<div style='float: left; padding-top: 7px; width: 774px;'>
					<div>
						<div style='font-weight: bold; float: left; font-weight: bold; float: left; padding: 0px 10px; margin-top: 7px;'>조회기간</div>
						<div style='float: left;'>
							<table class='section_header_table'>
								<tr>
									<td onclick = 'location.href=""'>어제</td>
									<td onclick = 'location.href=""'>오늘</td>
									<td onclick = 'location.href=""'>1주일</td>
									<td onclick = 'location.href=""'>1개월</td>
									<td onclick = 'location.href=""'>6개월</td>
									<td onclick = 'location.href=""'>1년</td>
								</tr>
							</table>
						</div>


						<!-- 선택조회 끝 -->
						<div style='clear: both;'></div>
					</div>

					<div style='padding-top: 30px;'>
						<div style='font-weight: bold; float: left; padding: 0px 10px; margin-top: 7px;'>상품검색</div>
						<div style='float: left;'>
							<select name="search_type" id="search_type" style='box-sizing: border-box; height: 28px; width: 118px; vertical-align: bottom;'>
								<option value="1">상품명</option>
								<option value="2">주문번호</option>
							</select> 
							<input id="search_text" name="search_text" type='text' style='margin-left: 10px; box-sizing: border-box; height: 28px; width: 559px; padding-left: 10px;' placeholder='상품명 또는 주문번호를 입력하세요.' value="" />
							<div style='padding-top: 6px; padding-left: 3px; font-size: 11px; color: #666;'>
								상품명과 주문번호로만 조회 가능합니다.
							</div>
						</div>

						<div style='clear: both;'></div>
					</div>

				</div>

				<div style='float: left; padding-top: 30px;'>
					<input class="mypage_input1" type="submit" value="조회하기" style='cursor: pointer; display: inline-block; 
							width: 152px; height: 63px; background-color: #454c5f; color: #fff; 
							line-height: 62px; text-align: center;'>
				</div>

				<div style='clear: both;'></div>
			</form>
			</div>

			<!-- 선택조회창 -->
			<div class='article middle_article'>

				<div class='float_left'>
					<div >
						<span class='text-bold text-red'></span> 구매하신 
						<span class='text-bold text-red'>주문</span> 내역입니다.
					</div>
				</div>
				<div class='clear'></div>
			</div>
			<!-- 리스트 -->
			<div class='article main_list'>

				<div class='label'>

					<span class='nth-child1'>주문일/주문번호</span>
					<span class='nth-child2'>상품정보</span> 
					<span class='nth-child3'>결제금액</span>
					<span class='nth-child4'>주문수량</span> 
					<span class='nth-child6'>처리현황</span> 
					<span class='nth-child7'>배송방법</span>

				</div>
				
				<% if(list==null) {%>
				<div class='contents no_data'>1주일 이내에 구매하신 내역이 없습니다.</div>
				<%}else{ 
						for(int i =0; i<list.size(); i++){%>

					<div class='contents data'>
						<div class='contents data1'><%=list.get(i).getPayDate()%>/</div>
						<div class='contents data2'><%=list.get(i).getOrderCheck()%></div>
						<div class='contents productdata'>

						<div class='contents data3'><img alt=""
							src="<%=request.getContextPath()%>/images/product/<%=map.get(list.get(i).getPrdCode()).getChangeName()%>" width="100px" height="100px"></div>
						<div class='contents data4'><a onclick="detail2(<%=list.get(i).getOrderCheck()%>,<%=list.get(i).getOrderCount() %>)"><%=list.get(i).getPrdName() %></a> </div>

						</div>
						<div class='contents data5'><%=list.get(i).getPayPrice()%>원</div>
						<div class='contents data6'><%=list.get(i).getOrderCount() %>개</div>
						<div class='contents data7'><%=list.get(i).getBuyStatus()%></div>
						<div class='contents data9'>
							<button class='data9 btn' onclick="detail()"
								style='cursor: pointer; display: inline-block; 
							width: 70px; height: 23px; background-color: #454c5f; color: #fff';>배송추적</button></div>
						
					</div>
					
					<%} %>
				<%} %>
				
				<script type="text/javascript">
               function trace(i){
                  window.open("http://service.epost.go.kr/trace.RetrieveRegiPrclDeliv.postal?sid1="+i,"배송추적","width=600,height=900");
               }
               function detail(){
           		window.open('<%=request.getContextPath()%>/views/admin/delivery/deliveryDetail.jsp','배송추적', 'width=500, height=700');
           	}
               var x = 0;
           	var y = 0;
           	var check;
           	document.onmousedown=function(){
           		if(check != null){
           			check.close();
           			check = null;
           		}
           	}
           	document.onmousemove=function(){
           		  x=event.x;
           		  y=event.y;
           	}
           	
           	function detail2(sel,count){
           		
           		var h = 100+(50*count);
           		
           		check = window.open('<%=request.getContextPath()%>/Detail.swy?sel='+sel,'상세보기','width=600,height='+h+',left='+x+', top='+y);
           	}
            </script>
            
			</div>
						페이징 처리
						<div class="pagingArea" align="center">
							<%if(entire.equals("전체")){ %>
							
							<button	onclick="location.href='<%=request.getContextPath()%>/view_history?currentPage=1'"><<</button>
							<%if (currentPage <= 1) {	%>
							<button disabled><</button>
							<%} else { %>
							<button	onclick="location.href='<%=request.getContextPath()%>/view_history?currentPage=<%=currentPage - 1%>'"><</button>
							<%}%>
							<%for (int p = startPage; p <= endPage; p++) {
									if (p == currentPage) {	%>
							<button disabled><%=p%></button>
							<%} else {%>
							<button	onclick="location.href='<%=request.getContextPath()%>/view_history?currentPage=<%=p%>'"><%=p%></button>
							<%}%>
							<%}%>
							<%if (currentPage >= maxPage) {%>
							<button disabled>></button>
							<%} else {%>
							<button	onclick="location.href='<%=request.getContextPath()%>/view_history?currentPage=<%=currentPage + 1%>'">></button>
							<%}%>
							<button	onclick="location.href='<%=request.getContextPath()%>/view_history?currentPage=<%=maxPage%>'">>></button>
							
							
							<%}else{ %>
							
							<button	onclick="location.href='<%=request.getContextPath()%>/BuyerHistorySearch?currentPage=1'"><<</button>
							<%if (currentPage <= 1) {	%>
							<button disabled><</button>
							<%} else { %>
							<button	onclick="location.href='<%=request.getContextPath()%>/BuyerHistorySearch?currentPage=<%=currentPage - 1%>'"><</button>
							<%}%>
							<%for (int p = startPage; p <= endPage; p++) {
									if (p == currentPage) {	%>
							<button disabled><%=p%></button>
							<%} else {%>
							<button	onclick="location.href='<%=request.getContextPath()%>/BuyerHistorySearch?currentPage=<%=p%>'"><%=p%></button>
							<%}%>
							<%}%>
							<%if (currentPage >= maxPage) {%>
							<button disabled>></button>
							<%} else {%>
							<button	onclick="location.href='<%=request.getContextPath()%>/BuyerHistorySearch?currentPage=<%=currentPage + 1%>'">></button>
							<%}%>
							<button	onclick="location.href='<%=request.getContextPath()%>/BuyerHistorySearch?currentPage=<%=maxPage%>'">>></button>
							
							<%} %>
<hr class="gshr">

		</div>
	</div>
</div>
</body>
</html> --%>