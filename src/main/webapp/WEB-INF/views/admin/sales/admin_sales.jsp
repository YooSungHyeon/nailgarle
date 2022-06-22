<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
.layout {
	padding-top: 40px;
	width: 100%;
}

.admin_container {
	width: 1250px;
}

.admin_container h1 {
	margin: 40px 0 40px 0;
	text-align: center;
	font-size: 40px;
}

.admin_container .sidebar {
	width: 250px;
	float: left;
}

.admin_container .sidebar .admin_img {
	padding-right: 20px;
}

.admin_container .sidebar ul li a {
	text-decoration: none;
	color: black;
}

.admin_container .sidebar ul li:hover>a {
	font-weight: 800;
	color: #6199ff;
}

.admin_container .sidebar .insales {
	font-weight: 800;
}

.admin_container nav {
	margin-top: 32px;
}

.admin_container ul {
	padding-left: 0;
}

.admin_container li {
	font-size: 18px;
	padding: 30px;
	list-style: none;
}

.sales_container {
	text-align: center;
}

.sales_container h4 {	
	font-size: 12px;
	text-align: left;
	margin-top: 12px;
	padding-left: 300px;
}

.sales_container table {
	width: 950px;
}

/* 관리자페이지 매출 관리 tr, th, td 태그 */
.sales_container .admin_sales th {
	background: #2b2e4a;
	color: #fff;
}

.sales_container .admin_sales td, th {
	padding: 5px 20px;
	font-size: 12px;
}

.sales_container .admin_sales tr:nth-of-type(odd) {
	background: #eee;
}

/* 칼럼 너비 */
.sales_container .admin_sales .slNum {
	width: 10%;
}

.sales_container .admin_sales .stDate {
	width: 8%;
	
}

.sales_container .admin_sales .odAmount {
	width: 8%;
}

.sales_container .admin_sales .rtAmount {
	width: 8%;
}

.sales_container .admin_sales .odPrice {
	width: 8%;
}

.sales_container .admin_sales .rtPrice {
	width: 8%;
}

.sales_container .admin_sales .allPrice {
	width: 10%;
}

/* Search */
.sales_search {
	float: left;
	text-align: left;
	margin: 8px 35px;
}

/* 검색창 검색버튼 */
.search_btn {
	background: url(${contextPath}/resources/image/search_btn.png);
	background-repeat: no-repeat;
	width: 26px;
	height: 26px;
	border: none;
}

.sales_search .search_today {
	margin-bottom: 6px;
}

/* page */

.page_nation {
	border: none;
	padding-top: 30px;
	background-color: white;
}

.page_nation a {
	display: inline-block;
	border: 1px solid #e6e6e6;
	width: 25px;
	height: 25px;
	line-height: 25px;
	text-align: center;
	background-color: #fff;
	font-size: 12px;
	color: #999999;
	text-decoration: none;
}

.page_nation .arrow {
	border: 1px solid #ccc;
}

.page_nation .prev {
	background: #f8f8f8 url('${contextPath}/resources/image/page_prev.png')
		no-repeat center center;
}

.page_nation .next {
	background: #f8f8f8 url('${contextPath}/resources/image/page_next.png')
		no-repeat center center;
}

<!-- CSS부분 삽입-->

