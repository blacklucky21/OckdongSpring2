<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.tooltip {
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 20px;
  font-style: normal;
  font-weight: normal;
  line-height: 1.42857143;
  text-align: left;
  text-align: start;
  text-decoration: none;
  text-shadow: none;
  text-transform: none;
  letter-spacing: normal;
  word-break: normal;
  word-spacing: normal;
  word-wrap: normal;
  white-space: normal;
}
.tooltip-inner {
  min-width: 300px;
  padding: 3px 8px;
  color: #fff;
  text-align: center;
  background-color: #3E3E3E;
  border-radius: 7px;
}
</style>
</head>
<body>
	
	<!--/. NAV TOP  -->
	<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">

			<li><a class="active-menu" href="/goMain.do"><i	class="fa fa-dashboard"></i>ERP</a></li>
			
			<!-- 세호 -->
            <li>
                <a href="#" data-toggle="tooltip" data-placement="right" data-container="body" title="부서/사원 관리 및</br>급여/근태를 관리합니다"><i class="fa fa-sitemap"></i>부서 & 사원관리<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                      <li><a href="/department/departmentList.do">부서관리</a></li>
                     <li><a href="#">사원관리<span class="fa arrow"></span></a>
                        <ul class="nav nav-third-level">
                            <li><a href="/employee/employeeList.do">사원관리</a></li>
                            <li><a href="/employee/pmanageList.do">급여관리</a></li>
                            <li><a href="/employee/attendanceList.do">근태관리</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
			
			<!-- 기석 -->
            <li>
                <a href="#" data-toggle="tooltip" data-container="body" data-html="true" data-placement="right" title="창고 및 창고 물품을</br>관리합니다"><i class="fa fa-sitemap"></i>창고 관리<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="/storage/storageList.do">창고 목록</a></li>
                    <li><a href="/storage/storageDetailList.do">창고 상세 목록</a></li>
                </ul>
            </li>

            <li>
                <a href="#" data-toggle="tooltip" data-container="body" data-html="true" data-placement="right" title="기자재 분류 및 기자재를</br>관리합니다"><i class="fa fa-sitemap"></i>기자재 관리<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="/materialscate/mateCateList.do">기자재 분류</a></li>
                    <li><a href="/materialscate/mateList.do">기자재 목록</a></li>
                </ul>
            </li>
			<!-- 원석 -->
            <li>
                <a href="#" data-toggle="tooltip" data-container="body" data-html="true" data-placement="right" title="물품 구매 및 구매 정보를</br>관리합니다"><i class="fa fa-sitemap"></i>매입 관리<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="/buy/buy_lookup.do">구매조회</a></li>
                    <li><a href="/buy/buy_insert.do">구매입력</a></li>
                    <li><a href="/buy/buy_status.do">구매현황</a></li>
                </ul>
            </li>
        	<!-- 효근 -->
            <li>
                <a href="#" data-toggle="tooltip" data-container="body" data-html="true" data-placement="right" title="거래처 관리 및 물품 판매,</br>판매 기록 조회를 관리합니다"><i class="fa fa-sitemap"></i>매출 관리<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                <c:if test="${ !empty employee}">
                    <li>
                    <a href="/sale/partnerList.do?ecode=${employee.eCode}">거래처 관리</a>
                    </li>
                    <li>
                    <a href="/sale/ItemList.do?ecode=${employee.eCode}">물품 판매</a>
                    </li>
                    <li>
                    <a href="/sale/saleRegist.do?ecode=${employee.eCode}">판매 기록</a>
                    </li>
                </c:if>
                <c:if test="${!empty enterprise }">
                    <li>
                    <a href="/sale/partnerList.do?ecode=${enterprise.eCode}">거래처 관리</a>
                    </li>
                    <li>
                    <a href="/sale/ItemList.do?ecode=${enterprise.eCode}">물품 판매</a>
                    </li>
                    <li>
                    <a href="/sale/saleRegist.do?ecode=${enterprise.eCode}">판매 기록</a>
                    </li>
                </c:if>
                </ul>
            </li>
			<!-- 한솔 -->
            <li>
                <a href="#" data-toggle="tooltip" data-container="body" data-html="true" data-placement="right" title="need text"><i class="fa fa-sitemap"></i>생산 관리<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li><a href="/production/job_orderList.do">작업지시서</a></li>
                    <li><a href="/production/in_productList.do">생산입고</a></li>
                </ul>
            </li>	
      
             <li>
                <a href="#" data-toggle="tooltip" data-container="body" data-html="true" data-placement="right" title="need text"><i class="fa fa-sitemap"></i>물품관리<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                   <li><a href="/m_storage/M_storageList.do">발주 목록</a></li>
                   <li><a href="/product/ProductList.do">물품목록</a></li>
                     <li><a href="/product_category/Product_CategoryList.do">물품분류<span class="fa arrow"></span></a>
                         <li><a href="/quality_r/Quality_rList.do">품질관리 요청</a></li>
                         <li><a href="/quality_ch/Quality_chList.do">품질관리 처리</a></li>
                        <ul class="nav nav-third-level">
                            <li><a href="#">생산품목</a></li>
                        </ul>
                    </li>
                    <li><a href="#">생산입고</a></li>
                </ul>
            </li>							
            </li>				
		</ul>

	</div>

	</nav>
	<!-- /. NAV SIDE  -->
</body>
</html>