</style>
</head>
<body>
<div class="layout">
<!-- body부분 삽입-->
<div class="admin_container">
			<h1>관리자 페이지</h1>
			<div class="sidebar">
				<nav>
					<ul>
						<li><a class="insales" href="${contextPath}/admin/sales/adminMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_sales.svg"/>매출 관리</a></li>
						<li><a href="${contextPath}/admin/goods/adminGoodsMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_product.svg"/>상품 관리</a></li>
						<li><a href="${contextPath}/admin/order/adminOrderMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_order.svg"/>주문/배송 관리</a></li>
						<li><a href="${contextPath}/admin/member/adminMemberMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_member.svg"/>회원 관리</a></li>
						<li><a href="${contextPath}/admin/rental/adminRentalMain.do"><img class="admin_img" src="${contextPath}/resources/image/admin_rental.svg"/>렌탈 관리</a></li>
						<li><a href="${contextPath}/admin/board/adminNoticeBoard.do"><img class="admin_img" src="${contextPath}/resources/image/admin_board.svg"/>게시판 관리</a></li>
					</ul>
				</nav>
			</div>
			<div class="sales_container">
				
				<h4>매출조회</h4>
					<div class="sales_search">
						<div class="search_today">
							<input type="radio" name="searchType" checked="checked" value="당일조회"/>당일 조회
							<input type="date" id="searchType1">
							<input type="button" class="search_btn" id="searchType2" onclick="fn_daySearch()">
						</div>
						
						<div class="search_allday">
							<input type="radio" name="searchType" value="기간조회"/>기간 조회
							<input type="date" id="searchType3" disabled="disabled">~
							<input type="date" id="searchType4" disabled="disabled">
							<input type="button" class="search_btn"id="searchType5" disabled="disabled" onclick="fn_daysSearch()">
						</div>
					</div>
				
				<div class="admin_sales">
					<table>
						<colgroup>
							<col class="slNum">
							<col class="stDate">
							<col class="odAmount">
							<col class="rtAmount">
							<col class="odPrice">
							<col class="rtPrice">
							<col class="allPrice">
						</colgroup>
						<tbody align="center">
							<tr>
								<th>번호</th>
								<th>조회 일자</th>
								<th>판매 수량</th>
								<th>렌탈 수량</th>
								<th>판매 금액</th>
								<th>렌탈 금액</th>
								<th>매출액 합계</th>
							</tr>
							<c:forEach var="item" items="${salesList }" varStatus="cnt">
							<tr>
								<td>${cnt.index+1+((pageNum-1)*10+(secNum-1)*100)}</td>
								<td>${item.startDate }</td>
								<td>${item.orderAmount }</td>
								<td>${item.rentalAmount }</td>
								<td>${item.orderPrice }원</td>
								<td>${item.rentalPrice }원</td>
								<td>${item.orderPrice + item.rentalPrice}원</td>
							</tr>
							</c:forEach>		
						</tbody>
					</table>
				
					<table class="All_sales" style="margin-top: 60px;">
						<tbody align="center">
							<tr>
								<th>총 판매 수량</th>
								<th>총 렌탈 수량</th>
								<th>총 판매 금액</th>
								<th>총 렌탈 금액</th>
								<th>총 매출액</th>
							</tr>
							<tr>
								<td>${allSales.orderAmount }개</td>
								<td>${allSales.rentalAmount }개</td>
								<td>${allSales.orderPrice }원</td>
								<td>${allSales.rentalPrice }원</td>
								<td>${allSales.orderPrice + allSales.rentalPrice }원</td>
							</tr>
							<tr>
								<td colspan="5" class="page_nation" style="padding-top: 20px;">
					                 <c:forEach   var="page" begin="1" end="10" step="1" >
							         <c:if test="${secNum >1 && page==1 }">
							          <a class="arrow prev" href="${contextPath}/admin/sales/adminMain.do?secNum=${secNum-1}&pageNum=1&startDate=${startDate}&endDate=${endDate}"></a>
							         </c:if>
							          <a class="active" href="${contextPath}/admin/sales/adminMain.do?secNum=${secNum}&pageNum=${page}&startDate=${startDate}&endDate=${endDate}">${(secNum-1)*10 +page } </a>
							         <c:if test="${page ==10 }">
							          <a class="arrow next" href="${contextPath}/admin/sales/adminMain.do?secNum=${secNum+1}&pageNum=1&startDate=${startDate}&endDate=${endDate}"></a>
							         </c:if> 
						      		</c:forEach> 
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
</div>
  <script>
  $(document).ready(function(){
	  
	    // 라디오버튼 클릭시 이벤트 발생
	    $("input:radio[name=searchType]").change(function(){
	 	console.log("ddd");
            if($("input:radio[name=searchType]:checked").val()=='당일조회'){
	            $("#searchType1").attr("disabled",false);
	            $("#searchType2").attr("disabled",false);
	            $("#searchType3").attr("disabled",true);
	            $("#searchType4").attr("disabled",true);
	            $("#searchType5").attr("disabled",true);
	            // radio 버튼의 value 값이 1이라면 활성화	 
	        }else if($("input:radio[name=searchType]:checked").val()=='기간조회'){
	              $("#searchType1").attr("disabled",true);
	              $("#searchType2").attr("disabled",true);
	              $("#searchType3").attr("disabled",false);
	              $("#searchType4").attr("disabled",false);
	              $("#searchType5").attr("disabled",false);
	            // radio 버튼의 value 값이 0이라면 비활성화
	        }
	    });
	});
  
  function fn_daySearch() {
		var day = document.getElementById("searchType1").value;
		if(day == ""){
			alert("날짜를 선택해주세요.");
			return false;
		}		
		var formObj = document.createElement("form");
		var i_date = document.createElement("input");

		i_date.name = "date";

		i_date.value = day;

		formObj.appendChild(i_date);

		document.body.appendChild(formObj);
		formObj.method = "get";
		formObj.action = "${contextPath}/admin/sales/daySearch.do";
		formObj.submit();
	}
  function fn_daysSearch() {
		var day1 = document.getElementById("searchType3").value;
		var day2 = document.getElementById("searchType4").value;
		if(day1 == ""){
			alert("날짜를 선택해주세요.");
			return false;
		}
		if(day2 == ""){
			alert("날짜를 선택해주세요.");
			return false;
		}
		var formObj = document.createElement("form");
		var i_date1 = document.createElement("input");
		var i_date2 = document.createElement("input");

		i_date1.name = "startDate";
		i_date2.name = "endDate";

		i_date1.value = day1;
		i_date2.value = day2;

		formObj.appendChild(i_date1);
		formObj.appendChild(i_date2);

		document.body.appendChild(formObj);
		formObj.method = "get";
		formObj.action = "${contextPath}/admin/sales/adminMain.do";
		formObj.submit();
	}
  
  </script>

</body>
</html>